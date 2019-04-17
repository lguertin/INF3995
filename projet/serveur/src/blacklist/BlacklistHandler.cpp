#include "BlacklistHandler.h"

/*
* Default constructor  
*/
BlacklistHandler::BlacklistHandler() { }

/***************************************************************************
* Method         : block_client
* Description    : Adds a user to the black list 
***************************************************************************/
void BlacklistHandler::block_client(IUser user) {
    if (!is_blacklisted(user)) {
        blacklistFileManager.add_row(user);
    }
}

/***************************************************************************
* Method         : unblock_client
* Description    : Removes a user from the black list if found in it
***************************************************************************/
void BlacklistHandler::unblock_client(string mac) {
    IUser user = { "", mac, "" };
    if (is_blacklisted(user)) {
        blacklistFileManager.delete_row(user.mac);
    }
}

/***************************************************************************
* Method         : unblock_client
* Description    : Checks if a user existed in the black list 
***************************************************************************/
bool BlacklistHandler::is_blacklisted(IUser user) {
    return blacklistFileManager.read_row(user.mac).mac != "";
}

vector<IUser> BlacklistHandler::get_all_blacklisted_users() {
    return blacklistFileManager.get_all_rows();
}
