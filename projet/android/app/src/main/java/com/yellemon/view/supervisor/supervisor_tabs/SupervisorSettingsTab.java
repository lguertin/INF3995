package com.yellemon.view.supervisor.supervisor_tabs;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.PopupWindow;
import android.widget.SeekBar;
import android.widget.Toast;

import com.yellemon.model.PasswordChangeRequest;
import com.yellemon.model.SoundInformation;
import com.yellemon.presenter.supervisor_tabs.SettingsTabPresenter;
import com.yellemon.service.PopupWindowService;
import com.yellemon.view.R;
import com.yellemon.view.SessionManager;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

//This class implements the logic of the supervisor settings Tab features and links the front-end layout to that logic with
// the settingsTabPresenter associated to that class.

/**
 * The type Supervisor settings tab.
 */
public class SupervisorSettingsTab extends Fragment {

    private SoundInformation soundInformation;
    private EditText oldPasswordInputText;
    private EditText newPasswordInputText;
    private EditText newPasswordConfirmInputText;
    private SettingsTabPresenter settingsTabPresenter;
    private SeekBar volumeBar;
    private ImageButton muteButton;
    private PopupWindow changePasswordPopupWindow;
    private Handler volumeRequestHandler;
    private Runnable volumeRequestRunnable;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        settingsTabPresenter = new SettingsTabPresenter(this);
        soundInformation = new SoundInformation();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        final View rootView = inflater.inflate(R.layout.supervisor_tab_settings, container, false);

        volumeBar = rootView.findViewById(R.id.volumeBar);
        volumeBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            int lastProgress = 0;

            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) {
                    lastProgress = progress;
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                int volumeDifference = (seekBar.getProgress() - lastProgress);
                lastProgress = seekBar.getProgress();

                settingsTabPresenter.adjustVolume(volumeDifference);
            }
        });

        muteButton = rootView.findViewById(R.id.muteButton);
        muteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                settingsTabPresenter.muteVolume(!soundInformation.isMuted());
            }
        });

        rootView.findViewById(R.id.changePasswordButton).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onChangePasswordButtonClick(rootView);
            }
        });

        rootView.findViewById(R.id.logoutButton).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                disconnect();
            }
        });

        return rootView;
    }

    @Override
    public void onResume() {
        final int VOLUME_REQUEST_DELAY = 2933;
        volumeRequestHandler = new Handler();
        volumeRequestHandler.postDelayed(volumeRequestRunnable = new Runnable() {
            public void run() {
                settingsTabPresenter.getVolume();
                volumeRequestHandler.postDelayed(volumeRequestRunnable, VOLUME_REQUEST_DELAY);
            }
        }, VOLUME_REQUEST_DELAY);

        settingsTabPresenter.getVolume();

        super.onResume();
    }

    @Override
    public void onPause() {
        settingsTabPresenter.cancelRequests();
        volumeRequestHandler.removeCallbacks(volumeRequestRunnable);
        super.onPause();
    }

    /**
     * Disconnect.
     */
    private void disconnect() {
        settingsTabPresenter.disconnectFromServer();
        ((SessionManager) getActivity().getApplicationContext()).reset();

         getActivity().finish();
    }

    /**
     * Show error.
     *
     * @param errorMessage the error message
     */
    public void showError(String errorMessage) {
        Toast.makeText(this.getActivity().getApplicationContext(), errorMessage, Toast.LENGTH_SHORT).show();
    }

    /**
     * Update volume.
     *
     * @param soundInfo the sound info
     */
    public void updateVolume(final SoundInformation soundInfo) {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                soundInformation = soundInfo;
                updateVolumeBar(soundInfo.getVolume());
                updateMuteButton(soundInfo.isMuted());
            }
        });
    }

    private void updateVolumeBar(int percentage) {
        volumeBar.setProgress(percentage);
    }

    private void updateMuteButton(boolean isMuted) {
        if (isMuted) {
            muteButton.setImageResource(android.R.drawable.ic_lock_silent_mode);
        } else {
            muteButton.setImageResource(android.R.drawable.ic_lock_silent_mode_off);
        }
    }

    private void onChangePasswordButtonClick(View view) {
        changePasswordPopupWindow = PopupWindowService.show((LayoutInflater) getActivity().getSystemService(LAYOUT_INFLATER_SERVICE), view, R.layout.supervisor_password_popup);

        oldPasswordInputText = changePasswordPopupWindow.getContentView().findViewById(R.id.old_password_text_input);
        newPasswordInputText = changePasswordPopupWindow.getContentView().findViewById(R.id.new_password_text_input);
        newPasswordConfirmInputText = changePasswordPopupWindow.getContentView().findViewById(R.id.new_password_confirm_text_input);

        changePasswordPopupWindow.getContentView().findViewById(R.id.changement_mdp).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onConfirmChangePasswordButtonClick();
            }
        });
    }

    private void onConfirmChangePasswordButtonClick() {
        if (oldPasswordInputText.getText() != null && newPasswordInputText.getText() != null && newPasswordConfirmInputText.getText() != null &&
                newPasswordInputText.getText().toString().equals(newPasswordConfirmInputText.getText().toString())) {
            settingsTabPresenter.changePassword(new PasswordChangeRequest(oldPasswordInputText.getText().toString(), newPasswordInputText.getText().toString()));
        } else {
            showError(getResources().getString(R.string.password_different_from_confirmation));
        }
    }

    /**
     * On change password success.
     */
    public void onChangePasswordSuccess() {
        getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                changePasswordPopupWindow.dismiss();
                Toast.makeText(getActivity().getApplicationContext(), R.string.password_change_sucess, Toast.LENGTH_SHORT).show();
            }
        });
    }
}
