package com.yellemon.presenter;

import android.widget.Toast;

import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.ClientConnectionResponse;
import com.yellemon.model.Identity;
import com.yellemon.service.NetworkService;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.client.ClientHomeActivity;

//Class that manages the requests sent to the server. It also creates a link between the Client home activity and the server.
//This class implements functions that affects of the application as a client when logged in a user.

/**
 * The type Client home presenter.
 */
public class ClientHomePresenter {
    private final ClientHomeActivity clientHomeActivity;
    private final RequestManager requestManager;


    /**
     * Instantiates a new Client home presenter.
     *
     * @param clientHomeActivity the client home activity
     */
    public ClientHomePresenter(ClientHomeActivity clientHomeActivity) {
        this.clientHomeActivity = clientHomeActivity;
        requestManager = new RequestManager(clientHomeActivity.getApplicationContext(), false);
    }

    /**
     * Connect to server as client user.
     *
     * @param username the username
     */
    public void connectToServer(String username) {
        Identity identity = new Identity(NetworkService.getDeviceIp(), NetworkService.getDeviceMAC(), username);

        requestManager.post(identity, ClientConnectionResponse.class, "usager/identification", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                clientHomeActivity.receiveToken(((ClientConnectionResponse) response).getId(), ((ClientConnectionResponse) response).getMessage());
            }

            @Override
            public void onError(int httpErrorCode) {
                Toast.makeText(clientHomeActivity.getApplicationContext(), R.string.server_unreachable_error, Toast.LENGTH_LONG).show();
            }
        });
    }
}
