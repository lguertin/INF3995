package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Client connection response.
 */
public class ClientConnectionResponse {
    @SerializedName("identificateur")
    private int id;

    @SerializedName("message")
    private String message;

    /**
     * Instantiates a new Client connection response.
     */
    public ClientConnectionResponse() {
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
     * Gets message.
     *
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * Sets message.
     *
     * @param message the message
     */
    public void setMessage(String message) {
        this.message = message;
    }
}
