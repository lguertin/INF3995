package com.yellemon.interfaces;

/**
 * The interface Start drag listener.
 */
public interface StartDragListener {
    /**
     * Item drop.
     *
     * @param oldPos the old pos
     * @param newPos the new pos
     */
//    void requestDrag(RecyclerView.ViewHolder viewHolder);
    void itemDrop(int oldPos, int newPos);

    /**
     * Item swiped.
     *
     * @param pos the pos
     */
    void itemSwiped(int pos);
}