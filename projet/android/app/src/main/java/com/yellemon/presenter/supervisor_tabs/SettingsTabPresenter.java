package com.yellemon.presenter.supervisor_tabs;

import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.PasswordChangeRequest;
import com.yellemon.model.SoundInformation;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.supervisor.supervisor_tabs.SupervisorSettingsTab;

//Class that manages the requests sent to the server. It also creates a link between the SettingTab and the server.
//This class implements functions that affects the view and the settings of the application as supervisor.

/**
 * The type Settings tab presenter.
 */
public class SettingsTabPresenter {

    private final SupervisorSettingsTab supervisorSettingsTab;
    private final String username;
    private final RequestManager requestManager;


    /**
     * Instantiates a new Settings tab presenter.
     *
     * @param fragment the fragment
     */
    public SettingsTabPresenter(SupervisorSettingsTab fragment) {
        this.supervisorSettingsTab = fragment;
        this.requestManager = new RequestManager(supervisorSettingsTab.getActivity().getApplicationContext(), true);
        this.username = ((SessionManager) supervisorSettingsTab.getActivity().getApplicationContext()).getUsername();
    }

    /**
     * Get volume from server.
     */
    public void getVolume() {
        requestManager.get(null, SoundInformation.class, "superviseur/" + username + "/volume", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                supervisorSettingsTab.updateVolume((SoundInformation) response);
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorSettingsTab.showError(supervisorSettingsTab.getResources().getString(R.string.volume_load_error));
            }
        });
    }

    /**
     * Adjust volume on server with post request.
     *
     * @param percentage the percentage
     */
    public void adjustVolume(int percentage) {
        String adjustOption;

        if (percentage > 0) {
            adjustOption = "augmenter";
        } else if (percentage < 0) {
            adjustOption = "diminuer";
        } else {
            return;
        }

        percentage = Math.abs(percentage);

        requestManager.post(null, null, "superviseur/" + username + "/volume/" + adjustOption + "/" + percentage, new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                getVolume();
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorSettingsTab.showError(supervisorSettingsTab.getResources().getString(R.string.volume_load_error));
            }
        });
    }

    /**
     * Mute volume on server with post request.
     *
     * @param isMuted the is muted
     */
    public void muteVolume(boolean isMuted) {
        String muteSelection = (isMuted) ? "activer" : "desactiver";
        requestManager.post(null, null, "superviseur/" + username + "/volume/sourdine/" + muteSelection, new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                getVolume();
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorSettingsTab.showError(supervisorSettingsTab.getResources().getString(R.string.mute_load_error));
            }
        });
    }

    /**
     * Change password on server with post request.
     *
     * @param passwordChangeRequest the password change request
     */
    public void changePassword(PasswordChangeRequest passwordChangeRequest) {
        requestManager.post(passwordChangeRequest, null, "superviseur/" + username + "/changement_mdp", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                supervisorSettingsTab.onChangePasswordSuccess();
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorSettingsTab.showError(supervisorSettingsTab.getResources().getString(R.string.password_change_error));
            }
        });
    }

    /**
     * Disconnect from server with post request.
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

    /**
     * Cancel requests.
     */
    public void cancelRequests() {
        requestManager.cancelRequests();
    }
}
