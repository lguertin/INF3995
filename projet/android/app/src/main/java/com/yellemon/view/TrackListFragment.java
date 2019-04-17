package com.yellemon.view;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.app.Fragment;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.widget.Toast;

import com.yellemon.adapter.TracksAdapter;
import com.yellemon.interfaces.ClickListener;
import com.yellemon.interfaces.OnFragmentInteractionListener;
import com.yellemon.interfaces.StartDragListener;
import com.yellemon.listener.ItemMoveCallback;
import com.yellemon.listener.RecyclerTouchListener;
import com.yellemon.model.Track;
import com.yellemon.model.TrackPositionChangeRequest;
import com.yellemon.presenter.TrackListPresenter;
import com.yellemon.service.PopupWindowService;

import java.util.ArrayList;
import java.util.List;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;


/**
 * The type Track list fragment.
 */
public class TrackListFragment extends Fragment implements StartDragListener {

    private List<Track> trackList;
    private RecyclerView recyclerView;
    private boolean isClient;
    private TrackListPresenter trackListPresenter;
    private OnFragmentInteractionListener mListener;
    private TracksAdapter tracksAdapter;
    private SwipeRefreshLayout swipeLayout;
    private View rootView;
    private Runnable runnable;
    private Handler handler;
    private Parcelable recyclerViewState;
    private PopupWindow blockUserPopupWindow;
    private boolean isMoving = false;
    private ItemMoveCallback callback;

    /**
     * Instantiates a new Track list fragment.
     */
    public TrackListFragment() {
    }

    /**
     * New instance track list fragment.
     *
     * @return the track list fragment
     */
    public static TrackListFragment newInstance() {
        return new TrackListFragment();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        rootView = inflater.inflate(R.layout.track_list_fragment, container, false);
        trackList = new ArrayList<>();
        trackListPresenter = new TrackListPresenter(this, ((SessionManager) getActivity().getApplicationContext()).getSessionManager());
        init();
        return rootView;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.isClient = ((SessionManager) getActivity().getApplicationContext()).isClient();
        handler = new Handler();
    }

    /**
     * Set song list.
     *
     * @param tracks the tracks
     */
    public void setSongList(final List<Track> tracks) {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (!callback.isSwiping()) {
                    trackList.clear();
                    trackList.addAll(tracks);
                    tracksAdapter.notifyDataSetChanged();
                }
            }
        });
    }

    private void init() {
        setRecyclerView();
        setSwipeLayout();
        setClickListener();
        setDragAndDrop();
        retrieveAllTracks();
    }

    private void setDragAndDrop() {
        tracksAdapter = new TracksAdapter(trackList, this);
        callback = new ItemMoveCallback(tracksAdapter, getContext());
        ItemTouchHelper touchHelper = new ItemTouchHelper(callback);
        touchHelper.attachToRecyclerView(recyclerView);
        recyclerView.setAdapter(tracksAdapter);
    }

    private void selectLyrics(Track track) {
        if (!track.getTitle().equals("Unknown") && !track.getArtist().equals("Unknown")) {
            Intent intent = new Intent(this.getActivity(), LyricsActivity.class);
            intent.putExtra("artist", track.getArtist());
            intent.putExtra("trackName", track.getTitle());
            startActivity(intent);
        } else {
            Toast.makeText(this.getContext(), R.string.lyrics_not_fetchable, Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Retrieve all tracks.
     */
    public void retrieveAllTracks() {
        trackListPresenter.fetchQueue();
    }

    private void setRecyclerView() {
        recyclerView = rootView.findViewById(R.id.my_recycler_view);
        RecyclerView.LayoutManager mLayoutManager = new LinearLayoutManager(getActivity().getApplicationContext());
        recyclerView.setLayoutManager(mLayoutManager);
        recyclerView.setItemAnimator(new DefaultItemAnimator());
        recyclerView.addItemDecoration(new DividerItemDecoration(this.getActivity(), LinearLayoutManager.VERTICAL));
    }

    private void setSwipeLayout() {
        swipeLayout = rootView.findViewById(R.id.swipe_container);
        swipeLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                retrieveAllTracks();
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

    /**
     * Restore move.
     */
    public void restoreMove() {
        this.retrieveAllTracks();
    }

    private void setClickListener() {
        recyclerView.addOnItemTouchListener(new RecyclerTouchListener(getActivity().getApplicationContext(), recyclerView, new ClickListener() {
            @Override
            public void onClick(View view, int position) {

            }

            @Override
            public void onDoubleClick(View view, int position) {
                Track track = trackList.get(position);
                if (isClient) {
                    selectLyrics(track);
                } else {
                    selectPopUpBlockUser(view, track);
                }
            }

            @Override
            public void onItemLongClick(View view, int position) {
                isMoving = !callback.isSwiping();

            }
        }));
    }

    private void selectPopUpBlockUser(View view, final Track track) {
        blockUserPopupWindow = PopupWindowService.show((LayoutInflater) getActivity().getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.supervisor_block_user_popup);
        TextView mac = blockUserPopupWindow.getContentView().findViewById(R.id.mac_sender);
        TextView ip = blockUserPopupWindow.getContentView().findViewById(R.id.ip_sender);
        TextView sender = blockUserPopupWindow.getContentView().findViewById(R.id.sender);

        mac.setText(track.getMAC());
        ip.setText(track.getIp());

        if (track.getSender().equals("")) {
            sender.setText(R.string.unknown);
        } else {
            sender.setText(track.getSender());
        }

        Button blockUserButton = blockUserPopupWindow.getContentView().findViewById(R.id.block_user_button);
        blockUserButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                trackListPresenter.blockUser(track.getIp(), track.getMAC(), track.getSender());
            }
        });
    }

    /**
     * On block user success.
     */
    public void onBlockUserSuccess() {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (blockUserPopupWindow != null) {
                    blockUserPopupWindow.dismiss();
                }

                Toast.makeText(getActivity().getApplicationContext(), R.string.user_block_success_blacklist, Toast.LENGTH_SHORT).show();
            }
        });
    }

    @Override
    public void onResume() {
        retrieveAllTracks();
        final int delay = 10 * 1000;
        handler.postDelayed(runnable = new Runnable() {
            public void run() {
                retrieveAllTracks();
                handler.postDelayed(runnable, delay);
            }
        }, delay);

        super.onResume();
        recyclerView.getLayoutManager().onRestoreInstanceState(recyclerViewState);

    }

    @Override
    public void onPause() {
        trackListPresenter.cancelRequests();
        handler.removeCallbacks(runnable);
        super.onPause();
        recyclerViewState = recyclerView.getLayoutManager().onSaveInstanceState();
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    @Override
    public void itemDrop(int oldPos, int newPos) {
        if(newPos==0){
            retrieveAllTracks();
        }
        if (oldPos != newPos && isMoving) {
            trackListPresenter.changeOrder(new TrackPositionChangeRequest(oldPos, newPos));
        }
        isMoving = false;
    }

    @Override
    public void itemSwiped(int position) {
        trackListPresenter.deleteTrack(position);
        tracksAdapter.notifyDataSetChanged();
    }

    /**
     * Restore item.
     */
    public void restoreItem() {
        this.retrieveAllTracks();
    }
}
