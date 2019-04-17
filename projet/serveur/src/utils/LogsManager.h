
#ifndef LOGSMANAGER_H
#define LOGSMANAGER_H

#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <time.h>
#include <mutex> 
#include <sstream>
#include <fstream>
#include <algorithm>
#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>


using namespace std;
using namespace rapidjson;


/***************************************************************
* Class         : LogsManager
* Desciption    : Handle the logs generation
****************************************************************/
class LogsManager {

    private:
        mutex logs_mutex;
        static vector<string>& logsList() {
            static vector<string> logs; 
            return logs;
        };

    public: 
        /* CONSTRUCTORS */
        LogsManager() {}
        LogsManager(const LogsManager& logsManager) {}

        /* GETTER */
        int getLogNo() {
            return logsList().size();
        }

        /*********************************************
        * Method        : clearList
        * Desciption    : Clear the logs list
        **********************************************/
        void clearList() {
            logsList().clear();
        }

        /***************************************************************************
        * Method        : getDate
        * Desciption    : Return a date with the format : [DD/MM/YYYY - HH:MM:SS]
        ****************************************************************************/
        string getDate() {
            time_t currentTime = time(0);
            struct tm timeInfos = *localtime(&currentTime);

            char date[80];
            strftime(date, sizeof(date), "[%d/%m/%Y - %X] ", &timeInfos);

            return date; 
        }


        /**************************************
        * Method        : printLogsList
        * Desciption    : Print the logs list
        ***************************************/
        void printLogsList() {
            for (int logNo = 1 ; logNo <= (int)logsList().size() ; logNo++) {
                cout << logNo << " - " << logsList().at(logNo-1) << endl;
            }
        }


        /***************************************************************************
        * Method        : getLastLogs
        * Desciption    : Return the logs printed from the last log number given
        ****************************************************************************/
        string getLastLogs(int lastNo) {
            lock_guard<mutex> lock(logs_mutex);

            if (lastNo < 0 || lastNo > (int)logsList().size()) {
                return "[ERROR] Invalid last number.";
            }

            if (lastNo == 0) {
                cout << "[INFO] Sending last 20 logs." << endl;
                int indexLogsToSend = max(0, int(logsList().size() - 20));
                return printLastLogs(indexLogsToSend);
            }

            else if (lastNo < (int)logsList().size()) {
                cout << "[INFO] Sending logs after the " << lastNo << "th." << endl;
                return printLastLogs(lastNo-1);
            }

            else if (lastNo == (int)logsList().size()) {
                return "[INFO]  Already up to date.";
            } 

           return "[ERROR] Invalid last number.";
        }


        /***************************************************************************
        * Method        : printLastLogs
        * Desciption    : Print the logs from the last log number given
        ****************************************************************************/
        string printLastLogs(int lastNo) {
            string lastLogs = "";
            for (int index = lastNo ; index < (int)logsList().size() ; index++) {
                    lastLogs += to_string(index+1);
                    lastLogs += " - ";
                    lastLogs += logsList()[index];
                    lastLogs += "\n";
                }
            return lastLogs;
        }


        /******************************************************************************
        * Method        : lastLogsToJson
        * Desciption    : Convert the last logs to json from the last log number given
        *******************************************************************************/
        string lastLogsToJson(int lastNo) {
            lock_guard<mutex> lock(logs_mutex);
            string lastLogs = "";

            if (lastNo < 0 || lastNo > (int)logsList().size()) {
                cout << "[ERROR] Invalid last number." << endl;
                return lastLogs;
            }

            if (lastNo == 0) {
                cout << "[INFO] Sending last 20 logs." << endl;
                int indexLogsToSend = max(0, int(logsList().size() - 20));
                lastLogs = toJson(indexLogsToSend);
            }

            else if (lastNo < (int)logsList().size()) {
                cout << "[INFO] Sending logs after the " << lastNo << "th." << endl;
                lastLogs = toJson(lastNo);
            }

            else if (lastNo == (int)logsList().size()) {
                lastLogs = toJson(lastNo);
                cout << "[INFO] Already up to date." << endl;
            } 

            return lastLogs;
        }


