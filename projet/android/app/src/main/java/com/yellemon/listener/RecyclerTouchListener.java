package com.yellemon.listener;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;

import com.yellemon.interfaces.ClickListener;

/**
 * The type Recycler touch listener.
 */
public class RecyclerTouchListener implements RecyclerView.OnItemTouchListener {

    private final GestureDetector gestureDetector;
    private final ClickListener clickListener;

    /**
     * Instantiates a new Recycler touch listener.
     *
     * @param context       the context
     * @param recyclerView  the recycler view
     * @param clickListener the click listener
     */
    public RecyclerTouchListener(Context context, final RecyclerView recyclerView, final ClickListener clickListener) {
        this.clickListener = clickListener;
        gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onSingleTapUp(MotionEvent e) {
                return true;
            }

            @Override
            public void onLongPress(MotionEvent e) {
                View childView = recyclerView.findChildViewUnder(e.getX(), e.getY());
                if (childView != null && clickListener != null) {
                    clickListener.onItemLongClick(childView, recyclerView.getChildAdapterPosition(childView));
                }
            }

            @Override
            public boolean onDoubleTap(MotionEvent event) {
                View child = recyclerView.findChildViewUnder(event.getX(), event.getY());
                if (child != null && clickListener != null) {
                    clickListener.onDoubleClick(child, recyclerView.getChildAdapterPosition(child));
                    return true;
                }
                return false;
            }
        });
    }

    @Override
    public boolean onInterceptTouchEvent(RecyclerView rv, MotionEvent e) {

        View child = rv.findChildViewUnder(e.getX(), e.getY());
        if (child != null && clickListener != null && gestureDetector.onTouchEvent(e)) {
            clickListener.onClick(child, rv.getChildAdapterPosition(child));
        }
        return false;
    }

    @Override
    public void onTouchEvent(RecyclerView rv, MotionEvent e) {
    }

    @Override
    public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {

    }

}
