
#ifndef SONG_H
#define SONG_H

#include <string>
#include <vector>
#include <utility>
#include <iostream>
#include <rapidjson/document.h>
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>

#include "../interfaces/IUser.h"
#include "../interfaces/ISongInfos.h"

using namespace std;
using namespace rapidjson;


/**************************************************************************
* Class         : Song
* Desciption    : A song object with useful methods for its treatment.
***************************************************************************/
class Song {
    private:
        string titre;   // Song's title
        string artiste; // Song's artist
        string duree; // Song's duration
        string proposeePar; // User who submitted
        int no; // Song's number
        string ip; // Users's IP
        string mac; // Users's MAC
        int id; // User's Id
        string fileName; // mp3 file path


    public:
        /* CONSTRUCTORS */
        // Default constructor
        Song() {
            titre = "";
            artiste = "";
            duree = "";
            proposeePar = "";
            no = 0;
            ip = "";
            mac = "";
            id = 0;
        };

        /* Constructor : Song submitted by a user */
        Song(string _titre, string _artiste, string _duree, string _proposeePar, int _no, string _ip, string _mac, int _id, vector<uint8_t> _data) :
        titre(_titre), artiste(_artiste), duree(_duree), proposeePar(_proposeePar), no(_no), ip(_ip), mac(_mac), id(_id)
        {};

        //Constructor : Basic song infos
        Song(string _titre, string _artiste, string _duree, string _proposeePar, int _no) : titre(_titre), artiste(_artiste), duree(_duree), proposeePar(_proposeePar), no(_no) {
            ip = "";
            mac = "";
            id = 0;
        };

        /* Constructor using song's infos, submitting user's infos and saved filePath */
        Song(ISongInfos infos, pair<int, IUser> submittingUser, string mp3FileName) {
            titre = (infos.titre.size() == 0) ? "Unknown" : infos.titre;
            artiste = (infos.artiste.size() == 0) ? "Unknown" : infos.artiste;
            duree = infos.duree;
            proposeePar = submittingUser.second.username;
            ip = submittingUser.second.ip;
            mac = submittingUser.second.mac;
            id = submittingUser.first;
            fileName = mp3FileName;
        };

        /* GETTERS AND SETTERS */
        const char* getTitre() { return titre.c_str(); }
        const char* getArtiste() { return artiste.c_str(); }
        const char* getDuree() { return duree.c_str(); }
        const char* getProposeePar() { return proposeePar.c_str(); }
        int getNo() { return no; }
        const char* getIp() { return ip.c_str(); }
        const char* getMac() { return mac.c_str(); }
        int getId() { return id; }
        string getFileName() { return fileName; }

        void setNo(int newNo) { no = newNo; }


        /*********************************************
        * Method        : printSong
        * Desciption    : Print a song's infos
        **********************************************/
        void printSong() {
            cout << "Chanson no" << no << ", Titre : " << titre << ", Artiste : " << artiste << ", Duree : " << duree << ", Proposee par : " << proposeePar << endl; 
        }


        /***************************************************************************
        * Method        : checkOwnership
        * Desciption    : Check if a song belongs to the user passed as parameter
        ****************************************************************************/
        bool checkOwnership(IUser user) {
            return proposeePar == user.username && ip == user.ip && mac == user.mac; 
        }


        /***************************************************************************
        * Method        : convertToJsonForUser
        * Desciption    : Convert a Song to a Json for the user request
        ****************************************************************************/
        Value convertToJsonForUser(MemoryPoolAllocator<> & alloc, IUser user) {

            // Nested json : One song as json
            Value songJson (kObjectType);
            
            // Setting members
            Value vTitre, vArtiste, vDuree, vProposeePar, vProprietaire, vNo; 
            vTitre = StringRef(getTitre());
            vArtiste = StringRef(getArtiste());
            vDuree = StringRef(getDuree());
            vProposeePar = StringRef(getProposeePar());
            vProprietaire.SetBool(checkOwnership(user));
            vNo = no;

            songJson.AddMember("titre", vTitre, alloc);
            songJson.AddMember("artiste", vArtiste, alloc);
            songJson.AddMember("duree", vDuree, alloc);
            songJson.AddMember("proposeePar", vProposeePar, alloc);
            songJson.AddMember("proprietaire", vProprietaire, alloc);
            songJson.AddMember("no", vNo, alloc);

            return songJson;
        }


        /***************************************************************************
        * Method        : convertToJsonForUser
        * Desciption    : Convert a Song to a Json for the supervisor request
        ****************************************************************************/
        Value convertToJsonForSupervisor(MemoryPoolAllocator<> & alloc) {

            // Nested json : One song as json
            Value songJson (kObjectType);
            
            // Setting members
            Value vTitre, vArtiste, vDuree, vIp, vMac, vId, vProposeePar, vProprietaire, vNo; 
            vTitre = StringRef(getTitre());
            vArtiste = StringRef(getArtiste());
            vDuree = StringRef(getDuree());
            vIp = StringRef(getIp());
            vMac = StringRef(getMac());
            vId = getId();
            vProposeePar = StringRef(getProposeePar());
            vNo = no;

            songJson.AddMember("titre", vTitre, alloc);
            songJson.AddMember("artiste", vArtiste, alloc);
            songJson.AddMember("duree", vDuree, alloc);
            songJson.AddMember("ip", vIp, alloc);
            songJson.AddMember("MAC", vMac, alloc);
            songJson.AddMember("Id", vId, alloc);
            songJson.AddMember("proposeePar", vProposeePar, alloc);
            songJson.AddMember("no", vNo, alloc);

            return songJson;
        }
};

#endif
