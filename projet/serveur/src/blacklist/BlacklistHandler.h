#ifndef BLACKLISTHANDLER_H
#define BLACKLISTHANDLER_H

#include "BlacklistFileManager.h"

/*********************************************************
* Class          : BlacklistHandler
* Description    : Handle the users blacklist 
*********************************************************/
class BlacklistHandler
{
    private:
        BlacklistFileManager blacklistFileManager;
    public:
        BlacklistHandler();

        
        void block_client(IUser user);
        void unblock_client(string mac);
        bool is_blacklisted(IUser user);
        vector<IUser> get_all_blacklisted_users();
};

#endif