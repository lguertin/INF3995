#include "AuthentificationHandler.h"

int AuthentificationHandler::login_supervisor(string username, string password) {
    if (supervisorManager.login(username, password)) {
        return STATUS_OK;
    }

    return STATUS_UNAUTHORIZED;
}

int AuthentificationHandler::login_admin(string username, string password) {
    if (administratorManager.login(username, password)) {
        return STATUS_OK;
    }

    return STATUS_UNAUTHORIZED;
}

int AuthentificationHandler::logout_supervisor(string username) {
    if (supervisorManager.is_logged_in(username)) {
        if (supervisorManager.logout(username)) {
            return STATUS_OK;
        }
    }

    return STATUS_USER_NOT_ID;
}

int AuthentificationHandler::logout_admin() {
    if (administratorManager.is_logged_in(ADMIN)) {
        if (administratorManager.logout(ADMIN)) {
            return STATUS_OK;   
        }
    }

    return STATUS_USER_NOT_ID;
}

bool AuthentificationHandler::is_supervisor_logged_in(string username) {
    return supervisorManager.is_logged_in(username);
}

bool AuthentificationHandler::is_admin_logged_in() {
    return administratorManager.is_logged_in(ADMIN);
}

int AuthentificationHandler::change_password_supervisor(string username, string oldPassword, string newPassword) {
    if (supervisorManager.is_logged_in(username)) {
        if (supervisorManager.change_password(username, oldPassword, newPassword)) {
            return STATUS_OK;
        }

        return STATUS_BAD_REQUEST;
    }

    return STATUS_USER_NOT_ID;
}

int AuthentificationHandler::change_password_admin(string oldPassword, string newPassword) {
    if (administratorManager.is_logged_in(ADMIN)) {
        if (administratorManager.change_password(ADMIN, oldPassword, newPassword)) {
            return STATUS_OK;
        }

        return STATUS_BAD_REQUEST;
    }

    return STATUS_USER_NOT_ID;
}

int AuthentificationHandler::create_supervisor(string username, string password) {
    if (administratorManager.is_logged_in(ADMIN)) {
        if (supervisorManager.add(username, password)) {
            return STATUS_OK;
        }
    }

    return STATUS_UNAUTHORIZED;
}

int AuthentificationHandler::remove_supervisor(string username) {
    if (administratorManager.is_logged_in(ADMIN)) {
        if (supervisorManager.remove(username)) {
            return STATUS_OK;
        }

        return STATUS_BAD_REQUEST;
    }

    return STATUS_UNAUTHORIZED;
}

std::vector<std::string> AuthentificationHandler::get_supervor_usernames() {
    vector<ICredentials> supervisors = supervisorManager.get_all();
    vector<string> supervisor_usernames;

    for(auto it = supervisors.begin(); it != supervisors.end(); it++) {
        supervisor_usernames.push_back(it->username);
    }

    return supervisor_usernames;
}


int AuthentificationHandler::login_client(string ip, string mac, string username) { // Returns client id
    IUser user = {ip, mac, username};

    return clientManager.login(user);
}

IUser AuthentificationHandler::get_client(int client_id) {
    return clientManager.get(client_id);
}

bool AuthentificationHandler::is_client_logged_in(int client_id) {
    return clientManager.is_logged_in(client_id);
}