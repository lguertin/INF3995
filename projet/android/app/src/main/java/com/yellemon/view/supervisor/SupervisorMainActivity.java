package com.yellemon.view.supervisor;

import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.yellemon.interfaces.OnFragmentInteractionListener;
import com.yellemon.presenter.SupervisorMainActivityPresenter;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;
import com.yellemon.view.TrackListFragment;
import com.yellemon.view.supervisor.supervisor_tabs.SupervisorBlackListTab;
import com.yellemon.view.supervisor.supervisor_tabs.SupervisorSettingsTab;

import java.util.ArrayList;
import java.util.List;

//This class that handles the three fragments of the supervisor tabs features.

/**
 * The type Supervisor main activity.
 */
public class SupervisorMainActivity extends AppCompatActivity implements OnFragmentInteractionListener {

    private SupervisorMainActivityPresenter supervisorMainActivityPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.supervisor_main_activity);

        supervisorMainActivityPresenter = new SupervisorMainActivityPresenter(getApplicationContext());
        SectionsPagerAdapter mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        ViewPager mViewPager = findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);
        mViewPager.setOffscreenPageLimit(2);

        TabLayout tabLayout = findViewById(R.id.tabs);
        mViewPager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
        tabLayout.addOnTabSelectedListener(new TabLayout.ViewPagerOnTabSelectedListener(mViewPager));
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }

    @Override
    public void onBackPressed() {
        supervisorMainActivityPresenter.disconnectFromServer();
        ((SessionManager) getApplicationContext()).reset();
        super.onBackPressed();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.help_button, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.action_help) {
            onButtonShowHelpPopupWindow(findViewById(android.R.id.content));
        }
        return super.onOptionsItemSelected(item);
    }

    private void onButtonShowHelpPopupWindow(View view) {
        PopupWindowService.show((LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.supervisor_help_popup);
    }

    /**
     * The type Sections pager adapter.
     */
    class SectionsPagerAdapter extends FragmentPagerAdapter {
        private final List<Fragment> fragments;

        /**
         * Instantiates a new Sections pager adapter.
         *
         * @param fragmentManager the fragment manager
         */
        SectionsPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
            this.fragments = new ArrayList<>();
            this.fragments.add(new TrackListFragment());
            this.fragments.add(new SupervisorBlackListTab());
            this.fragments.add(new SupervisorSettingsTab());
        }

        @Override
        public Fragment getItem(int position) {
            return fragments.get(position);
        }

        @Override
        public int getCount() {
            return fragments.size();
        }
    }
}
