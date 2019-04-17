package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Sound information.
 */
public class SoundInformation {
    @SerializedName("volume")
    private int volume;

    @SerializedName("sourdine")
    private boolean isMuted;

    /**
     * Instantiates a new Sound information.
     */
    public SoundInformation() {
    }

    /**
     * Instantiates a new Sound information.
     *
     * @param volume  the volume
     * @param isMuted the is muted
     */
    public SoundInformation(int volume, boolean isMuted) {
        this.isMuted = isMuted;
        this.volume = volume;
    }

    /**
     * Gets volume.
     *
     * @return the volume
     */
    public int getVolume() {
        return volume;
    }

    /**
     * Sets volume.
     *
     * @param volume the volume
     */
    public void setVolume(int volume) {
        this.volume = volume;
    }

    /**
     * Is muted boolean.
     *
     * @return the boolean
     */
    public boolean isMuted() {
        return isMuted;
    }

    /**
     * Sets muted.
     *
     * @param muted the muted
     */
    public void setMuted(boolean muted) {
        isMuted = muted;
    }
}
