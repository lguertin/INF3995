package com.yellemon.interfaces;

import com.yellemon.adapter.TracksAdapter;

/**
 * The interface Item touch helper contract.
 */
public interface ItemTouchHelperContract {
    /**
     * On row moved.
     *
     * @param fromPosition the from position
     * @param toPosition   the to position
     */
    void onRowMoved(int fromPosition, int toPosition);

    /**
     * On row selected.
     *
     * @param myViewHolder the my view holder
     */
    void onRowSelected(TracksAdapter.MyViewHolder myViewHolder);

    /**
     * On row clear.
     *
     * @param myViewHolder the my view holder
     */
    void onRowClear(TracksAdapter.MyViewHolder myViewHolder);

    /**
     * On item dismiss.
     *
     * @param position the position
     */
    void onItemDismiss(int position);
}
