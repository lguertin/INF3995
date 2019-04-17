package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * The type Black list.
 */
public class BlackList {
    @SerializedName("bloques")
    private List<Identity> blackList;

    /**
     * Gets black list.
     *
     * @return the black list
     */
    public List<Identity> getBlackList() {
        return blackList;
    }

    /**
     * Sets black list.
     *
     * @param blackList the black list
     */
    public void setBlackList(List<Identity> blackList) {
        this.blackList = blackList;
    }
}