        /*************************************************
        * Method        : toJson
        * Desciption    : Convert a log to json
        **************************************************/
        string toJson(int lastNo) {
            // Creating the Json that is returned
            Document outJson;
            outJson.SetObject();

            // Logs array in Json
            Value information(kArrayType);

            for (int index = lastNo ; index < (int)logsList().size() ; index++) {
                // Nested json : One log as json
                Value logJson (kObjectType);
                Value no, info;
                no = index + 1;
                info = StringRef(logsList()[index].c_str());

                logJson.AddMember("no", no, outJson.GetAllocator());
                logJson.AddMember("info", info, outJson.GetAllocator());
                
                // Adding the json log to the array
                information.PushBack(logJson, outJson.GetAllocator());
            }

            // Adding the array to the output json
            outJson.AddMember("information", information, outJson.GetAllocator());

            StringBuffer buffer;
            Writer<StringBuffer> writer(buffer);
            outJson.Accept(writer);
            return reinterpret_cast<const char*>(buffer.GetString());
        }


        /********************************************************************************
        * Method        : addLog
        * Desciption    : Add a new log to the list with the message passed as parameter
        *********************************************************************************/
        void addLog(string log) {
            lock_guard<mutex> lock(logs_mutex);
            logsList().push_back(getDate() + log);

            // Save logs to file by chunk of 5
            if (logsList().size() > 0 && logsList().size() % 5 == 0) {
                writeToFile();
            }
        }


        /************************************************
        * Method        : writeToFile
        * Desciption    : Write logs to a log file  
        *************************************************/
        void writeToFile() {
            cout << "\n[INFO] Saving logs to file." << endl;
            ofstream file_ostream;
            file_ostream.open("database/logs/logs.txt", std::ios::app);
            file_ostream << printLastLogs(logsList().size() - 5);
            file_ostream.close();
        }


        /* LOGS FUNCTION */

        void createSupAccount(string supUsername) {
            addLog("Création du compte superviseur : \"" + supUsername + "\".");
        }

        void deleteSupAccount(string supUsername) {
            addLog("Suppression du compte superviseur : \"" + supUsername + "\".");
        }

        void idUser(string username, int id) {
            addLog("Nouvelle identification d'un usager : \"" + username + "\" Id#" + to_string(id) + ".");
        }

        void songReceived(string username, int id, string title) {
            addLog("Nouvelle chanson envoyée dans la file : \"" + title + "\" envoyée par l'utilisateur \"" + username + "\" Id#" + to_string(id) + ".");
        }

        void decodingStart(string title) {
            addLog("Début du décodage de la chanson : \"" + title + "\".");
        }

        void songRemovedByUser(string username, int id, string title) {
            addLog("Retrait de la chanson : \"" + title + "\" par l'utilisateur \"" + username + "\" Id#" + to_string(id) + ".");
        }

        void songRemovedBySup(string supUsername, string title) {
            addLog("Retrait de la chanson : \"" + title + "\" par le superviseur \"" + supUsername + "\".");
        }

        void songOrderChange(string supUsername, string title, int oldPos, int newPos) {
            addLog("Modification de l'ordre des chansons : \"" + title + "\" deplacée de " + to_string(oldPos) + " à " + to_string(newPos) + " par le superviseur \"" + supUsername + "\".");
        }

        void supConnection(string supUsername) {
            addLog("Nouvelle connexion d'un superviseur : \"" + supUsername + "\".");
        }

        void supDeconnection(string supUsername) {
            addLog("Déconnexion d'un superviseur : \"" + supUsername + "\".");
        }

        void userBlocked(string supUsername, int id) {
            addLog("Blockage d'un utilisateur : Id#" + to_string(id) + " par le superviseur \"" + supUsername + "\".");
        }

        void userUnBlocked(string supUsername, int id) {
            addLog("Déblockage d'un utilisateur : Id#" + to_string(id) + " par le superviseur \"" + supUsername + "\".");
        }

        void volumeUp(string supUsername, int volumePercent) {
            addLog("Augmentation du volume : nouveau volume à " + to_string(volumePercent) + "% par le superviseur \"" + supUsername + "\".");
        }

        void volumeDown(string supUsername, int volumePercent) {
            addLog("Diminution du volume : nouveau volume à " + to_string(volumePercent) + "% par le superviseur \"" + supUsername + "\".");
        }

        void volumeMute(string supUsername) {
            addLog("Activation de la sourdine : par le superviseur \"" + supUsername + "\".");
        }

        void volumeUnmute(string supUsername) {
            addLog("Désativation de la sourdine : par le superviseur \"" + supUsername + "\".");
        }
};

#endif