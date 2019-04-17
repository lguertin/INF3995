package com.yellemon.view;

import android.app.Application;

/**
 * The type Session manager.
 */
public class SessionManager extends Application {
    private int token = -1;
    private String username = "";
    private boolean isClient;

    /**
     * Reset.
     */
    public void reset() {
        this.username = "";
        this.token = -1;
    }

    /**
     * Gets session manager.
     *
     * @return the session manager
     */
    public SessionManager getSessionManager() {
        return this;
    }


    /**
     * Is client boolean.
     *
     * @return the boolean
     */
    public boolean isClient() {
        return isClient;
    }

    /**
     * Is client connected boolean.
     *
     * @return the boolean
     */
    public boolean isClientConnected() {
        return token != -1;
    }

    /**
     * Sets is client.
     *
     * @param isClient the is client
     */
    public void setIsClient(boolean isClient) {
        this.isClient = isClient;
    }

    /**
     * Gets token.
     *
     * @return the token
     */
    public int getToken() {
        return token;
    }

    /**
     * Sets token.
     *
     * @param token the token
     */
    public void setToken(int token) {
        this.token = token;
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
}
