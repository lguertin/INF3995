package com.yellemon.presenter;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Environment;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Base64;
import android.widget.Toast;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.yellemon.interfaces.VolleyResponseListener;
import com.yellemon.model.ClientConnectionResponse;
import com.yellemon.model.Identity;
import com.yellemon.model.LocalTrack;
import com.yellemon.service.NetworkService;
import com.yellemon.service.RequestManager;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.client.ClientLocalTrackActivity;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//Class that manages the requests sent to the server. It also creates a link between the local track activity and the server.
//This class implements functions that affects the view and the local tracks and upload tracks to the server.

/**
 * The type Client local track presenter.
 */
public class ClientLocalTrackPresenter {

    private final ClientLocalTrackActivity clientLocalTrackActivity;
    private final RequestQueue trackRequestQueue;
    private final RequestManager requestManager;


    /**
     * Instantiates a new Client local track presenter.
     *
     * @param clientLocalTrackActivity the client local track activity
     */
    public ClientLocalTrackPresenter(ClientLocalTrackActivity clientLocalTrackActivity) {
        this.clientLocalTrackActivity = clientLocalTrackActivity;
        this.requestManager = new RequestManager(clientLocalTrackActivity.getApplicationContext(), false);
        this.trackRequestQueue = Volley.newRequestQueue(clientLocalTrackActivity);
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
                clientLocalTrackActivity.receiveToken(((ClientConnectionResponse) response).getId(), ((ClientConnectionResponse) response).getMessage());
            }

            @Override
            public void onError(int httpErrorCode) {
                Toast.makeText(clientLocalTrackActivity.getApplicationContext(), R.string.server_unreachable_error, Toast.LENGTH_LONG).show();
            }
        });
    }

    /**
     * Gets local tracks.
     *
     * @return the local tracks
     */
    public List<LocalTrack> getLocalTracks() {
        getReadPermissions();
        List<LocalTrack> localTracks = new ArrayList<>();
        if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
            localTracks.addAll(getDirectoryTracks(Environment.getExternalStorageDirectory()));
        }

        File externalSD = new File("/storage/");
        for (File externalDir : externalSD.listFiles()) {
            if (!externalDir.getAbsolutePath().equalsIgnoreCase(Environment.getExternalStorageDirectory().getAbsolutePath())) {
                localTracks.addAll(getDirectoryTracks(externalDir));
            }
        }

        return localTracks;
    }

    /**
     * Upload track.
     *
     * @param track the track
     */
    public void uploadTrack(LocalTrack track) {
        File trackFile = new File(track.getFilePath());

        if (trackFile.exists()) {
            try (FileInputStream fileInputStream = new FileInputStream(trackFile)) {
                byte[] trackBytes = new byte[(int) trackFile.length()];
                fileInputStream.read(trackBytes);
                uploadTrackToServer(Base64.encode(trackBytes, Base64.NO_WRAP | Base64.NO_PADDING));

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            Toast.makeText(clientLocalTrackActivity, "Erreur d'envoi de la chanson.", Toast.LENGTH_SHORT).show();
            clientLocalTrackActivity.stopProgressBar();
        }
    }

    private void uploadTrackToServer(final byte[] trackContent) {
        String url = RequestManager.SERVER_URL + "usager/chanson/" + ((SessionManager) clientLocalTrackActivity.getApplicationContext()).getToken();
        StringRequest postRequest = new StringRequest(Request.Method.POST, url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Toast.makeText(clientLocalTrackActivity, R.string.track_upload_success, Toast.LENGTH_SHORT).show();
                        clientLocalTrackActivity.stopProgressBar();
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        if (error.networkResponse != null) {
                            clientLocalTrackActivity.stopProgressBar();
                            handleServerError(error.networkResponse.statusCode);
                        } else {
                            clientLocalTrackActivity.stopProgressBar();
                            Toast.makeText(clientLocalTrackActivity, R.string.track_upload_error, Toast.LENGTH_SHORT).show();
                        }
                    }
                }
        ) {
            @Override
            public byte[] getBody() {
                return trackContent;
            }
        };
        postRequest.setRetryPolicy(new DefaultRetryPolicy(30000, 0, 1));
        trackRequestQueue.add(postRequest);
    }

    private void handleServerError(int statusCode) {
        switch (statusCode) {
            case 403:
                Toast.makeText(clientLocalTrackActivity, R.string.access_denied_error, Toast.LENGTH_SHORT).show();
                break;
            case 413:
                Toast.makeText(clientLocalTrackActivity, R.string.track_upload_limit_reached, Toast.LENGTH_LONG).show();
                break;
            case 415:
                Toast.makeText(clientLocalTrackActivity, R.string.track_id3_header_missing, Toast.LENGTH_LONG).show();
                break;
            default:
                Toast.makeText(clientLocalTrackActivity, R.string.track_upload_error, Toast.LENGTH_SHORT).show();
                break;
        }
    }

    private List<LocalTrack> getDirectoryTracks(File directory) {
        List<LocalTrack> localTracks = new ArrayList<>();
        File[] files = directory.listFiles();

        if (files == null)
            return localTracks;

        for (File file : files) {
            if (file.isDirectory()) {
                localTracks.addAll(getDirectoryTracks(file));
            } else {
                if (file.getName().endsWith(".mp3")) {
                    localTracks.add(new LocalTrack(file.getName(), file.getAbsolutePath()));
                }
            }
        }

        return localTracks;
    }

    private void getReadPermissions() {
        if (ContextCompat.checkSelfPermission(clientLocalTrackActivity, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(clientLocalTrackActivity, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, 1);
        }
    }
}
