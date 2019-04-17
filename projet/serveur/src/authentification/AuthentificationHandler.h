#ifndef AUTHENTIFICATIONHANDLER_H
#define AUTHENTIFICATIONHANDLER_H

#include "../requests/RequestsConstants.h"
#include "AdministratorManager.h"
#include "SupervisorManager.h"
#include "ClientManager.h"
#include <vector>
#include <string>

#define ADMIN "admin"

using namespace std;

class AuthentificationHandler {
    public:
        /****************************************
        * Method  : login_supervisor
        * Returns : HTTP Status
        *****************************************/
        int login_supervisor(string username, string password);

        /****************************************
        * Method  : logout_supervisor
        * Returns : HTTP Status
        *****************************************/
        int logout_supervisor(string username);

        /****************************************
        * Method  : change_password_supervisor
        * Returns : HTTP Status
        *****************************************/
        int change_password_supervisor(string username, string oldPassword, string newPassword);

        /****************************************
        * Method  : is_supervisor_logged_in
        * Returns : Bool : true if logged in, false otherwise
        *****************************************/
        bool is_supervisor_logged_in(string username);


        /****************************************
        * Method  : login_admin
        * Returns : HTTP Status
        *****************************************/
        int login_admin(string username, string password);

        /****************************************
        * Method  : logout_admin
        * Returns : HTTP Status
        *****************************************/
        int logout_admin();

        /****************************************
        * Method  : change_password_admin
        * Returns : HTTP Status
        *****************************************/
        int change_password_admin(string oldPassword, string newPassword);

        /****************************************
        * Method  : create_supervisor
        * Returns : HTTP Status
        *****************************************/
        int create_supervisor(string username, string password);

        /****************************************
        * Method  : remove_supervisor
        * Returns : HTTP Status
        *****************************************/
        int remove_supervisor(string username);

        /****************************************
        * Method  : get_supervor_usernames
        * Returns : List of supervisor usernames
        *****************************************/
        vector<string> get_supervor_usernames();

        /****************************************
        * Method  : is_admin_logged_in
        * Returns : Bool : true if logged in, false otherwise
        *****************************************/
        bool is_admin_logged_in();


        /****************************************
        * Method  : login_client
        * Returns : Client Id
        *****************************************/
        int login_client(string ip, string mac, string username);

        /****************************************
        * Method  : get_client
        * Returns : IUser structure
        *****************************************/
        IUser get_client(int client_id);

        /****************************************
        * Method  : is_client_logged_in
        * Returns : Bool : true if logged in, false otherwise
        *****************************************/
        bool is_client_logged_in(int client_id);

    private:
        SupervisorManager supervisorManager;
        AdministratorManager administratorManager;
        ClientManager clientManager;
};

#endif