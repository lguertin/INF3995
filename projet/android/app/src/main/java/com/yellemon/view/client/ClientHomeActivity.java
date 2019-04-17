package com.yellemon.view.client;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.PopupWindow;
import android.widget.Toast;

import com.yellemon.presenter.ClientHomePresenter;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;

//This class implements the logic of the client home features and links the front-end layout to that logic with
// the presenter associated to that class.

/**
 * The type Client home activity.
 */
public class ClientHomeActivity extends AppCompatActivity {

    private ClientHomePresenter clientHomePresenter;
    private EditText clientUsernameText;
    private PopupWindow popupConnectWindow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.client_home_activity);

        clientHomePresenter = new ClientHomePresenter(this);
    }

    /**
     * Select client local tracks.
     *
     * @param view the view
     */
    public void selectClientLocalTracks(View view) {
        Intent intent = new Intent(this, ClientLocalTrackActivity.class);
        startActivity(intent);
    }

    private void selectClientMainActivity() {
        Intent intent = new Intent(this, ClientMainActivity.class);
        startActivity(intent);
    }

    /**
     * On button show popup window click.
     *
     * @param view the view
     */
    public void onButtonShowPopupWindowClick(View view) {
        if (((SessionManager) getApplicationContext()).isClientConnected()) {
            selectClientMainActivity();
        } else {
            popupConnectWindow = PopupWindowService.show((LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.client_connexion_popup);
            clientUsernameText = popupConnectWindow.getContentView().findViewById(R.id.client_name_text_input_id);
        }

    }

    /**
     * Connect to server.
     *
     * @param view the view
     */
    public void connectToServer(View view) {
        if (clientUsernameText.getText() == null) {
            clientHomePresenter.connectToServer("");
        } else {
            clientHomePresenter.connectToServer(clientUsernameText.getText().toString());
        }
    }

    /**
     * Receive token.
     *
     * @param token   the token
     * @param message the message
     */
    public void receiveToken(final int token, final String message) {
        runOnUiThread((new Runnable() {
            @Override
            public void run() {
                ((SessionManager) getApplicationContext()).setToken(token);

                Toast.makeText(ClientHomeActivity.this, message, Toast.LENGTH_LONG).show();

                if (token != -1) {
                    selectClientMainActivity();
                }

                popupConnectWindow.dismiss();
            }
        }));
    }
}
