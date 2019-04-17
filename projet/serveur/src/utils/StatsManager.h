
#ifndef STATSMANAGER_H
#define STATSMANAGER_H

#include <iostream>
#include <string>
#include <mutex> 
#include <vector>

#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>

#include "../interfaces/IUser.h"
#include "../utils/Utils.h"


using namespace std;
using namespace rapidjson;


/***************************************************************
* Class         : StatsManager
* Desciption    : Handle the stats generation
****************************************************************/
class StatsManager {

    private:
        mutex stats_mutex;

        /***************************************************************************
        * Method         : averageDurationToString
        * Description    : Converts submitted songs average duration to string 
        ***************************************************************************/
        string averageDurationToString() {
            int mins = (int) getAverageDuration()/60;
            int secs = getAverageDuration() % 60;
            return secs < 10 ? (to_string(mins) + ":" + "0" + to_string(secs)) : (to_string(mins) + ":" + to_string(secs));
        } 

        /***************************************************************************
        * Method         : durationToSec
        * Description    : Converts submitted songs average duration to seconds 
        ***************************************************************************/
        int durationToSec(string songDuration) {
            vector<string> mins_secs_string = Utils::split(songDuration, ':'); 
            int mins = stoi(mins_secs_string[0]);
            int secs = stoi(mins_secs_string[1]);

            int durationInSec = secs;
            durationInSec += mins * 60;
            return durationInSec;
        }

        /***************************************************************************
        * Method         : updateAverageDuration
        * Description    : Updates the submitted songs average duration to seconds 
        *                  when a new song is received 
        ***************************************************************************/
        void updateAverageDuration(string songDuration) {
            int durationInSec = durationToSec(songDuration);
            getTotalDuration() += durationInSec;
            getAverageDuration() = getTotalDuration() / getNbSongsSubmitted();
        }


        /***************************************************************************
        * Method         : newSubmittingUser
        * Description    : Check if the submittingUser is new or not
        ***************************************************************************/
        bool newSubmittingUser(IUser submittingUser) {
            for (int i = 0 ; i < (int) getSubmittingUsers().size() ; i++) {
                if (getSubmittingUsers()[i].username == submittingUser.username &&
                    getSubmittingUsers()[i].ip == submittingUser.ip && getSubmittingUsers()[i].mac == submittingUser.mac) {
                        return false;
                    }
            }
            return true;
        }


    public: 
        /* CONSTRUCTORS */
        StatsManager() {}

        StatsManager(const StatsManager& statsManager) {}

        /* STATIC ATTRIBUTES AND GETTERS */
        static int& getNbSongsSubmitted() { 
            static int nbSongsSubmitted;
            return nbSongsSubmitted; 
        };
        static vector<IUser>& getSubmittingUsers() { 
            static vector<IUser> submittingUsers;
            return submittingUsers; 
        };
        static int& getNbOfSongsRemoved() { 
            static int nbOfSongsRmvedBySups;
            return nbOfSongsRmvedBySups; 
        };
        static int& getAverageDuration() { 
            static int averageDuration;
            return averageDuration; 
        };
        static int& getTotalDuration() { 
            static int totalDuration;
            return totalDuration; 
        };

        /***************************************************************************
        * Method         : newSongSubmitted
        * Description    : Update the submittingUser list and songs duration 
        ***************************************************************************/
        void newSongSubmitted(IUser submittingUser, string songDuration) {
            lock_guard<mutex> lock(stats_mutex);

            // Update the number of songs submitted
            getNbSongsSubmitted()++;

            // Update the average of songs duration
            updateAverageDuration(songDuration);

            // Update the number of submitting user if this user hasn't submitted a song yet
            if (newSubmittingUser(submittingUser)) {
                getSubmittingUsers().push_back(submittingUser);
            }
        }


        /***************************************************************************
        * Method         : songRemoved
        * Description    : Update the stats when a song is removed
        ***************************************************************************/
        void songRemoved() {
            lock_guard<mutex> lock(stats_mutex);
            getNbOfSongsRemoved()++;
        }


        /***************************************************************************
        * Method         : statsToJson
        * Description    : Convert current stats to json
        ***************************************************************************/ 
        string statsToJson() {
            lock_guard<mutex> lock(stats_mutex);

            Document outJson;
            outJson.SetObject();

            Value chansons, utilisateurs, elemines, temps;
            
            chansons = getNbSongsSubmitted();
            utilisateurs = getSubmittingUsers().size();
            elemines = getNbOfSongsRemoved();
            temps.SetString(averageDurationToString().c_str(), outJson.GetAllocator());

            outJson.AddMember("chansons", chansons, outJson.GetAllocator());
            outJson.AddMember("utilisateurs", utilisateurs, outJson.GetAllocator());
            outJson.AddMember("elemines", elemines, outJson.GetAllocator());
            outJson.AddMember("temps", temps, outJson.GetAllocator());

            StringBuffer buffer;
            Writer<StringBuffer> writer(buffer);
            outJson.Accept(writer);
            return reinterpret_cast<const char*>(buffer.GetString());
        }


        /***************************************************************************
        * Method         : printStats
        * Description    : Print the current stats 
        ***************************************************************************/
        void printStats() {
            lock_guard<mutex> lock(stats_mutex);

            cout << endl << "              ---------" << endl;
            cout         << "              | STATS |" << endl;
            cout         << "              ---------" << endl;
            cout << "* Number of songs submitted              : " << getNbSongsSubmitted() << endl;
            cout << "* Number of submitting users             : " << getSubmittingUsers().size() << endl;
            cout << "* Number of songs removed by supervisors : " << getNbOfSongsRemoved() << endl;
            cout << "* Average songs duration                 : " << averageDurationToString() << endl << endl;
        }
};

#endif