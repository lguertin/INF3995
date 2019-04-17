package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Track.
 */
public class Track {
    @SerializedName("titre")
    private String title;

    @SerializedName("duree")
    private String duration;

    @SerializedName("no")
    private int id;

    @SerializedName("proposeePar")
    private String sender;

    @SerializedName("proprietaire")
    private boolean isSender;

    @SerializedName("artiste")
    private String artist;

    @SerializedName("ip")
    private String ip;

    @SerializedName("MAC")
    private String MAC;

    @SerializedName("Id")
    private int userID;

    /**
     * Instantiates a new Track.
     *
     * @param title    the title
     * @param duration the duration
     * @param id       the id
     * @param sender   the sender
     * @param isSender the is sender
     * @param artist   the artist
     */
    public Track(String title, String duration, int id, String sender, Boolean isSender, String artist) {
        this.title = title;
        this.duration = duration;
        this.id = id;
        this.sender = sender;
        this.isSender = isSender;
        this.artist = artist;

    }

    /**
     * Instantiates a new Track.
     */
    public Track() {
    }

    /**
     * Gets title.
     *
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets title.
     *
     * @param title the title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Gets duration.
     *
     * @return the duration
     */
    public String getDuration() {
        return duration;
    }

    /**
     * Sets duration.
     *
     * @param duration the duration
     */
    public void setDuration(String duration) {
        this.duration = duration;
    }

    /**
     * Gets id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id the id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets sender.
     *
     * @return the sender
     */
    public String getSender() {
        return sender;
    }

    /**
     * Sets sender.
     *
     * @param sender the sender
     */
    public void setSender(String sender) {
        this.sender = sender;
    }

    /**
     * Is sender boolean.
     *
     * @return the boolean
     */
    public boolean isSender() {
        return isSender;
    }

    /**
     * Sets sender.
     *
     * @param sender the sender
     */
    public void setSender(boolean sender) {
        isSender = sender;
    }

    /**
     * Gets artist.
     *
     * @return the artist
     */
    public String getArtist() {
        return artist;
    }

    /**
     * Sets artist.
     *
     * @param artist the artist
     */
    public void setArtist(String artist) {
        this.artist = artist;
    }

    /**
     * Gets ip.
     *
     * @return the ip
     */
    public String getIp() {
        return ip;
    }

    /**
     * Sets ip.
     *
     * @param ip the ip
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     * Gets mac.
     *
     * @return the mac
     */
    public String getMAC() {
        return MAC;
    }

    /**
     * Sets mac.
     *
     * @param MAC the mac
     */
    public void setMAC(String MAC) {
        this.MAC = MAC;
    }

    /**
     * Gets user id.
     *
     * @return the user id
     */
    public int getUserID() {
        return userID;
    }

    /**
     * Sets user id.
     *
     * @param userID the user id
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }
}
