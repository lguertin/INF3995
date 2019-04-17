package com.example.tp4;

import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.Toast;

/**
 * **** RequestPageActivity ****
 * Activity used to make request to a REST server
 * Displays the response of the server and gives the user the possibility to get back to the last activity
 */
public class RequestPageActivity extends AppCompatActivity {

    public final static String REQUEST_PARAMETER_EXTRA = "requestParameter-url";

    private WebView webView;
    private AnimationDrawable animation;

    /**
     * Function called when RequestPageActivity is starting
     * @param savedInstanceState State of the previously created activity
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_page);

        webView = findViewById(R.id.webView);
        ImageView loading =  findViewById(R.id.loading);
        animation = (AnimationDrawable)loading.getDrawable();
        // initial state of the page - cant use OnLoadResource since the page sometimes load too fast!
        webView.setVisibility(View.GONE);
        animation.start();

        Bundle params = getIntent().getExtras();
        if (params != null && params.getString(REQUEST_PARAMETER_EXTRA) != null) {
            request(params.getString(REQUEST_PARAMETER_EXTRA));
        } else {
            Toast.makeText(RequestPageActivity.this, "Invalid request", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Request to the server and fill the view in the user interface
     * @param param Request parameter added to the URL
     */
    private void request(String param){
        final String BASE_URL = "http://132.207.89.31:80/";

        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient(){

            @Override
            public void onPageFinished(WebView view, String url){
                webView.setVisibility(View.VISIBLE);
                animation.stop();
            }

            @Override
            public void onReceivedError(WebView view, int errorCode, String description, String ulrFail){
                Toast.makeText(RequestPageActivity.this, description, Toast.LENGTH_SHORT).show();
            }
        });
       // webView.loadUrl(BASE_URL.concat(param));
        webView.loadUrl("http://132.207.89.31:80/response");

    }

    /**
     * Closes the current activity and return to the last activity
     * @param view View for the button OnClickListener
     */
    public void returnHome(View view) {
        finish();
    }
}
