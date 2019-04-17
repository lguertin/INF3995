package com.yellemon.view.client;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.yellemon.interfaces.OnFragmentInteractionListener;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;

//This class implements the logic of the client main features and links the front-end layout to that logic with
// the presenter associated to that class.

/**
 * The type Client main activity.
 */
public class ClientMainActivity extends AppCompatActivity implements OnFragmentInteractionListener {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.client_list_activity);
    }

    /**
     * Select client local tracks.
     *
     * @param view the view
     */
    public void selectClientLocalTracks(View view) {
        Intent activityIntent = getIntent();
        Boolean hasTrackParentActivity = activityIntent.getBooleanExtra("hasTrackParentActivity", false);

        if (hasTrackParentActivity.booleanValue()) {
            finish();
        } else {
            Intent intent = new Intent(this, ClientLocalTrackActivity.class);
            intent.putExtra("hasTrackParentActivity", true);
            startActivity(intent);
        }
    }

    @Override
    public void onFragmentInteraction(Uri uri) {
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.help_button, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_help) {
            onButtonShowHelpPopupWindow(findViewById(android.R.id.content));
        }
        return super.onOptionsItemSelected(item);
    }

    public void onButtonShowHelpPopupWindow(View view) {
        PopupWindowService.show((LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.client_help_popup);
    }
}

