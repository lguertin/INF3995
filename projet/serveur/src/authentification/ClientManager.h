#ifndef CLIENTMANAGER_H
#define CLIENTMANAGER_H

#include <iostream>
#include <map>
#include <mutex>
#include "../interfaces/IUser.h"

using namespace std;


/**************************************************************
* Class          : ClientManager
* Description    : Handle the generation of a normal user id
**************************************************************/
class ClientManager {
    public:

        /*
        * Default constructor  
        */
        ClientManager() {
            last_logged_id = 0;
        }

        /**************************************************************
        * Method         : login
        * Description    : Create a user id and associates it to the user
        **************************************************************/
        int login(IUser user) {
            int user_id = increment_last_logged_id();

            insert_user(user_id, user);

            return user_id;
        }

        /**************************************************************
        * Method         : get
        * Description    : Finds and return a user based on his id if exists 
        **************************************************************/
        IUser get(int user_id) {
            lock_guard<mutex> lock(logged_users_mutex);
            if (logged_users.find(user_id) != logged_users.end()) {
                return logged_users[user_id];
            }

            IUser nonExistantUser;
            return nonExistantUser;
        }

        /**********************************************************
        * Method         : is_logged_in
        * Description    : Check if a user is connected 
        **********************************************************/
        bool is_logged_in(int user_id) {
            lock_guard<mutex> lock(logged_users_mutex);
            if (logged_users.find(user_id) != logged_users.end()) {
                return true;
            }

            return false;
        }

    private:
        /***********************************************************
        * Method         : increment_last_logged_id
        * Description    : Generate a new id for new connected user
        ************************************************************/
        int increment_last_logged_id() {
            lock_guard<mutex> lock(last_logged_id_mutex);
            return ++last_logged_id;
        }

        /************************************************************
        * Method         : insert_user
        * Description    : Add a new connected user in the list
        ************************************************************/
        void insert_user(int user_id, IUser user) {
            lock_guard<mutex> lock(logged_users_mutex);
            logged_users.insert(pair<int, IUser>(user_id, user));
        }

        map<int, IUser> logged_users;
        int last_logged_id;

        mutex last_logged_id_mutex;
        mutex logged_users_mutex;
};

#endif