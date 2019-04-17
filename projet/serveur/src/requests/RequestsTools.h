

#ifndef REQUESTSTOOLS_H
#define REQUESTSTOOLS_H

#include <restbed>
#include <rapidjson/document.h> 
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>
#include <string>
#include <map>
#include <iostream>

#include "../authentification/AuthentificationHandler.h"
#include "../blacklist/BlacklistHandler.h"
#include "RequestsConstants.h"
#include "../songs/SongsQueueHandler.h"
#include "../soundManager/SoundManager.h"
#include "../utils/LogsManager.h"
#include "../utils/StatsManager.h"
#include "../utils/Utils.h"

using namespace std;
using namespace restbed;
using namespace rapidjson;


#define GET     "GET"
#define POST    "POST"
#define DELETE  "DELETE"
#define N_RES     26
#define MAX_USERS 10

/******************************************************************************
* Class         : RequestsTools
* Desciption    : Tools like constants and commun methods in requests classes.
*******************************************************************************/
class RequestsTools {
    public:

        RequestsTools() {};

        static AuthentificationHandler& getAuthentificationHandler() {
            static AuthentificationHandler authentificationHandler;
            return authentificationHandler;
        }

        static BlacklistHandler& getBlacklistHandler() {
            static BlacklistHandler blacklistHandler;
            return blacklistHandler;
        }

        static SoundManager& getSoundManager() {
            static SoundManager soundManager; 
            return soundManager;
        };

        static LogsManager& getLogsManager() {
            static LogsManager logsManager; 
            return logsManager;
        };

        static StatsManager& getStatsManager() {
            static StatsManager statsManager; 
            return statsManager;
        };

        string resPaths [N_RES] = {
            "/usager/identification", "/usager/file/{id: [0-9]*}",
            "/usager/chanson/{id: [0-9]*}", "/usager/chanson/{id: [0-9]*}/{no: [0-9]*}",
            "/superviseur/login", "/superviseur/{usager: .*}/logout", 
            "/superviseur/{usager: .*}/changement_mdp", "/superviseur/{usager: .*}/file",
            "/superviseur/{usager: .*}/chanson/{no: [0-9]*}", "/superviseur/{usager: .*}/position",
            "/superviseur/{usager: .*}/volume", "/superviseur/{usager: .*}/volume/augmenter/{pc: [0-9]*}",
            "/superviseur/{usager: .*}/volume/diminuer/{pc: [0-9]*}", "/superviseur/{usager: .*}/volume/sourdine/activer",
            "/superviseur/{usager: .*}/volume/sourdine/desactiver", "/superviseur/{usager: .*}/bloquer", 
            "/superviseur/{usager: .*}/debloquer", "/superviseur/{usager: .*}/listenoire", 
            "/admin/login", "/admin/logout", 
            "/admin/changement_mdp", "/admin/statistiques", 
            "/admin/logs", "/admin/creationcompte",
            "/admin/suppressioncompte", "/admin/listesuperviseurs"
        };

        /***************************************************************************
        * Method         : validate_inJson
        * Description    : Checks if the received json is in valid format 
        ***************************************************************************/
        static int validate_inJson(const Bytes& body, Document& inJson, const set<const char*>& jsonFields ) {
            int status_code = STATUS_BAD_REQUEST;

            if (!body.empty()) {

                string str(reinterpret_cast<const char*>(body.data()), body.size());

                if (inJson.Parse(str.c_str()).HasParseError()) {
                    cout << "[Error] Validate_Json : error when trying to parse body data to json. " << endl;
                } else { 

                    inJson.Parse(str.c_str());
                    bool hasMember = true;
                    if (inJson.IsObject()) {
                        set<const char*>::iterator field;
                        for( field = jsonFields.begin(); field != jsonFields.end(); ++field){
                            hasMember &= inJson.HasMember(*field);
                        }

                        if (hasMember) {
                            status_code = STATUS_OK;
                        }
                    }
                }
            }
            return status_code;
        }

        /***************************************************************************
        * Method         : secureConnection
        * Description    : Checks if the request is in http or https by checking the port
        ***************************************************************************/
        static bool secureConnection(string destAddress) {
            vector<string> addrVect = Utils::split(destAddress, ':');
            
            if ( find(addrVect.begin(), addrVect.end(), SECURE_CONNECTION_PORT) == addrVect.end() ) {
                cout << "[REJECT] Trying to access a secure path with an unsecure protocol." << endl;
                return false;
            }
            return true;
        }

};

#endif