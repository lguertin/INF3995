package com.yellemon.view.client;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.yellemon.model.LocalTrack;
import com.yellemon.presenter.ClientLocalTrackPresenter;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

//This class implements the logic of the client local track features and links the front-end layout to that logic with
// the presenter associated to that class.

/**
 * The type Client local track activity.
 */
public class ClientLocalTrackActivity extends AppCompatActivity {

    private ClientLocalTrackPresenter presenter;
    private List<LocalTrack> localTracks;
    private SwipeRefreshLayout swipeLayout;
    private int selectedTrackId;
    private ProgressBar progressBar;
    private boolean isUploading;
    private PopupWindow popupConnectWindow;
    private EditText clientUsernameText;
    private TrackListAdapter trackListAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.client_local_track_activity);
        presenter = new ClientLocalTrackPresenter(this);

        initialize();
    }

    private void initialize() {
        setTracksList();
        setSwipeLayout();
        setProgressBar();
    }

    private void setProgressBar() {
        progressBar = findViewById(R.id.progressBar);
        progressBar.setVisibility(View.GONE);
    }

    private void setTracksList() {
        getLocalTracks();

        trackListAdapter = new TrackListAdapter(this, localTracks);
        ListView trackListView = findViewById(R.id.track_list_view);
        trackListView.setAdapter(trackListAdapter);
        selectedTrackId = -1;
        trackListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position,
                                    long id) {
                selectedTrackId = (selectedTrackId == position) ? -1 : position;
                trackListAdapter.notifyDataSetChanged();
            }
        });

    }

    private void setSwipeLayout() {
        swipeLayout = findViewById(R.id.swipe_container);
        swipeLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                setTracksList();
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

    private void getLocalTracks() {
        localTracks = presenter.getLocalTracks();
    }

    /**
     * Upload track.
     *
     * @param view the view
     */
    public void uploadTrack(View view) {
        if (((SessionManager) getApplicationContext()).isClientConnected()) {
            cooldownUploadButton();

            if (selectedTrackId >= 0 && selectedTrackId < localTracks.size()) {
                presenter.uploadTrack(localTracks.get(selectedTrackId));
                progressBar.setVisibility(View.VISIBLE);
            } else {
                Toast.makeText(this.getApplicationContext(), R.string.no_song_selected, Toast.LENGTH_SHORT).show();
            }

            selectedTrackId = -1;
            trackListAdapter.notifyDataSetChanged();
        } else {
            isUploading = true;
            showConnectionPopup(view);
        }
    }

    /**
     * Cooldowns the upload button to prevent upload spam.
     */
    private void cooldownUploadButton() {
        final Button uploadButton = findViewById(R.id.upload_button);
        uploadButton.setEnabled(false);

        Timer buttonTimer = new Timer();
        buttonTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        uploadButton.setEnabled(true);
                    }
                });
            }
        }, 700);
    }

    /**
     * On show track list button click.
     *
     * @param view the view
     */
    public void onShowTrackListButtonClick(View view) {
        if (((SessionManager) getApplicationContext()).isClientConnected()) {
            selectClientMainActivity();
        } else {
            isUploading = false;
            showConnectionPopup(view);
        }
    }

    /**
     * Receive token.
     *
     * @param token   the token
     * @param message the message
     */
    public void receiveToken(final int token, final String message) {
        runOnUiThread((new Runnable() {
            @Override
            public void run() {
                ((SessionManager) getApplicationContext()).setToken(token);

                Toast.makeText(ClientLocalTrackActivity.this, message, Toast.LENGTH_LONG).show();

                if (token != -1) {
                    if (isUploading) {
                        uploadTrack(null);
                    } else {
                        onShowTrackListButtonClick(null);
                    }
                }

                popupConnectWindow.dismiss();
            }
        }));
    }

    private void showConnectionPopup(View view) {
        popupConnectWindow = PopupWindowService.show((LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.client_connexion_popup);
        clientUsernameText = popupConnectWindow.getContentView().findViewById(R.id.client_name_text_input_id);
    }

    /**
     * Connect to server.
     *
     * @param view the view
     */
    public void connectToServer(View view) {
        if (clientUsernameText.getText() == null) {
            presenter.connectToServer("");
        } else {
            presenter.connectToServer(clientUsernameText.getText().toString());
        }
    }

    private void selectClientMainActivity() {
        Intent activityIntent = getIntent();
        Boolean hasTrackParentActivity = activityIntent.getBooleanExtra("hasTrackParentActivity", false);

        if (hasTrackParentActivity.booleanValue()) {
            finish();
        } else {
            Intent intent = new Intent(this, ClientMainActivity.class);
            intent.putExtra("hasTrackParentActivity", true);
            startActivity(intent);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        switch (requestCode) {
            case 1: {
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    setTracksList();
                } else {
                    showPermissionsRationale();
                }
            }
        }
    }

    private void showPermissionsRationale() {
        AlertDialog alert = new AlertDialog.Builder(this)
                .setTitle(R.string.permissions_needed)
                .setMessage(R.string.permissions_rationale_text)

                .setPositiveButton(R.string.confirm, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        getLocalTracks();
                    }
                })

                .setNegativeButton(R.string.back, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        finish();
                    }
                })
                .setIcon(android.R.drawable.ic_dialog_alert)
                .show();
        alert.setCancelable(false);
    }

    /**
     * Stop progress bar.
     */
    public void stopProgressBar() {
        progressBar.setVisibility(View.GONE);
    }

    private static class ViewHolder {
        private TextView trackIdView;
        private TextView trackNameView;

    }

    /**
     * The type Track list adapter.
     */
    class TrackListAdapter extends ArrayAdapter<LocalTrack> {
        private final Activity context;
        private final List<LocalTrack> tracks;

        /**
         * Instantiates a new Track list adapter.
         *
         * @param context the context
         * @param tracks  the tracks
         */
        TrackListAdapter(Activity context, List<LocalTrack> tracks) {
            super(context, R.layout.client_local_track_row_item, tracks);

            this.context = context;
            this.tracks = tracks;
        }

        @Override
        public View getView(int position, View view, ViewGroup parent) {
            ViewHolder viewHolder;

            if (view == null) {
                LayoutInflater inflater = context.getLayoutInflater();
                view = inflater.inflate(R.layout.client_local_track_row_item, parent, false);


                viewHolder = new ViewHolder();

                viewHolder.trackIdView = view.findViewById(R.id.list_track_id);
                viewHolder.trackNameView = view.findViewById(R.id.list_track_name);

                view.setTag(viewHolder);

            } else {
                viewHolder = (ViewHolder) view.getTag();
            }

            String trackName = this.tracks.get(position).getFileName();
            String trackIdViewText = Integer.toString(position + 1) + " - ";
            viewHolder.trackIdView.setText(trackIdViewText);
            String trackNameViewText = trackName.substring(0, trackName.lastIndexOf('.'));
            viewHolder.trackNameView.setText(trackNameViewText);

            if (selectedTrackId == position) {
                view.setSelected(true);
                view.setPressed(true);
                view.setBackgroundColor(getResources().getColor(R.color.dark_grey));
            } else {
                view.setSelected(true);
                view.setPressed(true);
                view.setBackgroundColor(getResources().getColor(R.color.white));
            }

            return view;

        }
    }
}
