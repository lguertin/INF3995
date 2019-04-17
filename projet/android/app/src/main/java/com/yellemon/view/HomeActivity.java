package com.yellemon.view;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

import com.yellemon.view.client.ClientHomeActivity;
import com.yellemon.view.supervisor.SupervisorAuthentificationActivity;

//This class implements the logic of the Home features. It intents to client or supervisor depending on user choice.

/**
 * The type Home activity.
 */
public class HomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.home_activity);
    }

    /**
     * Select client home.
     *
     * @param view the view
     */
    public void selectClientHome(View view) {
        Intent intent = new Intent(this, ClientHomeActivity.class);
        ((SessionManager) getApplicationContext()).setIsClient(true);
        startActivity(intent);
    }

    /**
     * Select supervisor connection.
     *
     * @param view the view
     */
    public void selectSupervisorConnection(View view) {
        Intent intent = new Intent(this, SupervisorAuthentificationActivity.class);
        ((SessionManager) getApplicationContext()).setIsClient(false);
        startActivity(intent);
    }
}
