package com.yellemon.interfaces;


/**
 * The interface Volley response listener.
 */
public interface VolleyResponseListener {
    /**
     * On response.
     *
     * @param response the response
     */
    void onResponse(Object response);

    /**
     * On error.
     *
     * @param httpErrorCode the http error code
     */
    void onError(int httpErrorCode);
}