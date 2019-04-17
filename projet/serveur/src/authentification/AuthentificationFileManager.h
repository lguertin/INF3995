#ifndef AUTHENTIFICATIONFILEMANAGER_H
#define AUTHENTIFICATIONFILEMANAGER_H

#include <iostream>
#include <string>
#include "../utils/FileManager.h"
#include "../utils/Utils.h"
#include "../interfaces/ICredentials.h"

/***************************************************************************
* Class          : AuthentificationFileManager
* Description    : Read account file to get username and password 
***************************************************************************/
class AuthentificationFileManager : public FileManager<ICredentials> {
    public:
        /*
        * Constructor with account file name as parameter 
        */
        AuthentificationFileManager(string file_name) : FileManager(file_name) { }	

    protected:

        /***************************************************************************
        * Method         : parse_line
        * Description    : Split the line into a username and a password 
        ***************************************************************************/
        virtual void parse_line(string line, ICredentials& credentials) {
            vector<string> credentialVec = Utils::split(line, FIELD_DELIMITOR);

            if (credentialVec.size() == 2) {
                credentials.username = credentialVec[0];
                credentials.password = credentialVec[1];
            }
        }

        /***************************************************************************
        * Method         : verify_condition
        * Description    : Check if the field name is username 
        ***************************************************************************/
        virtual bool verify_condition(ICredentials credentials, string field) {
            return credentials.username == field;
        }

        /***************************************************************************
        * Method         : data_to_string
        * Description    : Create a valid line o be written in account file 
        ***************************************************************************/
        virtual string data_to_string(ICredentials credentials) {
            return credentials.username + FIELD_DELIMITOR + credentials.password;
        }
};

#endif
