package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Track position change request.
 */
public class TrackPositionChangeRequest {
    @SerializedName("ancien")
    private int oldPosition;

    @SerializedName("nouveau")
    private int newPosition;

    /**
     * Instantiates a new Track position change request.
     *
     * @param oldPosition the old position
     * @param newPosition the new position
     */
    public TrackPositionChangeRequest(int oldPosition, int newPosition) {
        this.oldPosition = oldPosition;
        this.newPosition = newPosition;
    }

    /**
     * Instantiates a new Track position change request.
     */
    public TrackPositionChangeRequest() {
    }

    /**
     * Gets old position.
     *
     * @return the old position
     */
    public int getOldPosition() {
        return oldPosition;
    }

    /**
     * Sets old position.
     *
     * @param oldPosition the old position
     */
    public void setOldPosition(int oldPosition) {
        this.oldPosition = oldPosition;
    }

    /**
     * Gets new position.
     *
     * @return the new position
     */
    public int getNewPosition() {
        return newPosition;
    }

    /**
     * Sets new position.
     *
     * @param newPosition the new position
     */
    public void setNewPosition(int newPosition) {
        this.newPosition = newPosition;
    }
}
