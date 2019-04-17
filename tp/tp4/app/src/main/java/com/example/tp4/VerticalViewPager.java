package com.example.tp4;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

/**
 * **** VerticalViewPager ****
 * Class gives the possibility to switch between ViewPager vertically with an animation
 *
 * Class Originally taken from https://stackoverflow.com/questions/13477820/android-vertical-viewpager
 *      Code adapted to respect some coding standards and java lint
 */
public class VerticalViewPager extends ViewPager {

    /**
     * Constructor for VerticalViewPager
     * @param context Fragment manager to interact with other fragments
     */
    public VerticalViewPager(Context context) {
        super(context);
        init();
    }

    /**
     * Constructor for VerticalViewPager
     * @param context Fragment manager to interact with other fragments
     * @param attrs Set of attributes added to context
     */
    public VerticalViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    /**
     * Initiates the VerticalViewPager
     */
    private void init() {
        setPageTransformer(true, new VerticalPageTransformer());
        setOverScrollMode(OVER_SCROLL_NEVER);
    }

    /**
     * Changes the X coordinates for Y coordinates in a MotionEvent
     * @param motionEvent The event in which the coordinates are swapped
     * @return The event with the swapped coordinates
     */
    private MotionEvent swapXY(MotionEvent motionEvent) {
        float width = getWidth();
        float height = getHeight();

        float newX = (motionEvent.getY() / height) * width;
        float newY = (motionEvent.getX() / width) * height;

        motionEvent.setLocation(newX, newY);

        return motionEvent;
    }

    /**
     * Function called to intercept the Touch Even
     * @param motionEvent Event which is intercepted
     * @return True if intercepted, false if not
     */
    @Override
    public boolean onInterceptTouchEvent(MotionEvent motionEvent){
        boolean intercepted = super.onInterceptTouchEvent(swapXY(motionEvent));
        swapXY(motionEvent);
        return intercepted;
    }

    /**
     * Function called when there is a touch on screen
     * @param motionEvent Event of the touch
     * @return True if the event was handled, false otherwise.
     */
    @Override
    public boolean onTouchEvent(MotionEvent motionEvent) {
        return super.onTouchEvent(swapXY(motionEvent));
    }

    /**
     * **** VerticalPageTransformer ****
     * Class gives the possibility to transform the ViewPager
     */
    private class VerticalPageTransformer implements ViewPager.PageTransformer {

        /**
         * Apply a property transformation to the given page.
         * @param view Apply the transformation to this page
         * @param position Position of page relative to the current front-and-center position of the pager
         */
        @Override
        public void transformPage(@NonNull View view, float position) {
            if (position < -1) {
                view.setAlpha(0);
            } else if (position <= 1) {
                view.setAlpha(1);
                view.setTranslationX(view.getWidth() * -position);
                view.setTranslationY(position * view.getHeight());
            } else {
                view.setAlpha(0);
            }
        }
    }
}
