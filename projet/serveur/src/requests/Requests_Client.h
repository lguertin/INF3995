

#ifndef REQUESTSCLIENT_H
#define REQUESTSCLIENT_H


/*************************************************************************
* Class         : Requests_Client
* Desciption    : Handles the requests from the Android App - Client Mode.
**************************************************************************/
class Requests_Client {
    private:

    public:

    /*************************************
    * Request : post_user_id_handler
    * From    : Android Client Mode 
    **************************************/
    static void post_user_id_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "Starting post_user_id_handler" << endl;

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );
        const auto body = request->get_body();

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            Document inJson;
            int status_code = RequestsTools::validate_inJson(body, inJson, {"ip", "MAC", "nom"});

            if (status_code == STATUS_OK) {
                Document outJson;
                outJson.SetObject();
                Value identificateur, message;
                
                IUser client = { inJson["ip"].GetString(), inJson["MAC"].GetString(), inJson["nom"].GetString() };
                
                // Check if the user isn't blacklisted
                if (!RequestsTools::getBlacklistHandler().is_blacklisted(client)) {
                    // Generate an id
                    identificateur = RequestsTools::getAuthentificationHandler().login_client(client.ip, client.mac, client.username);

                    // Welcoming message
                    string welcome_message = "Bienvenue ";
                    if (strcmp(inJson["nom"].GetString(), "") != 0) {   // Include the user's name if one was provided
                        welcome_message += string(inJson["nom"].GetString()) + " ";
                    }
                    welcome_message += "au café-bistro Élévation!";
                    message.SetString(welcome_message.c_str(), outJson.GetAllocator());

                    cout << "[INFO] New user connected : " << inJson["nom"].GetString() << " ID#" << identificateur.GetInt() << endl;
                    RequestsTools::getLogsManager().idUser(inJson["nom"].GetString(), identificateur.GetInt());
                
                } else {
                    cout << "[REJECT] The user can't connect because this MAC was blacklisted." << endl;
                    message = "Désolé, vous n'êtes pas authorisé à utiliser le système du café-bistro Élévation...";
                    identificateur = -1;
                }

                // The returning Json
                outJson.AddMember("identificateur", identificateur, outJson.GetAllocator());
                outJson.AddMember("message", message, outJson.GetAllocator());

                StringBuffer buffer;
                Writer<StringBuffer> writer(buffer);
                outJson.Accept(writer);
                string response_body = reinterpret_cast<const char*>(buffer.GetString());

                session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
            }

            session->close(status_code);
        } );
    }


    /****************************************
    * Request : get_user_songs_queue_handler
    * From    : Android Client Mode 
    *****************************************/
    static void get_user_songs_queue_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "Starting get_user_songs_queue_handler" << endl;

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = STATUS_OK;
            int clientId = stoi(session->get_request()->get_path_parameter( "id" ));
            string response_body = "";

            if (RequestsTools::getAuthentificationHandler().is_client_logged_in(clientId)) {

                if (!RequestsTools::getBlacklistHandler().is_blacklisted(RequestsTools::getAuthentificationHandler().get_client(clientId))) {

                    pair<int, IUser> submittingUser (clientId, RequestsTools::getAuthentificationHandler().get_client(clientId)); 
                    response_body = SoundManager::getSongsQueue().songsQueueToJson(&submittingUser);
                    // cout << "Returning JSON : \n" << response_body << endl;
                } else {
                    cout << "[Error] User ID#" << clientId << " was blacklisted during its session." << endl;
                    status_code = STATUS_UNAUTHORIZED;
                }
            } else {
                cout << "[Error] User ID#" << clientId << " not found in users list." << endl;
                status_code = STATUS_UNAUTHORIZED;
            }

            session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
        } );
    }


    /************************************
    * Request : post_user_song_handler
    * From    : Android Client Mode 
    *************************************/
    static void post_user_song_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "Starting post_user_song_handler" << endl;

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );
        const auto body = request->get_body();

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = STATUS_OK;
            int clientId = stoi(session->get_request()->get_path_parameter( "id" ));

            if (RequestsTools::getAuthentificationHandler().is_client_logged_in(clientId)) {
                if (!RequestsTools::getBlacklistHandler().is_blacklisted(RequestsTools::getAuthentificationHandler().get_client(clientId))) {
                    
                    pair<int, IUser> submittingUser (clientId, RequestsTools::getAuthentificationHandler().get_client(clientId)); 
                    string encoded_data(reinterpret_cast<const char*>(body.data()), body.size());
                    status_code = RequestsTools::getSoundManager().saveSong(submittingUser, encoded_data);

                    if(status_code == STATUS_OK) {
                        cout << "[INFO] New Songs Queue content : " << endl;
                        SoundManager::getSongsQueue().printSongsQueue();
                        // cout << endl;
                    } else if(status_code == STATUS_SONG_REJECTED) {
                        cout << "[REJECT] An error occured while trying to add the song, code : STATUS_SONG_REJECTED." << endl;
                    } else {
                        cout << "[REJECT] An error occured while trying to add the song, code : STATUS_INCORRECT_FORMAT." << endl;
                    }
                } else {
                    cout << "[REJECT] User ID#" << clientId << " was blacklisted during its session." << endl;
                    status_code = STATUS_UNAUTHORIZED;
                }
            } else {
                cout << "[REJECT] User ID#" << clientId << " not found in users list." << endl;
                status_code = STATUS_UNAUTHORIZED;
            }

            cout << "[INFO] Post song Status code : " << status_code << " for the user ID#" << clientId << endl;
            session->close( status_code );
        } );
    }


    /************************************
    * Request : delete_user_song_handler
    * From    : Android Client Mode 
    *************************************/
    static void delete_user_song_handler( const shared_ptr< Session > session ) {

        std :: cout << endl << "Starting delete_user_song_handler" << endl;

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = STATUS_OK;
            int clientId = stoi(session->get_request()->get_path_parameter( "id" ));
            int songNumber = stoi(session->get_request()->get_path_parameter( "no" ));

            if (RequestsTools::getAuthentificationHandler().is_client_logged_in(clientId)) {
                if (!RequestsTools::getBlacklistHandler().is_blacklisted(RequestsTools::getAuthentificationHandler().get_client(clientId))) {

                    pair<int, IUser> submittingUser (clientId, RequestsTools::getAuthentificationHandler().get_client(clientId)); 
                    status_code = RequestsTools::getSoundManager().removeSong(&submittingUser, songNumber, "");
                } else {
                    cout << "[REJECT] User ID#" << clientId << " was blacklisted during its session." << endl;
                    status_code = STATUS_UNAUTHORIZED;
                }
            } else {
                cout << "[REJECT] User ID#" << clientId << " not found in users list or blocked." << endl;
                status_code = STATUS_UNAUTHORIZED;
            }

            cout << "[INFO] Delete song Status code : " << status_code << " for the user ID#" << clientId << endl;
            session->close( status_code );
        } );
    }
};
#endif

