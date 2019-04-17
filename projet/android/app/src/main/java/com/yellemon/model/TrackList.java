package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * The type Track list.
 */
public class TrackList {
    @SerializedName("chansons")
    private List<Track> trackList;

    /**
     * Gets track list.
     *
     * @return the track list
     */
    public List<Track> getTrackList() {
        return trackList;
    }

    /**
     * Sets track list.
     *
     * @param trackList the track list
     */
    public void setTrackList(List<Track> trackList) {
        this.trackList = trackList;
    }
}
