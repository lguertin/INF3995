#ifndef ACCOUNTMANAGER_H
#define ACCOUNTMANAGER_H

#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include "AuthentificationFileManager.h"

#define DB_FOLDER "accounts/"

using namespace std;


/***************************************************************************
* Class          : AccountManager
* Description    : Handle supervisors and admin accounts
***************************************************************************/
class AccountManager {
    private:
        auto find_user(string username) {
            return find(logged_users.begin(), logged_users.end(), username);
        }

    public:
        
        /*
        * Constructor with parameter
        */
        AccountManager(string db_file_name) : database(DB_FOLDER + db_file_name) { }

        /***************************************************************************
        * Method         : login
        * Description    : Check if the username and the given password are in the 
        *                  database and add the username to the connected users list
        ***************************************************************************/
        bool login(string username, string password) {
            ICredentials credentials = database.read_row(username);
            if (username != "" && password != "" && credentials.username == username && credentials.password == password) {
                if (!is_logged_in(username)) {
                    lock_guard<mutex> lock(logged_users_mutex);
                    this->logged_users.push_back(username);
                }

                return true;
            }

            return false;
        }

       /***************************************************************************
        * Method         : logout
        * Description    : Removes the username from the connected users list
        ****************************************************************************/
        bool logout(string username) {
            if (is_logged_in(username)) {
                lock_guard<mutex> lock(logged_users_mutex);
                logged_users.erase(find_user(username));

                return true;
            }

            return false;
        }

        /***************************************************************************
        * Method         : change_password
        * Description    : Replace the oldPassword with the new one for this username
        ****************************************************************************/
        bool change_password(string username, string oldPassword, string newPassword) {
            ICredentials credentials = database.read_row(username);
            if (newPassword != "" && credentials.password == oldPassword) {
                credentials.password = newPassword;
                return database.modify_row(credentials.username, credentials);
            }

            return false;
        }

        /***************************************************************************
        * Method         : is_logged_in
        * Description    : Check if the given username is in the connected list
        ****************************************************************************/
        bool is_logged_in(string username) {
            lock_guard<mutex> lock(logged_users_mutex);
            if (find_user(username) != logged_users.end()) {
                return true;
            }

            return false;
        };

    protected:
        vector<string> logged_users;
        mutex logged_users_mutex;
        AuthentificationFileManager database;
};

#endif