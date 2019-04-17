#ifndef SUPERVISORMANAGER_H
#define SUPERVISORMANAGER_H

#include "AccountManager.h"

/***************************************************************************
* Class          : SupervisorManager
* Description    : Handles supervisor account creation and deletion 
***************************************************************************/
class SupervisorManager : public AccountManager {
    public:
        /*
        * Constructor with account file name as parameter 
        */
        SupervisorManager() : AccountManager("superviseurs.txt") { }

        /***************************************************************************
        * Method         : add
        * Description    : Inserts a new line that contains the supervisor's name and password
        ***************************************************************************/
        bool add(string username, string password) {
            ICredentials credentials = database.read_row(username);
            if (username != "" && password != "" && credentials.username == "" && credentials.password == "") {
                credentials.username = username;
                credentials.password = password;
                database.add_row(credentials);

                return true;
            }

            return false;
        }

        /***************************************************************************
        * Method         : remove
        * Description    : Deletes the line that contains the supervisor's infos
        ***************************************************************************/
        bool remove(string username) {
            if (username != "") {
                return database.delete_row(username);
            }
            
            return false;
        }

        vector<ICredentials> get_all() {
            return database.get_all_rows();
        }
};

#endif