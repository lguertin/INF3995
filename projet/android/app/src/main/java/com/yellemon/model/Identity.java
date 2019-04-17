package com.yellemon.model;

import com.google.gson.annotations.SerializedName;


/**
 * The type Identity.
 */
public class Identity {
    @SerializedName("nom")
    private String name;

    @SerializedName("MAC")
    private String mac;

    @SerializedName("ip")
    private String ip;

    /**
     * Instantiates a new Identity.
     */
    public Identity() {
    }

    /**
     * Instantiates a new Identity.
     *
     * @param ip   the ip
     * @param mac  the mac
     * @param name the name
     */
    public Identity(String ip, String mac, String name) {
        this.ip = ip;
        this.mac = mac;
        this.name = name;
    }

    /**
     * Gets name.
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets name.
     *
     * @param name the name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets mac.
     *
     * @return the mac
     */
    public String getMac() {
        return mac;
    }

    /**
     * Sets mac.
     *
     * @param mac the mac
     */
    public void setMac(String mac) {
        this.mac = mac;
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
}
