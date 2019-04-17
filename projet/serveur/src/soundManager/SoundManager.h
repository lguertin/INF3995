#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include <mutex>
#include "Player.h"
#include "VolumeHandler.h"
#include "../utils/LogsManager.h"
#include "../utils/StatsManager.h"
#include "../songs/SongsQueueHandler.h"
#include "../interfaces/ISongInfos.h"
#include "../requests/RequestsConstants.h"

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <time.h>

#define SONGSDIRECTORY "database/songsToPlay/"


using namespace std;


/***************************************************************
* Class         : SoundManager
* Desciption    : Handle the sound parameters
****************************************************************/
class SoundManager {

    private:
        static SongsQueueHandler songsQueueHandler;
        static Player player;
        static VolumeHandler volumeHandler;
        static LogsManager logsManager; 
        static StatsManager statsManager; 

    public: 

        SoundManager();
        static SongsQueueHandler getSongsQueue();
        static VolumeHandler getVolumeHandler();
        static int play(bool onCard);

        static int saveSong(pair<int, IUser> submittingUser, string string_encoded);
        static string writeToFile(int songNo, string string_encoded);

        static int removeSong(pair<int, IUser> *submittingUser, int songNumber, string supUsername);
        static void deleteFile(string fileName);

        static std::string base64_decode(std::string const& encoded_string);

};

#endif