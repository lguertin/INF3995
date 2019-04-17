package com.yellemon.adapter;

import android.graphics.Color;
import android.support.v7.widget.GridLayout;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.yellemon.interfaces.ItemTouchHelperContract;
import com.yellemon.interfaces.StartDragListener;
import com.yellemon.model.Track;
import com.yellemon.view.R;

import java.util.Collections;
import java.util.List;

// Class that apply all the fragment track list d'adapter changes on every single item of the list.
// sent model : "Identity : username, MAC et IP" to the track list.

/**
 * The type Tracks adapter.
 */
public class TracksAdapter extends RecyclerView.Adapter<TracksAdapter.MyViewHolder> implements ItemTouchHelperContract {

    private final StartDragListener mStartDragListener;
    private final List<Track> trackList;
    private int currIndexMoving;

    /**
     * Instantiates a new Tracks adapter.
     *
     * @param trackList         the track list
     * @param startDragListener the start drag listener
     */
    public TracksAdapter(List<Track> trackList, StartDragListener startDragListener) {
        mStartDragListener = startDragListener;
        this.trackList = trackList;
    }

    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.track_list_row, parent, false);

        return new MyViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(final MyViewHolder holder, int position) {
        Track track = trackList.get(position);
        holder.title.setText(track.getTitle());
        holder.artist.setText(track.getArtist());
        setId(holder, position, track);
        holder.sender.setText(track.getSender());
        holder.duration.setText(track.getDuration());
        if (track.isSender()) {
            holder.itemView.setBackgroundColor(Color.YELLOW);
        } else {
            holder.itemView.setBackgroundColor(Color.WHITE);
        }


    }

    /**
     * Set the track item id.
     */
    private void setId(MyViewHolder holder, int position, Track track) {
        GridLayout gridLayout = holder.rowView.findViewById(R.id.grid_layout);
        ImageView isPlayingImage = holder.rowView.findViewById(R.id.playingImage);

        if (position == 0) {
            gridLayout.setBackgroundResource(R.drawable.popup_background);
            isPlayingImage.setImageResource(R.drawable.dj_icon);
            holder.id.setText("");
        } else {
            gridLayout.setBackgroundResource(0);
            isPlayingImage.setImageResource(R.drawable.in_queue);
            holder.id.setText(String.valueOf(track.getId()));
        }
    }

    private int findItemPosById(int id) {
        for (int i = 0; i < trackList.size(); i++) {
            if (trackList.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public int getItemCount() {
        return trackList.size();
    }

    @Override
    public void onRowMoved(int fromPosition, int toPosition) {
        if (fromPosition < toPosition) {
            for (int i = fromPosition; i < toPosition; i++) {
                Collections.swap(trackList, i, i + 1);
            }
        } else {
            for (int i = fromPosition; i > toPosition; i--) {
                Collections.swap(trackList, i, i - 1);
            }
        }
        notifyItemMoved(fromPosition, toPosition);
    }

    @Override
    public void onRowSelected(MyViewHolder myViewHolder) {
        if (!myViewHolder.id.getText().toString().equals(this.trackList.get(0).getId())) {
            currIndexMoving = findItemPosById(Integer.valueOf(myViewHolder.id.getText().toString()));
        }
    }

    @Override
    public void onRowClear(MyViewHolder myViewHolder) {
        int id = Integer.valueOf(myViewHolder.id.getText().toString());
        int newPos = findItemPosById(id);
        if (currIndexMoving != newPos) {
            mStartDragListener.itemDrop(currIndexMoving, newPos);
        }
    }

    @Override
    public void onItemDismiss(int position) {
        trackList.remove(position);
        notifyItemRemoved(position);
        mStartDragListener.itemSwiped(position);
    }

    /**
     * The type My view holder.
     */
    public class MyViewHolder extends RecyclerView.ViewHolder {
        /**
         * The Title.
         */
        final TextView title;
        /**
         * The Sender.
         */
        final TextView sender;
        /**
         * The Id.
         */
        final TextView id;
        /**
         * The Artist.
         */
        final TextView artist;
        /**
         * The Duration.
         */
        final TextView duration;
        private final View rowView;

        /**
         * Instantiates a new My view holder.
         *
         * @param view the view
         */
        MyViewHolder(View view) {
            super(view);
            rowView = view;
            title = view.findViewById(R.id.title);
            id = view.findViewById(R.id.id);
            sender = view.findViewById(R.id.sender);
            artist = view.findViewById(R.id.artist);
            duration = view.findViewById(R.id.duration);
        }
    }
}
