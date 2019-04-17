#ifndef ADMINISTRATORMANAGER_H
#define ADMINISTRATORMANAGER_H

#include "AccountManager.h"

/***************************************************************************
* Class          : AdministratorManager
* Description    : Handle admin account
***************************************************************************/
class AdministratorManager : public AccountManager {
    public:
        /*
        * Constructor with account file name as parameter 
        */
        AdministratorManager() : AccountManager("admin.txt") { }
};

#endif