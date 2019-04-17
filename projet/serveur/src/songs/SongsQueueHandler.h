
#ifndef SONGSQUEUEHANDLER_H
#define SONGSQUEUEHANDLER_H

#include <deque>
#include <iostream>
#include <utility> 
#include <mutex> 
#include <stdexcept>
#include "Song.h"
#include "../utils/Utils.h"


#define MAX_SONGS 10

using namespace std;


/************************************************************
* Class         : SongsQueueHandler
* Desciption    : Handler of the server's songs Queue.
*************************************************************/
class SongsQueueHandler {
    private:
        mutex queueMutex;
        static deque<Song>& songsQueue() { 
            static deque<Song> songsQueue_;
            return songsQueue_; 
        };

        static int& nbSongsReceived() { 
            static int nbSongsReceived_;
            return nbSongsReceived_; 
        };

    public:
        /* CONSTRUCTORS */
        SongsQueueHandler() {}
        SongsQueueHandler(const SongsQueueHandler& songsQueueHandler) {}
        
        /* GETTERS */
        int getNbSongsReceived() {
            return nbSongsReceived();
        }

        bool isEmpty() {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);
            return songsQueue().empty();
        }
        

        /***************************************************************************
        * Method        : getSongTitle
        * Desciption    : Returns the title of the song for a given number
        ****************************************************************************/
        string getSongTitle(int no) {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);
            try {
                return songsQueue().at(no).getTitre();
            } catch (const out_of_range& error) {
                cout << "[ERROR] Invalid song number." << endl;
                return "";    
            }
        }


        /***************************************************************************
        * Method        : printSongsQueue
        * Desciption    : Print the songsQueue content
        ****************************************************************************/
        void printSongsQueue() {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // cout << "SongsQueue content : " << endl;
            if (!songsQueue().empty()) {
                for (deque<Song>::iterator songIter = songsQueue().begin(); songIter != songsQueue().end(); ++songIter) {
                    songIter->printSong();
                }
            }
        }


        /***************************************************************************
        * Method        : addSongToQueue
        * Desciption    : Add a new song to the queue with a submitting user infos
        ****************************************************************************/
        int addSongToQueue(Song newSong, pair<int, IUser> submittingUser) {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Check if queue not full
            if (songsQueue().size() == MAX_SONGS) {
                cout << "[ERROR] The queue is full." << endl;
                return -1; 
            }

            vector<string> minutesSec = Utils::split(newSong.getDuree(), ':');
            if ( stoi(minutesSec[0]) > 7 ) {
                cout << "[ERROR] The song is too long." << endl;
                return -1; 
            }

            // Check max 5 per user
            int nbSubmittedSong = 0;
            for (deque<Song>::iterator songIter = songsQueue().begin(); songIter != songsQueue().end(); ++songIter) {
                if (songIter->checkOwnership(submittingUser.second))
                    nbSubmittedSong++;
            }
            if (nbSubmittedSong > 4) {
                cout << "[ERROR] The user already have 5 songs in the Queue." << endl;
                return -1; 
            }

            // Create a song and add to queue
            newSong.setNo((int)songsQueue().size());
            songsQueue().push_back(newSong);
            nbSongsReceived()++;

            cout << "[INFO] The song #" << songsQueue().back().getNo() << " : " << songsQueue().back().getTitre() << " was successfully added." << endl;
            cout << "[INFO] New SongsQueue size : " << songsQueue().size() << endl;
            return 0;
        };


        /***************************************************************************
        * Method        : removeSongFromQueue
        * Desciption    : Remove a song from the queue if the user is allowed
        ****************************************************************************/
        Song removeSongFromQueue(const pair<int, IUser> *submittingUser, int songNo) {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Forbid removing the song currently playing
            if (songNo == 0) {
                throw invalid_argument( "Cannot remove the song currently playing." );
            }
            // Find the song to remove
            Song songToRemove;
            try {
                songToRemove = songsQueue().at(songNo);
            } catch (const out_of_range& error) {
                throw invalid_argument( "Invalid song number." );
            }
            // Check if supervisor or if user owns the song
            if (submittingUser == nullptr || songToRemove.checkOwnership(submittingUser->second)) {
                songsQueue().erase(songsQueue().begin() + songNo);

                // Change the Number of all following songs
                int updatedNo = songNo;
                for (deque<Song>::iterator songIter = songsQueue().begin() + songNo; songIter != songsQueue().end(); ++songIter) {
                    songIter->setNo(updatedNo);
                    updatedNo++;
                }

                cout << "[INFO] The song #" << songToRemove.getNo() << " : " << songToRemove.getTitre() << " was successfully removed." << endl;
                cout << "[INFO] New SongsQueue size : " << songsQueue().size() << endl;
                return songToRemove;

            } else {
                throw invalid_argument( "The song does not belong to the user." );
            }
        }


        /***************************************************************************
        * Method        : songsQueueToJson
        * Desciption    : Convert the songsQueue content to a json
        ****************************************************************************/
        string songsQueueToJson(const pair<int, IUser> *submittingUser) {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Creating the Json that is returned
            Document outJson;
            outJson.SetObject();

            // Songs array in Json
            Value chansons(kArrayType);

            for (deque<Song>::iterator songIter = songsQueue().begin(); songIter != songsQueue().end(); ++songIter) {
                // Nested json : One song as json
                Value songJson (kObjectType);
                // For a supervisor
                if (submittingUser == nullptr)
                    songJson = songIter->convertToJsonForSupervisor(outJson.GetAllocator());
                // For a client
                else
                    songJson = songIter->convertToJsonForUser(outJson.GetAllocator(), (*submittingUser).second);

                // Adding the json song to the array
                chansons.PushBack(songJson, outJson.GetAllocator());
            }

            // Adding the array to the output json
            outJson.AddMember("chansons", chansons, outJson.GetAllocator());

            StringBuffer buffer;
            Writer<StringBuffer> writer(buffer);
            outJson.Accept(writer);
            return reinterpret_cast<const char*>(buffer.GetString());
        }


        /********************************************************************************
        * Method        : songFinished
        * Desciption    : Function called when the song is finished to remove it from is
        *                 finished the queue and update the songs' numbers in the queue
        **********************************************************************************/
        void songFinished() {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Check if songsQueue() is not empty
            if (songsQueue().size() > 0) {

                songsQueue().pop_front();
                if (songsQueue().size() > 0) {
                    cout << "[INFO] The next song in queue is : " << songsQueue().front().getTitre() << endl;

                    // Change the songNo for all songs remaining
                    int updatedNo = 0;
                    for (deque<Song>::iterator songIter = songsQueue().begin(); songIter != songsQueue().end(); ++songIter) {
                        songIter->setNo(updatedNo);
                        updatedNo++;
                    }
                }
            }
        }


        /***************************************************************************
        * Method        : playNextSong
        * Desciption    : Function called to get the next song to play
        ****************************************************************************/
        Song playNextSong() {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Check if songsQueue() is not empty
            if (songsQueue().size() > 0) {
                cout << "[INFO] The next song to play is : " << songsQueue().front().getTitre() << " (name in DB : " << songsQueue().front().getFileName() << ")." << endl;
            }
            else {
                throw std::out_of_range ("The queue is empty.");
            }
            return songsQueue().front();
        }


        /***************************************************************************
        * Method        : switchSongPlace
        * Desciption    : Switch a song to an ol position to a new position
        ****************************************************************************/
        int switchSongPlace(int oldSongNo, int newSongNo) {
            // Mutual exclusion
            lock_guard<mutex> lock(queueMutex);

            // Check if queue is empty
            if (songsQueue().empty()) {
                cout << "[ERROR] The Queue is empty ! " << endl;
                return -1;
            }

            // Check both song numbers are valid
            if (oldSongNo >= (int)songsQueue().size() || newSongNo >= (int)songsQueue().size() ||
                oldSongNo <= 0 || newSongNo <= 0) {
                cout << "[ERROR] Invalid song number." << endl;
                return -1;
            }
            
            // Check positions are different
            if (oldSongNo == newSongNo) {
                cout << "[ERROR] The two positions are equal." << endl;
                return -1;
            }
            
            // Swap position
            deque<Song> temp = songsQueue();
            for (int index = min(oldSongNo, newSongNo) ; index < (int)songsQueue().size() ; index++) {
                // Update the last songs' number
                if ( index > max(oldSongNo, newSongNo)) {
                    songsQueue()[index].setNo(index);
                // Move the song to the new position
                } else if (index == newSongNo) {
                    songsQueue()[newSongNo] = temp[oldSongNo];
                    songsQueue()[newSongNo].setNo(newSongNo);
                // Move the other songs between the old and new positions to the right place
                } else if (oldSongNo < newSongNo) {
                    songsQueue()[index] = temp[index + 1];
                    songsQueue()[index].setNo(index);
                } else if (oldSongNo > newSongNo) {
                    songsQueue()[index] = temp[index - 1];
                    songsQueue()[index].setNo(index);
                }
            }

            cout << "[INFO] The song have been successfully moved." << endl;

            return 0;
        }

};

#endif