package com.yellemon.model;

import com.google.gson.annotations.SerializedName;

/**
 * The type Credentials.
 */
public class Credentials {
    @SerializedName("usager")
    private String username;

    @SerializedName("mot_de_passe")
    private String password;

    /**
     * Instantiates a new Credentials.
     */
    public Credentials() {
    }

    /**
     * Instantiates a new Credentials.
     *
     * @param username the username
     * @param password the password
     */
    public Credentials(String username, String password) {
        this.username = username;
        this.password = password;
    }

    /**
     * Gets username.
     *
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets username.
     *
     * @param username the username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Gets password.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets password.
     *
     * @param password the password
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
