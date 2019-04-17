package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Blacklist unblock request.
 */
public class BlacklistUnblockRequest {
    @SerializedName("MAC")
    private final String mac;

    /**
     * Instantiates a new Blacklist unblock request.
     *
     * @param mac the mac
     */
    public BlacklistUnblockRequest(String mac) {
        this.mac = mac;
    }

    /**
     * Gets mac.
     *
     * @return the mac
     */
    public String getMac() {
        return mac;
    }
}
