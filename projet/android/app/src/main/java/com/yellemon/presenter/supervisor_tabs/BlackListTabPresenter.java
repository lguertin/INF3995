package com.yellemon.presenter.supervisor_tabs;

import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.BlackList;
import com.yellemon.model.BlacklistUnblockRequest;
import com.yellemon.model.Identity;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.supervisor.supervisor_tabs.SupervisorBlackListTab;

//Class that manages the requests sent to the server. It also creates a link between the BlacklistTab and the server.
//This class implements functions that affects the view and the Blacklist of the application as supervisor.

/**
 * The type Black list tab presenter.
 */
public class BlackListTabPresenter {
    private final SupervisorBlackListTab supervisorBlackListTab;
    private final String username;
    private final RequestManager requestManager;

    /**
     * Instantiates a new Black list tab presenter.
     *
     * @param supervisorBlackListTab the supervisor black list tab
     */
    public BlackListTabPresenter(SupervisorBlackListTab supervisorBlackListTab) {
        this.supervisorBlackListTab = supervisorBlackListTab;
        this.requestManager = new RequestManager(this.supervisorBlackListTab.getActivity().getApplicationContext(), true);
        this.username = ((SessionManager) this.supervisorBlackListTab.getActivity().getApplicationContext()).getUsername();
    }

    /**
     * Gets black list.
     */
    public void getBlackList() {
        requestManager.get(null, BlackList.class, "superviseur/" + username + "/listenoire", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                supervisorBlackListTab.updateBlacklist(((BlackList) response).getBlackList());
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorBlackListTab.showError(supervisorBlackListTab.getResources().getString(R.string.unable_to_load_blacklist));
            }
        });
    }

    /**
     * Unblock user from ip and mac address.
     *
     * @param identity the identity
     */
    public void unblockUser(Identity identity) {
        requestManager.post(new BlacklistUnblockRequest(identity.getMac()), null, "superviseur/" + username + "/debloquer", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                supervisorBlackListTab.onUnblockUserSuccess();
            }

            @Override
            public void onError(int httpErrorCode) {
                supervisorBlackListTab.showError(supervisorBlackListTab.getResources().getString(R.string.user_unblock_error_blacklist));
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
