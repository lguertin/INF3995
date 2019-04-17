

#ifndef REQUESTSSUPERVISOR_H
#define REQUESTSSUPERVISOR_H


/*****************************************************************************
* Class         : Requests_Supervisor
* Desciption    : Handles the requests from the Android App - Supervisor Mode.
******************************************************************************/
class Requests_Supervisor {
    private:

    public:

    /******************************************
    * Request : post_supervisor_login_handler
    * From    : Android Supervisor Mode  
    *******************************************/
    static void post_supervisor_login_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_login_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );
    
        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            // create an empty document, then create a set with expected Json fields
            Document inJson;
            int status_code = RequestsTools::validate_inJson(body, inJson, {"usager", "mot_de_passe"});

            if ( status_code == STATUS_OK ) {
                string username = inJson["usager"].GetString();
                string password = inJson["mot_de_passe"].GetString();
                status_code = RequestsTools::getAuthentificationHandler().login_supervisor(username, password);

                if (status_code == STATUS_OK) {
                    cout << "[INFO] New supervisor connection : " << inJson["usager"].GetString() << "." << endl;
                    RequestsTools::getLogsManager().supConnection(inJson["usager"].GetString());
                }
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code);
        } );
    }

    /******************************************
    * Request : post_supervisor_logout_handler
    * From    : Android Supervisor Mode
    *******************************************/
    static void post_supervisor_logout_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_logout_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            cout << "[INFO] We've received a request to logout from : " <<  supUsername << endl;
            int status_code = RequestsTools::getAuthentificationHandler().logout_supervisor(supUsername);

            if (status_code == STATUS_OK)
                RequestsTools::getLogsManager().supDeconnection(supUsername);

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /***************************************************
    * Request : post_supervisor_change_password_handler
    * From    : Android Supervisor Mode
    ****************************************************/
    static void post_supervisor_change_password_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_change_password_handler " << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );
        const auto body = request->get_body();

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            Document inJson;
            int status_code = RequestsTools::validate_inJson(body, inJson, {"ancien", "nouveau"});

            if (status_code == STATUS_OK) {
                auto supUsername = session->get_request()->get_path_parameter( "usager" );
                cout << "[INFO] We've received a request to change password from : " + supUsername << endl;

                string oldPasswd = inJson["ancien"].GetString();
                string newPasswd = inJson["nouveau"].GetString();
                status_code = RequestsTools::getAuthentificationHandler().change_password_supervisor(supUsername, oldPasswd, newPasswd);
                
                if (status_code == STATUS_OK)
                    cout << "[INFO] Password changed from : " <<  oldPasswd << " to " << newPasswd << "." << endl;
                else
                    cout << "[REJECT] Cannot set the new password : STATUS CODE = " << status_code << endl;
            }

            session->close( status_code );
        } );
    }


    /**********************************************
    * Request : get_supervisor_songs_queue_handler
    * From    : Android Supervisor Mode
    ***********************************************/
    static void get_supervisor_songs_queue_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting get_supervisor_songs_queue_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            int status_code = STATUS_OK;
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            string response_body = "";

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                response_body = SoundManager::getSongsQueue().songsQueueToJson(nullptr);
                // cout << "Returning JSON : \n\n" << response_body << endl;
                
            } else {
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
                status_code = STATUS_USER_NOT_ID;
            }

            session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
        } );
    }


    /*********************************************
    * Request : delete_supervisor_song_handler
    * From    : Android Supervisor Mode
    *********************************************/
    static void delete_supervisor_song_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting delete_supervisor_song_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = STATUS_OK;
            int songNumber = stoi(session->get_request()->get_path_parameter( "no" ));
            auto supUsername = session->get_request()->get_path_parameter( "usager" );

            cout << "[INFO] We've received a request to delete the song : #" << songNumber << " from " << supUsername << endl;

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {

                status_code = RequestsTools::getSoundManager().removeSong(nullptr, songNumber, supUsername);
 
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /*************************************************
    * Request : post_supervisor_song_position_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_song_position_handler( const shared_ptr< Session > session ) {
        cout << endl << "starting post_supervisor_song_position_handler " << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );
        const auto body = request->get_body();

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = STATUS_OK;
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            cout << "[INFO] We've received a request to change song position from : " + supUsername << endl;

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {

                Document inJson;
                status_code = RequestsTools::validate_inJson(body, inJson, {"ancien", "nouveau"});

                if (status_code == STATUS_OK) {
                    int oldPosition = inJson["ancien"].GetInt();
                    int newPosition = inJson["nouveau"].GetInt();

                    cout << "***\n[INFO] Old Songs Queue content : " << endl;
                    SoundManager::getSongsQueue().printSongsQueue();

                    if (SoundManager::getSongsQueue().switchSongPlace(oldPosition, newPosition) > -1) {
                        cout << "[INFO] Song position changed from : " <<  oldPosition << " to " << newPosition << "." << endl;
                        cout << "[INFO] New Songs Queue content : " << endl;
                        SoundManager::getSongsQueue().printSongsQueue();
                        cout << "***" << endl;

                        RequestsTools::getLogsManager().songOrderChange(supUsername, SoundManager::getSongsQueue().getSongTitle(newPosition), oldPosition, newPosition);
                    } else {
                        status_code = STATUS_INCORRECT_PLACEMENT;
                        cout << "[REJECT] An error occured while trying to change the song's position (Incorrect placement)." << endl;
                    }
                }
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }
            
            session->close( status_code );
        } );
    }


    /*************************************************
    * Request : get_supervisor_volume_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void get_supervisor_volume_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting get_supervisor_volume_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        string response_body = "";
        int status_code = STATUS_OK;
        auto supUsername = session->get_request()->get_path_parameter( "usager" );

        if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                    
            Document outJson;
            outJson.SetObject();
            
            Value volume, sourdine;
            volume = SoundManager::getVolumeHandler().getVolume();
            sourdine =SoundManager::getVolumeHandler().onMute();
            
            outJson.AddMember("volume", volume, outJson.GetAllocator());
            outJson.AddMember("sourdine", sourdine, outJson.GetAllocator());

            StringBuffer buffer;
            Writer<StringBuffer> writer(buffer);
            outJson.Accept(writer);
            response_body = reinterpret_cast<const char*>(buffer.GetString());

            cout << "[INFO] Returning : " + response_body << endl;

        } else {
            status_code = STATUS_USER_NOT_ID;
            cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
        }

        session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
    }


    /*************************************************
    * Request : post_supervisor_volume_up_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_volume_up_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_volume_up_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            int status_code = STATUS_OK;
            auto percentToInc = session->get_request()->get_path_parameter( "pc" );
            int volumeAdjustment = stoi(percentToInc);
            auto supUsername = session->get_request()->get_path_parameter( "usager" );

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                        
                if ( volumeAdjustment >= 0 && volumeAdjustment <= 100 ) {
                    SoundManager::getVolumeHandler().setVolumeUp(volumeAdjustment);
                    cout << "[INFO] We've received a request to raise volume by " << percentToInc << "% from : " <<  supUsername << endl;
                }

            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            session->close( status_code );
        } );
    }


    /*************************************************
    * Request : post_supervisor_volume_down_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_volume_down_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_volume_down_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            int status_code = STATUS_OK;
            auto percentToInc = session->get_request()->get_path_parameter( "pc" );
            int volumeAdjustment = stoi(percentToInc);
            auto supUsername = session->get_request()->get_path_parameter( "usager" );

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                        
                if ( volumeAdjustment >= 0 && volumeAdjustment <= 100 ) {
                    SoundManager::getVolumeHandler().setVolumeDown(volumeAdjustment);
                    cout << "[INFO] We've received a request to decrease volume by " << percentToInc << "% from : " <<  supUsername << endl;
                }

            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            session->close( status_code );
        } );

    }


    /*************************************************
    * Request : post_supervisor_volume_mute_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_volume_mute_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_volume_mute_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            cout << "[INFO] We've received a request to mute the volume from : " <<  supUsername << endl;
            int status_code = STATUS_OK;

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                SoundManager::getVolumeHandler().activateMute();                
               
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            session->close( status_code );
        } );
    }


    /*************************************************
    * Request : post_supervisor_volume_unmute_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_volume_unmute_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_volume_unmute_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            cout << "[INFO] We've received a request to unmute the volume from : " <<  supUsername << endl;

            int status_code = STATUS_OK;

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {
                SoundManager::getVolumeHandler().desactivateMute();             
               
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            session->close( status_code );
        } );;
    }

    /*************************************************
    * Request : post_supervisor_block_user_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_block_user_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_block_user_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            int status_code = STATUS_OK;
            
            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {

                Document inJson;
                status_code = RequestsTools::validate_inJson(body, inJson, {"ip", "MAC", "nom"});

                if (status_code == STATUS_OK) {
                    cout << "[INFO] We've received a request from sup " <<  supUsername << " to block user with MAC " << inJson["MAC"].GetString() << endl;
                    IUser client = { inJson["ip"].GetString(), inJson["MAC"].GetString(), inJson["nom"].GetString() };
                    RequestsTools::getBlacklistHandler().block_client(client);
                }
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }

    /*************************************************
    * Request : post_supervisor_unblock_user_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void post_supervisor_unblock_user_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting post_supervisor_unblock_user_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            int status_code = STATUS_OK;

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {

                Document inJson;
                status_code = RequestsTools::validate_inJson(body, inJson, {"MAC"});

                if (status_code == STATUS_OK) {
                    cout << "[INFO] We've received a request from sup " <<  supUsername << " to unblock user with MAC " << inJson["MAC"].GetString() << endl;
                    RequestsTools::getBlacklistHandler().unblock_client(inJson["MAC"].GetString());
                }

            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }

    /*************************************************
    * Request : get_supervisor_blacklist_handler
    * From    : Android Supervisor Mode
    **************************************************/
    static void get_supervisor_blacklist_handler( const shared_ptr< Session > session ) {
        cout << endl << "Starting get_supervisor_blacklist_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );


        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            auto supUsername = session->get_request()->get_path_parameter( "usager" );
            int status_code = STATUS_OK;
            string response_body = "";

            if (RequestsTools::getAuthentificationHandler().is_supervisor_logged_in(supUsername)) {

                // Creating the Json that is returned
                Document outJson;
                outJson.SetObject();

                // Blocked users infos array
                Value blocked(kArrayType);

                // Get the blacklist from the BlacklistHandler
                vector<IUser> blocked_users = RequestsTools::getBlacklistHandler().get_all_blacklisted_users();

                for (auto it = blocked_users.begin(); it != blocked_users.end(); it++) {
                    // Nested json 
                    Value jsonInfo (kObjectType);
                    Value ip, mac, name; 
                    mac = StringRef(it->mac.c_str());
                    ip = StringRef(it->ip.c_str());
                    name = StringRef(it->username.c_str());

                    jsonInfo.AddMember("ip", ip, outJson.GetAllocator());
                    jsonInfo.AddMember("MAC", mac, outJson.GetAllocator());
                    jsonInfo.AddMember("nom", name, outJson.GetAllocator());

                    blocked.PushBack(jsonInfo, outJson.GetAllocator());
                }

                outJson.AddMember("bloques", blocked, outJson.GetAllocator());

                StringBuffer buffer;
                Writer<StringBuffer> writer(buffer);
                outJson.Accept(writer);
                response_body = reinterpret_cast<const char*>(buffer.GetString());
                
                cout << "[INFO] Sending users blackList to : " <<  supUsername << endl;
            } else {
                status_code = STATUS_USER_NOT_ID;
                cout << "[REJECT] Supervisor " << supUsername << " not found in supervisors list or not connected." << endl;
            }

            session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
        } );
    }
};

#endif
