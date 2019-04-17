
#include "RequestsHandler.h"


/*
* Default constructor 
*/
RequestsHandler::RequestsHandler() {
    service = make_shared< Service >( );
    reqTools = RequestsTools(); 
}

void RequestsHandler::service_ready_handler( Service& ) {
    cout << endl << "*****************************************" << endl;
    cout <<         "*  Hey! The Server is up and running =) *" << endl;
    cout <<         "*****************************************" << endl << endl;
}

/*********************************************************
* Method         : serviceStarter
* Description    : Sets the service parameters
**********************************************************/
void RequestsHandler::serviceStarter(string ip_addr, int port_number, bool onCard) {
    
    auto ssl_settings = make_shared< SSLSettings >( );
    // Give ip address to ssl settings for https
    ssl_settings->set_bind_address( ip_addr );

    fs::path pathKey = onCard ? fs::absolute("./database/sslCard/server.key") : fs::absolute("./database/ssl/server.key");
    fs::path pathCrt = onCard ? fs::absolute("./database/sslCard/server.crt") : fs::absolute("./database/ssl/server.crt");
    fs::path pathPem = onCard ? fs::absolute("./database/sslCard/dh4096.pem") : fs::absolute("./database/ssl/dh768.pem");

    std::string path_Kstring = pathKey.u8string();
    std::string path_Cstring = pathCrt.u8string();
    std::string path_Pstring = pathPem.u8string();

    ssl_settings->set_private_key( Uri( "file://" + path_Kstring ) );
    ssl_settings->set_certificate( Uri( "file://" + path_Cstring ) );
    ssl_settings->set_temporary_diffie_hellman( Uri( "file://" + path_Pstring ) );
    
    auto settings = make_shared< Settings >( );
    settings->set_ssl_settings( ssl_settings );
    
    // set port to 80 for htpp because 443 is known as  Https port default
    settings->set_port(port_number);

    // Fixing a maximum number of users for multithreading.
    settings->set_worker_limit( MAX_USERS );

    // Give ip address to normal settings for http
    settings->set_bind_address( ip_addr );
    
    service->set_ready_handler( service_ready_handler );
    service->start( settings );
}

/*********************************************************
* Method         : manageResource
* Description    : Set a resource path
**********************************************************/
shared_ptr< Resource > RequestsHandler::manageResource(string path, string reqType, const std::function< void ( const std::shared_ptr< Session > ) >& callback) {
    auto resource = make_shared< Resource >( );
    resource->set_path( path );
    resource->set_method_handler( reqType, callback);
    return resource; 
}

/*********************************************************
* Method         : resourcePublisher
* Description    : Exposing all the possible routes
**********************************************************/
void RequestsHandler::resourcePublisher() {

    for (int i = 0 ; i < N_RES ; i++) {
        if (reqTools.resPaths[i] == "/usager/identification") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_user_id_handler) );
        } else if (reqTools.resPaths[i] == "/usager/file/{id: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_user_songs_queue_handler) );
        } else if (reqTools.resPaths[i] == "/usager/chanson/{id: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_user_song_handler) );
        } else if (reqTools.resPaths[i] == "/usager/chanson/{id: [0-9]*}/{no: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], DELETE, RequestsHandler::delete_user_song_handler) );
        }
        else if (reqTools.resPaths[i] ==   "/superviseur/login") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_login_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/logout") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_logout_handler) );
        }  else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/changement_mdp") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_change_password_handler) );
        }  else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/file") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_supervisor_songs_queue_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/chanson/{no: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], DELETE, RequestsHandler::delete_supervisor_song_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/position") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_song_position_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/volume") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_supervisor_volume_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/volume/augmenter/{pc: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_volume_up_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/volume/diminuer/{pc: [0-9]*}") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_volume_down_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/volume/sourdine/activer") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_volume_mute_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/volume/sourdine/desactiver") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_volume_unmute_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/bloquer") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_block_user_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/debloquer") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_supervisor_unblock_user_handler) );
        } else if (reqTools.resPaths[i] == "/superviseur/{usager: .*}/listenoire") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_supervisor_blacklist_handler) );
        }
        else if (reqTools.resPaths[i] == "/admin/login") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_login_handler) );
        } else if (reqTools.resPaths[i] == "/admin/logout") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_logout_handler) );
        } else if (reqTools.resPaths[i] == "/admin/changement_mdp") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_change_password_handler) );
        } else if (reqTools.resPaths[i] == "/admin/statistiques") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_admin_statistics_handler) );
        } else if (reqTools.resPaths[i] == "/admin/logs") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_logs_handler) );
        } else if (reqTools.resPaths[i] == "/admin/creationcompte") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_create_supaccount_handler) );
        } else if (reqTools.resPaths[i] == "/admin/suppressioncompte") {
            service->publish( manageResource(reqTools.resPaths[i], POST, RequestsHandler::post_admin_delete_supaccount_handler) );
        } else if (reqTools.resPaths[i] == "/admin/listesuperviseurs") {
            service->publish( manageResource(reqTools.resPaths[i], GET, RequestsHandler::get_admin_list_sup_handler) );
        }
    }
    
}