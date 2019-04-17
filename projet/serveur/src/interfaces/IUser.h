#ifndef IUSER_H
#define IUSER_H

#include <string>


/***************************************************************************
* Interface      : IUser
* Description    : Represents a user with its IP, MAC and username.
***************************************************************************/
struct IUser {
    std::string ip;
    std::string mac;
    std::string username;
};

#endif