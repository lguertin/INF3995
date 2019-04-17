package com.yellemon.interfaces;

import android.view.View;

/**
 * The interface Click listener.
 */
public interface ClickListener {
    /**
     * On click.
     *
     * @param view     the view
     * @param position the position
     */
    void onClick(View view, int position);

    /**
     * On double click.
     *
     * @param view     the view
     * @param position the position
     */
    void onDoubleClick(View view, int position);

    /**
     * On item long click.
     *
     * @param view     the view
     * @param position the position
     */
    void onItemLongClick(View view, int position);
}
