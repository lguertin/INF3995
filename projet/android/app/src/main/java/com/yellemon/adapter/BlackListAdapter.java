package com.yellemon.adapter;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.yellemon.model.Identity;
import com.yellemon.view.R;

import java.util.List;
// Class that apply all the fragment black list d'adapter changes on every single item of the list.
// sent model : "Identity : username, MAC et IP" to the blacklist.

/**
 * The type Black list adapter.
 */
public class BlackListAdapter extends BaseAdapter {

    private final Context mContext;
    private final List<Identity> mBlackList;

    /**
     * Instantiates a new Black list adapter.
     *
     * @param context    the context
     * @param mBlackList the m black list
     */
    public BlackListAdapter(Context context, List<Identity> mBlackList) {
        this.mContext = context;
        this.mBlackList = mBlackList;
    }

    @Override
    public int getCount() {
        return mBlackList.size();
    }

    @Override
    public Object getItem(int position) {
        return mBlackList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = View.inflate(mContext, R.layout.supervisor_black_list_row, null);
            TextView tvUsername = convertView.findViewById(R.id.username);
            TextView tvIp = convertView.findViewById(R.id.ip);
            TextView tvMac = convertView.findViewById(R.id.mac);
            tvIp.setText(mBlackList.get(position).getIp());
            tvMac.setText(mBlackList.get(position).getMac());
            tvUsername.setText(mBlackList.get(position).getName());
            if (tvUsername.getText().toString().equals("")) tvUsername.setText(R.string.unknown);
        }
        return convertView;
    }
}
