package com.yellemon.view.supervisor;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.yellemon.model.Credentials;
import com.yellemon.presenter.SupervisorAuthentificationPresenter;
import com.yellemon.view.R;

//This class implements the logic of the supervisor authentification features and links the front-end layout to that logic with
// the presenter associated to that class.

/**
 * The type Supervisor authentification activity.
 */
public class SupervisorAuthentificationActivity extends AppCompatActivity {

    private SupervisorAuthentificationPresenter presenter;
    private final View.OnClickListener connect = new View.OnClickListener() {
        public void onClick(View v) {
            presenter.connectToServer(getCredentials());
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.supervisor_authentification_activity);

        presenter = new SupervisorAuthentificationPresenter(this);

        Button connectButton = findViewById(R.id.connectButton);
        connectButton.setOnClickListener(connect);
    }

    @Override
    public void onResume() {
        EditText usernameInput = findViewById(R.id.username);
        usernameInput.setText("");

        EditText passwordInput = findViewById(R.id.password);
        passwordInput.setText("");

        usernameInput.requestFocus();

        super.onResume();
    }

    /**
     * Start supervisor main activity.
     */
    public void startSupervisorMainActivity() {
        Intent intent = new Intent(this, SupervisorMainActivity.class);
        startActivity(intent);
    }

    /**
     * Show error.
     *
     * @param errorMessage the error message
     */
    public void showError(String errorMessage) {
        Toast.makeText(this.getApplicationContext(), errorMessage, Toast.LENGTH_LONG).show();
    }

    private Credentials getCredentials() {
        return new Credentials(((EditText) findViewById(R.id.username)).getText().toString(),
                ((EditText) findViewById(R.id.password)).getText().toString());
    }
}





