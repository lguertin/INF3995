package com.yellemon.service;

import android.content.Context;
import android.os.Build;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.PopupWindow;

//Class that implements a popup window object that we can call in the view based on a context (fragment or activity)

/**
 * The type Popup window service.
 */
public class PopupWindowService {
    /**
     * Show popup window.
     *
     * @param layoutInflater the layout inflater
     * @param view           the view
     * @param layout         the layout
     * @return the popup window
     */
    public static PopupWindow show(LayoutInflater layoutInflater, View view, int layout) {
        View popupView = layoutInflater.inflate(layout, null);
        final PopupWindow popupWindow = new PopupWindow(popupView, LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT, true);

        popupWindow.showAtLocation(view, Gravity.CENTER, 0, 0);

        dimBehind(popupWindow);

        return popupWindow;
    }

    //  Source : http://devandroidqueies.blogspot.com/2016/11/dim-background-of-popupwindow-in-android.html
    private static void dimBehind(PopupWindow popupWindow) {
        View container;
        if (popupWindow.getBackground() == null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                container = (View) popupWindow.getContentView().getParent();
            } else {
                container = popupWindow.getContentView();
            }
        } else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                container = (View) popupWindow.getContentView().getParent().getParent();
            } else {
                container = (View) popupWindow.getContentView().getParent();
            }
        }
        Context context = popupWindow.getContentView().getContext();
        WindowManager wm = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        WindowManager.LayoutParams p = (WindowManager.LayoutParams) container.getLayoutParams();
        p.flags = WindowManager.LayoutParams.FLAG_DIM_BEHIND;
        p.dimAmount = 0.5f;
        wm.updateViewLayout(container, p);
    }
}
