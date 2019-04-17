package com.yellemon.presenter;

import android.widget.Toast;

import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.Identity;
import com.yellemon.model.TrackList;
import com.yellemon.model.TrackPositionChangeRequest;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.TrackListFragment;

//Class that manages the requests sent to the server. It also creates a link between the Track list fragment and the server.
//This class implements functions that affects the view with drag and drop, swipe to delete ect but only as supervisor and send
// requests to server.

/**
 * The type Track list presenter.
 */
public class TrackListPresenter {

    private final TrackListFragment trackListFragment;
    private final boolean isClient;
    private final RequestManager requestManager;
    private final SessionManager sessionManager;
    private String argQueue;


    /**
     * Instantiates a new Track list presenter.
     *
     * @param trackList      the track list
     * @param sessionManager the session manager
     */
    public TrackListPresenter(TrackListFragment trackList, SessionManager sessionManager) {
        this.trackListFragment = trackList;
        this.sessionManager = sessionManager;
        this.isClient = sessionManager.isClient();
        setArg();
        this.requestManager = new RequestManager(trackList.getActivity().getApplicationContext(), !isClient);
    }


    private void setArg() {
        if (isClient) {
            argQueue = "usager/file/" + String.valueOf(sessionManager.getToken());
        } else {
            argQueue = "superviseur/" + (sessionManager.getUsername()) + "/file/";
        }
    }

    /**
     * Fetch queue.
     */
    public void fetchQueue() {
        requestManager.get(null, com.yellemon.model.TrackList.class, argQueue, new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                trackListFragment.setSongList(((TrackList) response).getTrackList());
            }

            @Override
            public void onError(int httpErrorCode) {
                if (httpErrorCode == 500) {
                    Toast.makeText(trackListFragment.getActivity().getApplicationContext(), R.string.server_unreachable_error, Toast.LENGTH_LONG).show();
                } else if (httpErrorCode == 403) {
                    Toast.makeText(trackListFragment.getActivity().getApplicationContext(), R.string.access_denied_error, Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(trackListFragment.getActivity().getApplicationContext(), trackListFragment.getResources().getString(R.string.unknow_error_number_format, httpErrorCode), Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    /**
     * Change order.
     *
     * @param posArg the pos arg
     */
    public void changeOrder(final TrackPositionChangeRequest posArg) {
        requestManager.post(posArg, null, "superviseur/" + sessionManager.getUsername() + "/position", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                trackListFragment.retrieveAllTracks();
            }

            @Override
            public void onError(int httpErrorCode) {
                trackListFragment.restoreMove();
                handleOrderError(httpErrorCode);
            }
        });
    }

    private void handleOrderError(int httpErrorCode) {
        String message;
        switch (httpErrorCode) {
            case 400:
                message = trackListFragment.getResources().getString(R.string.wrong_request_error);
                break;
            case 401:
                message = trackListFragment.getResources().getString(R.string.user_not_authentified);
                break;
            case 409:
                message = trackListFragment.getResources().getString(R.string.track_invalid_or_position_invalid);
                break;
            default:
                message = trackListFragment.getResources().getString(R.string.unknow_error_number_format, httpErrorCode);
                break;
        }
        Toast toast = Toast.makeText(trackListFragment.getActivity().getApplicationContext(), message, Toast.LENGTH_LONG);
        toast.show();

    }


    /**
     * Delete track.
     *
     * @param position the position
     */
    public void deleteTrack(final int position) {
        String arg;
        if (isClient) {
            arg = "usager/chanson/" + (sessionManager.getToken()) + "/";
        } else {
            arg = "superviseur/" + (sessionManager.getUsername()) + "/chanson/";
        }
        requestManager.delete(null, null, arg + String.valueOf(position), new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                trackListFragment.retrieveAllTracks();
            }

            @Override
            public void onError(int httpErrorCode) {
                trackListFragment.restoreItem();
            }
        });
    }

    /**
     * Block user basing on it's mac address and adds it to the blacklist.
     *
     * @param ip   the ip
     * @param mac  the mac
     * @param name the name
     */
    public void blockUser(String ip, String mac, String name) {
        requestManager.post(new Identity(ip, mac, name), null, "superviseur/" +
                ((SessionManager) trackListFragment.getActivity().getApplicationContext()).getUsername() + "/" + "bloquer", new VolleyResponseListener() {
            @Override
            public void onResponse(Object response) {
                trackListFragment.onBlockUserSuccess();
            }

            @Override
            public void onError(int httpErrorCode) {
                Toast.makeText(trackListFragment.getActivity().getApplicationContext(), R.string.user_block_error_blacklist, Toast.LENGTH_LONG).show();
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
