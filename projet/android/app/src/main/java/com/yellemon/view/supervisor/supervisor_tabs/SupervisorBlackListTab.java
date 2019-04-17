package com.yellemon.view.supervisor.supervisor_tabs;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.Toast;

import com.yellemon.adapter.BlackListAdapter;
import com.yellemon.model.Identity;
import com.yellemon.presenter.supervisor_tabs.BlackListTabPresenter;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;

import java.util.ArrayList;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

//This class implements the logic of the supervisor BlackList Tab features and links the front-end layout to that logic with
// the settingsTabPresenter associated to that class.

/**
 * The type Supervisor black list tab.
 */
public class SupervisorBlackListTab extends Fragment {

    private BlackListTabPresenter blackListTabPresenter;
    private List<Identity> blockUsers;
    private SwipeRefreshLayout swipeLayout;
    private View rootView;
    private BlackListAdapter blackListAdapter;
    private PopupWindow unblockPopupWindow;
    private Handler blacklistRequestHandler;
    private Runnable blacklistRequestRunnable;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.blackListTabPresenter = new BlackListTabPresenter(this);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.supervisor_black_list, container, false);

        ListView lvBlackList = rootView.findViewById(R.id.black_list);
        blockUsers = new ArrayList<>();

        setSwipeLayout();

        blackListAdapter = new BlackListAdapter(this.getContext(), this.blockUsers);
        lvBlackList.setAdapter(blackListAdapter);

        lvBlackList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                onItemClickShowUnblockPopupWindow(view, position);
            }
        });

        refreshBlackList();

        return rootView;
    }

    @Override
    public void onResume() {
        final int VOLUME_REQUEST_DELAY = 15000;
        blacklistRequestHandler = new Handler();
        blacklistRequestHandler.postDelayed(blacklistRequestRunnable = new Runnable() {
            public void run() {
                refreshBlackList();
                blacklistRequestHandler.postDelayed(blacklistRequestRunnable, VOLUME_REQUEST_DELAY);
            }
        }, VOLUME_REQUEST_DELAY);

        refreshBlackList();
        super.onResume();
    }

    @Override
    public void onPause() {
        blackListTabPresenter.cancelRequests();
        blacklistRequestHandler.removeCallbacks(blacklistRequestRunnable);
        super.onPause();
    }

    private void refreshBlackList() {
        this.blackListTabPresenter.getBlackList();
    }

    /**
     * Update blacklist.
     *
     * @param blackList the black list
     */
    public void updateBlacklist(final List<Identity> blackList) {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (unblockPopupWindow != null && !unblockPopupWindow.isShowing()) {
                    addBlacklistedUsers(blackList);
                } else if (unblockPopupWindow == null) {
                    addBlacklistedUsers(blackList);
                }
            }
        });
    }

    private void addBlacklistedUsers(List<Identity> blackList) {
        blockUsers.clear();
        blockUsers.addAll(blackList);
        blackListAdapter.notifyDataSetChanged();
    }

    /**
     * On unblock user success.
     */
    public void onUnblockUserSuccess() {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (unblockPopupWindow != null) {
                    unblockPopupWindow.dismiss();
                }
            }
        });

        refreshBlackList();
    }

    /**
     * Show error.
     *
     * @param errorMessage the error message
     */
    public void showError(String errorMessage) {
        Toast.makeText(this.getActivity().getApplicationContext(), errorMessage, Toast.LENGTH_SHORT).show();
    }

    private void onItemClickShowUnblockPopupWindow(View view, final int position) {
        if (unblockPopupWindow != null && unblockPopupWindow.isShowing()) {
            unblockPopupWindow.dismiss();
        }

        unblockPopupWindow = PopupWindowService.show((LayoutInflater) getActivity().getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.supervisor_unblock_user_popup);

        Button unblockUserButton = unblockPopupWindow.getContentView().findViewById(R.id.unblock_user_button);
        unblockUserButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                blackListTabPresenter.unblockUser(blockUsers.get(position));
            }
        });
    }

    private void setSwipeLayout() {
        swipeLayout = rootView.findViewById(R.id.swipe_container_blacklist);
        swipeLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                refreshBlackList();
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        swipeLayout.setRefreshing(false);
                    }
                }, 3000);
            }
        });
        swipeLayout.setColorSchemeColors(
                getResources().getColor(android.R.color.holo_blue_bright),
                getResources().getColor(android.R.color.holo_green_light),
                getResources().getColor(android.R.color.holo_orange_light),
                getResources().getColor(android.R.color.holo_red_light)
        );
    }
}
