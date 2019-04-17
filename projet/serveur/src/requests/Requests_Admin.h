

#ifndef REQUESTSADMIN_H
#define REQUESTSADMIN_H

/*************************************************************************
* Class         : Requests_Admin
* Desciption    : Handles the requests from the PC App - Admin Mode.
**************************************************************************/
class Requests_Admin {
    private:

    public:
    
    /****************************************
    * Request : post_admin_login_handler
    * From    : App PC  
    *****************************************/
    static void post_admin_login_handler( const shared_ptr< Session > session ) {
        cout << endl << "starting admin_login_handler" << endl;

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
            int status_code = RequestsTools::validate_inJson(body, inJson, {"usager", "mot_de_passe"});
            if ( status_code == STATUS_OK ) {
                status_code = RequestsTools::getAuthentificationHandler().login_admin(inJson["usager"].GetString(), inJson["mot_de_passe"].GetString());
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /****************************************
    * Request : post_admin_logout_handler
    * From    : App PC  
    *****************************************/
    static void post_admin_logout_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting post_admin_logout_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            int status_code = RequestsTools::getAuthentificationHandler().logout_admin();

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }

    /**********************************************
    * Request : post_admin_change_password_handler
    * From    : App PC  
    ***********************************************/
    static void post_admin_change_password_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting post_admin_change_password_handler " << endl;

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
                status_code = RequestsTools::getAuthentificationHandler().change_password_admin(inJson["ancien"].GetString(), inJson["nouveau"].GetString());
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /******************************************
    * Request : get_admin_statistics_handler
    * From    : App PC  
    *******************************************/
    static void get_admin_statistics_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting get_admin_statistics_handler " << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {
            if (RequestsTools::getAuthentificationHandler().is_admin_logged_in()) {

                string response_body = RequestsTools::getStatsManager().statsToJson();
                // RequestsTools::getStatsManager().printStats();
                cout << "[INFO] Sending stats to the Admin. " << endl;
                
                session->close( STATUS_OK, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
            } else 
                cout << "[REJECT] The admin is not logged in." << endl;

            session->close( STATUS_USER_NOT_ID );
        } );
    }


    /************************************
    * Request : post_admin_logs_handler
    * From    : App PC  
    *************************************/
    static void post_admin_logs_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting post_admin_logs_handler " << endl;

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

            if (RequestsTools::getAuthentificationHandler().is_admin_logged_in()) {
                Document inJson;
                status_code = RequestsTools::validate_inJson(body, inJson, {"dernier"});

                if (status_code == STATUS_OK) {
                    
                    int noLastLog = inJson["dernier"].GetInt();
                    string response_body = RequestsTools::getLogsManager().lastLogsToJson(noLastLog);
                    cout << "[INFO] Sending logs to the Admin from no : " << noLastLog << ". " << endl;

                    session->close( status_code, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } }); 
                }
            } else {
                cout << "[REJECT] The admin is not logged in." << endl;
                status_code = STATUS_USER_NOT_ID;
            }

            session->close( status_code );
        } );
    }


    /*************************************************
    * Request : post_admin_create_supaccount_handler
    * From    : App PC  
    **************************************************/
    static void post_admin_create_supaccount_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting post_admin_create_supaccount_handler" << endl;

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
            int status_code = RequestsTools::validate_inJson(body, inJson, {"usager", "mot_de_passe"});

            if (status_code == STATUS_OK) {
                status_code = RequestsTools::getAuthentificationHandler().create_supervisor(inJson["usager"].GetString(), inJson["mot_de_passe"].GetString());
                
                if (status_code == STATUS_OK) {
                    RequestsTools::getLogsManager().createSupAccount(inJson["usager"].GetString());
                    cout << "[INFO] Supervisor account created : " << inJson["usager"].GetString() << ". " << endl;
                }
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /**************************************************
    * Request : post_admin_delete_supaccount_handler
    * From    : App PC  
    ***************************************************/
    static void post_admin_delete_supaccount_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "starting post_admin_delete_supaccount_handler" << endl;

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
            int status_code = RequestsTools::validate_inJson(body, inJson, {"usager"});

            if (status_code == STATUS_OK) {
                status_code = RequestsTools::getAuthentificationHandler().remove_supervisor(inJson["usager"].GetString());
                if (status_code == STATUS_OK) {
                    RequestsTools::getLogsManager().deleteSupAccount(inJson["usager"].GetString());
                    cout << "[INFO] Supervisor account deleted : " << inJson["usager"].GetString() << ". " << endl;
                }
            }

            cout << "[INFO] Status code : " << status_code << endl;
            session->close( status_code );
        } );
    }


    /**********************************************
    * Request : get_admin_list_sup_handler
    * From    : App PC
    ***********************************************/
    static void get_admin_list_sup_handler( const shared_ptr< Session > session ) {
        std :: cout << endl << "Starting get_admin_list_sup_handler" << endl;

        // Check the request is in https
        if (!RequestsTools::secureConnection(session->get_destination())) {
            session->close( STATUS_UNAUTHORIZED );
            return;
        }

        const auto request = session->get_request( );
        size_t content_length = request->get_header( "Content-Length", 0 );

        session->fetch( content_length, [ ]( const shared_ptr< Session >& session, const Bytes& body ) {

            if (RequestsTools::getAuthentificationHandler().is_admin_logged_in()) {

                // Creating the Json that is returned
                Document outJson;
                outJson.SetObject();

                vector<string> supervisorsUsernames = RequestsTools::getAuthentificationHandler().get_supervor_usernames();

                // Supervisors array in Json
                Value supervisors(kArrayType);

                for (auto it = supervisorsUsernames.begin(); it != supervisorsUsernames.end(); it++) {
                    Value sup(it->c_str(), outJson.GetAllocator());
                    supervisors.PushBack(sup, outJson.GetAllocator());
                }

                // Adding the array to the output json
                outJson.AddMember("superviseurs", supervisors, outJson.GetAllocator());

                StringBuffer buffer;
                Writer<StringBuffer> writer(buffer);
                outJson.Accept(writer);
                string response_body = reinterpret_cast<const char*>(buffer.GetString());

                cout << "[INFO] Sending the supervisors list to the Admin. " << endl;
                session->close( STATUS_OK, response_body, { { "Content-Length", ::to_string( response_body.length( )) }, { "Content-Type", "application/json" } });
            } else 
                cout << "[REJECT] The admin is not logged in." << endl;
            
            session->close( STATUS_USER_NOT_ID );
        } );
    };

};

#endif