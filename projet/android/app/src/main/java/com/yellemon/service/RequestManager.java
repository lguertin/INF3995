package com.yellemon.service;

import android.content.Context;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.yellemon.interfaces.VolleyResponseListener;

import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

// This class represents the service we call everytime we want to send HTTP or HTTPS request to the server.
// This service is present in every single presenter of our application.

/**
 * The type Request manager.
 */
public class RequestManager {

    /**
     * The constant SERVER_URL.
     */
    public static final String SERVER_URL = "http://132.207.89.31:80/";
    /**
     * The constant SERVER_URL_SSL.
     */
    public static final String SERVER_URL_SSL = "https://132.207.89.31:443/";

    private final String TAG = "TAG";

    private final RequestQueue requestQueue;
    private final String serverURL;

    /**
     * Instantiates a new Request manager.
     *
     * @param context the context
     * @param useSSL  the use ssl
     */
    public RequestManager(Context context, boolean useSSL) {
        requestQueue = Volley.newRequestQueue(context);
        serverURL = (useSSL) ? SERVER_URL_SSL : SERVER_URL;

        acceptSelfSignedCertificates();
    }

    private static void acceptSelfSignedCertificates() {
        TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
            @Override
            public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType) {
            }

            @Override
            public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType) {
            }

            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return null;
            }
        }
        };

        SSLContext sslContext = null;
        try {
            sslContext = SSLContext.getInstance("SSL");
            sslContext.init(null, trustAllCerts, new java.security.SecureRandom());
        } catch (NoSuchAlgorithmException | KeyManagementException e1) {
            e1.printStackTrace();
        }

        HttpsURLConnection.setDefaultSSLSocketFactory(sslContext.getSocketFactory());

        HostnameVerifier allHostsValid = new HostnameVerifier() {
            public boolean verify(String hostname, SSLSession session) {
                return true;
            }
        };

        HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
    }

    /**
     * Post Request.
     *
     * @param obj                    the obj
     * @param ResponseBodyClass      the response body class
     * @param url                    the url
     * @param volleyResponseListener the volley response listener
     */
    public void post(Object obj, final Class ResponseBodyClass, String url, final VolleyResponseListener volleyResponseListener) {
        final String mRequestBody = extractJsonFromObject(obj);


        final StringRequest req = new StringRequest(Request.Method.POST, serverURL.concat(url), null, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                if (error.networkResponse != null) {
                    volleyResponseListener.onError(error.networkResponse.statusCode);
                } else {
                    volleyResponseListener.onError(500);
                }
            }
        }) {
            @Override
            public byte[] getBody() {
                return mRequestBody == null ? null : mRequestBody.getBytes(StandardCharsets.UTF_8);
            }

            @Override
            protected Response<String> parseNetworkResponse(NetworkResponse response) {
                volleyResponseListener.onResponse(getObjectResponse(response, ResponseBodyClass));
                return super.parseNetworkResponse(response);
            }
        };
        req.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1));
        req.setTag(TAG);
        requestQueue.add(req);
    }

    /**
     * Get Request.
     *
     * @param params                 the params
     * @param ResponseBodyClass      the response body class
     * @param url                    the url
     * @param volleyResponseListener the volley response listener
     */
    public void get(final Map<String, String> params, final Class ResponseBodyClass, String url, final VolleyResponseListener volleyResponseListener) {
        final StringRequest req = getDeleteOrGetStringRequest(params, ResponseBodyClass, url, volleyResponseListener, Request.Method.GET);
        req.setRetryPolicy(new DefaultRetryPolicy(10000, 0, 1));
        req.setTag(TAG);
        requestQueue.add(req);
    }

    /**
     * Delete request.
     *
     * @param params                 the params
     * @param ResponseBodyClass      the response body class
     * @param url                    the url
     * @param volleyResponseListener the volley response listener
     */
    public void delete(final Map<String, String> params, final Class ResponseBodyClass, String url, final VolleyResponseListener volleyResponseListener) {
        final StringRequest req = getDeleteOrGetStringRequest(params, ResponseBodyClass, url, volleyResponseListener, Request.Method.DELETE);
        req.setTag(TAG);
        requestQueue.add(req);
    }

    private StringRequest getDeleteOrGetStringRequest(final Map<String, String> params, final Class ResponseBodyClass, final String url, final VolleyResponseListener volleyResponseListener, int requestMethod) {
        return new StringRequest(requestMethod, serverURL.concat(url), null, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                if (error.networkResponse != null) {
                    volleyResponseListener.onError(error.networkResponse.statusCode);
                } else {
                    volleyResponseListener.onError(500);

                }

            }
        }) {
            @Override
            protected Map<String, String> getParams() {
                return (params != null) ? params : new HashMap<String, String>();
            }

            @Override
            protected Response<String> parseNetworkResponse(NetworkResponse response) {
                volleyResponseListener.onResponse(getObjectResponse(response, ResponseBodyClass));
                return super.parseNetworkResponse(response);
            }
        };
    }

    private Object getObjectResponse(NetworkResponse response, Class ResponseBodyClass) {
        Object jsonResponse = null;
        String jsonString = new String(response.data, StandardCharsets.UTF_8);

        if (ResponseBodyClass != null) {
            jsonResponse = extractObjectFromJson(ResponseBodyClass, jsonString);
        }

        return jsonResponse;
    }

    private String extractJsonFromObject(Object obj) {
        if (obj != null) {
            Gson gson = new Gson();
            return gson.toJson(obj);
        }

        return "";
    }

    /**
     * Cancel requests.
     */
    public void cancelRequests() {
        this.requestQueue.cancelAll(TAG);
    }

    private Object extractObjectFromJson(Class ResponseBodyClass, String jsonString) {
        Object jsonResponse;
        Gson gson = new Gson();
        jsonResponse = gson.fromJson(jsonString, ResponseBodyClass);
        return jsonResponse;
    }
}
