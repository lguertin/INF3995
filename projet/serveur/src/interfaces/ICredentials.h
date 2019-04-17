#ifndef ICREDENTIALS_H
#define ICREDENTIALS_H

#include <string>

/***************************************************************************
* Interface      : ICredentials
* Description    : Represents the credentials of an account with a username
*                  and a password.
***************************************************************************/
struct ICredentials {
    std::string username;
    std::string password;
};

#endif