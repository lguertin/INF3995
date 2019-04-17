#ifndef BLACKLISTFILEMANAGER_H
#define BLACKLISTFILEMANAGER_H

#include "../utils/FileManager.h"
#include "../utils/Utils.h"
#include "../interfaces/IUser.h"

#define DB_FOLDER_BLACKLIST "blacklist/blacklist.txt"

/***************************************************************************
* Class          : BlacklistFileManager
* Description    : Handle blacklist file that conatins blocked users infos
***************************************************************************/
class BlacklistFileManager : public FileManager<IUser> {
    public:
        /*
        * Constructor with account file name as parameter 
        */
        BlacklistFileManager(): FileManager(DB_FOLDER_BLACKLIST) { }

    protected:

        /***************************************************************************
        * Method         : parse_line
        * Description    : Split the line into a user's ip, mac and id if it exists 
        ***************************************************************************/
        virtual void parse_line(string line, IUser& user) {
            vector<string> usersVec = Utils::split(line, FIELD_DELIMITOR);

            if (usersVec.size() >= 2) {
                user.ip = usersVec[0];
                user.mac = usersVec[1];
            }

            if (usersVec.size() >= 3) {
                user.username = usersVec[2];
            }
        };

        virtual bool verify_condition(IUser user, string field) {
            return user.mac == field;
        }

        virtual string data_to_string(IUser user) {
            return user.ip + FIELD_DELIMITOR + user.mac + FIELD_DELIMITOR + user.username;
        }
};

#endif