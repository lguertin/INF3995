package com.example.tp4;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

/**
 * **** InfiniteScrollFragment ****
 * Fragment that contains a button
 * Button is used to make request to a REST server and get the response within another activity
 */
public class InfiniteScrollFragment extends Fragment {
    private static final String ARG_REQUEST_PARAMETER = "request_parameter";

    private String requestParameter = "";

    /**
     * Default constructor absolutely needed for InfiniteScrollFragment
     */
    public InfiniteScrollFragment() { }

    /**
     * Factory method to create an InfiniteScrollFragment
     * @param requestNumber Number given to the fragment for the upcoming request
     * @return Fragment instantiated in the factory
     */
    public static InfiniteScrollFragment newInstance(int requestNumber) {
        InfiniteScrollFragment fragment = new InfiniteScrollFragment();
        Bundle args = new Bundle();
        args.putString(ARG_REQUEST_PARAMETER, "test" + Integer.toString(requestNumber));
        fragment.setArguments(args);
        return fragment;
    }

    /**
     * Function called on initial creation of InfiniteScrollFragment
     * @param savedInstanceState State of the previously created fragment
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            requestParameter = getArguments().getString(ARG_REQUEST_PARAMETER);
        }
    }

    /**
     * Function called to have the fragment instantiate its user interface view.
     * @param inflater Layout for the fragment
     * @param container Container for the fragment
     * @param savedInstanceState State of the previously created fragment
     * @return View of the fragment
     */
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_infinite_scroll, container, false);
    }

    /**
     * Function called after the fragment is instantiated on its user interface view.
     * @param view User interface view for the fragment
     * @param savedInstanceState State of the previously created fragment
     */
    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        Button button = view.findViewById(R.id.button);
        button.setText(requestParameter);
        button.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), RequestPageActivity.class);
                intent.putExtra(RequestPageActivity.REQUEST_PARAMETER_EXTRA, requestParameter);
                startActivity(intent);
            }
        });
    }
}