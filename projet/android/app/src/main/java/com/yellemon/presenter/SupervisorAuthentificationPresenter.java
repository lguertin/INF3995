package com.yellemon.presenter;


import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.Credentials;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.supervisor.SupervisorAuthentificationActivity;

//Class that manages the requests sent to the server. It also creates a link between the Supervisor authentification activity and the server.
//This class implements a function that affects the authentification on the server as supervisor.

/**
 * The type Supervisor authentification presenter.
 */
public class SupervisorAuthentificationPresenter {

    private final SupervisorAuthentificationActivity supervisorAuthentificationActivity;
    private final RequestManager requestManager;


    /**
     * Instantiates a new Supervisor authentification presenter.
     *
     * @param supervisorAuthentificationActivity the supervisor authentification activity
     */
    public SupervisorAuthentificationPresenter(SupervisorAuthentificationActivity supervisorAuthentificationActivity) {
        this.supervisorAuthentificationActivity = supervisorAuthentificationActivity;
        this.requestManager = new RequestManager(supervisorAuthentificationActivity.getApplicationContext(), true);
    }

    /**
     * Connect to server as supervisor with credentials.
     *
     * @param credentials the credentials
     */
    public void connectToServer(final Credentials credentials) {
        requestManager.post(credentials, null, "superviseur/login", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                ((SessionManager) supervisorAuthentificationActivity.getApplicationContext()).reset();
                ((SessionManager) supervisorAuthentificationActivity.getApplicationContext()).setUsername(credentials.getUsername());
                supervisorAuthentificationActivity.startSupervisorMainActivity();
            }

            @Override
            public void onError(int httpErrorCode) {
                String errorMessage;
                if (httpErrorCode == 500) {
                    errorMessage = supervisorAuthentificationActivity.getResources().getString(R.string.server_unreachable_error);
                } else {
                    errorMessage = supervisorAuthentificationActivity.getResources().getString(R.string.wrong_username_or_password_error);
                }
                supervisorAuthentificationActivity.showError(errorMessage);
            }
        });
    }
}
