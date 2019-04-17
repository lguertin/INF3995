package com.yellemon.presenter;

import android.content.Context;

import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.service.RequestManager;
import com.yellemon.view.SessionManager;
//Class that manages an handles the fragments of the tabs.
//This class also implements the function that sends the disconnect request to the server.

/**
 * The type Supervisor main activity presenter.
 */
public class SupervisorMainActivityPresenter {

    private final RequestManager requestManager;
    private final String username;

    /**
     * Instantiates a new Supervisor main activity presenter.
     *
     * @param context the context
     */
    public SupervisorMainActivityPresenter(Context context) {
        requestManager = new RequestManager(context, true);
        username = ((SessionManager) context).getUsername();
    }


    /**
     * Disconnect from server as supervisor.
     */
    public void disconnectFromServer() {
        requestManager.post(username, null, "superviseur/" + username + "/logout", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
            }

            @Override
            public void onError(int httpErrorCode) {
            }
        });
    }
}
