package com.example.tp4;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

/**
 * **** HomeActivity ****
 * Main class of the Android application
 * Contains buttons as fragments that iterate in an infinite loop
 */
public class HomeActivity extends AppCompatActivity {

    /**
     * Function called when HomeActivity is starting
     * @param savedInstanceState State of the previously created activity
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        final VerticalViewPager verticalViewPager = findViewById(R.id.verticalViewPager);
        verticalViewPager.setOffscreenPageLimit(4);
        final VerticalPagerAdapter adapter = new VerticalPagerAdapter(getSupportFragmentManager());
        verticalViewPager.setAdapter(adapter);
        verticalViewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffSet, int positionOffSetPixel) {
            }

            @Override
            public void onPageSelected(int position) {
            }

            @Override
            public void onPageScrollStateChanged(int state) {
                if (state == ViewPager.SCROLL_STATE_IDLE) {
                    if (verticalViewPager.getCurrentItem() == adapter.getCount() - 1) {
                        verticalViewPager.setCurrentItem(1,false);
                    } else if (verticalViewPager.getCurrentItem() == 0) {
                        verticalViewPager.setCurrentItem(adapter.getCount() - 2, false);
                    }
                }
            }
        });

        verticalViewPager.setCurrentItem(1, false);

    }

    /**
     * **** VerticalPagerAdapter ****
     * Inner class that contains a list of fragments used as an Adapter
     */
    private class VerticalPagerAdapter extends FragmentPagerAdapter {
        private final List<Fragment> fragments;

        /**
         * Constructor for VerticalPagerAdapter
         * @param fragmentManager Fragment manager to interact with other fragments
         */
        private VerticalPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
            fragments = new ArrayList<>();
            fragments.add(InfiniteScrollFragment.newInstance(3));
            fragments.add(InfiniteScrollFragment.newInstance(1));
            fragments.add(InfiniteScrollFragment.newInstance(2));
            fragments.add(InfiniteScrollFragment.newInstance(3));
            fragments.add(InfiniteScrollFragment.newInstance(1));
        }

        /**
         * Gets the fragment from the fragment list
         * @param index Index of the fragment list
         * @return Fragment at index position
         */
        @Override
        public Fragment getItem(int index) {
            return fragments.get(index);
        }

        /**
         * Gets the amount of fragment within the fragment list
         * @return amount of fragment within the fragment list
         */
        @Override
        public int getCount() {
            return fragments.size();
        }
    }
}
