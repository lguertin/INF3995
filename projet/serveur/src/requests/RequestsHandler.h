
#ifndef REQUESTSHANDLER_H
#define REQUESTSHANDLER_H

#include <thread>
#include <iostream>
#include <memory>
#include <chrono>
#include <cstdlib>
#include <restbed>
#include <rapidjson/document.h> 
#include <rapidjson/writer.h>
#include <rapidjson/stringbuffer.h>
#include <map>

#include "RequestsTools.h"
#include "Requests_Client.h"
#include "Requests_Supervisor.h"
#include "Requests_Admin.h"

#include <experimental/filesystem>
namespace fs = std::experimental::filesystem;

using namespace std;
using namespace restbed;
using namespace rapidjson;



/***************************************************************
* Class         : RequestsHandler
* Desciption    : Handles the different incoming requests.
****************************************************************/
class RequestsHandler {

    private:
        RequestsTools reqTools;    

    public:
        
        shared_ptr<Service> service; 

        RequestsHandler();

        static void service_ready_handler( Service& );
        void serviceStarter(string ip_addr, int port_number, bool onCard) ;
        shared_ptr< Resource > manageResource(string path, string reqType, const std::function< void ( const std::shared_ptr< Session > ) >& callback);
        void resourcePublisher();

        /*************************************
        * Requests from Android - Clients  
        **************************************/
        static void post_user_id_handler( const shared_ptr< Session > session ) { Requests_Client::post_user_id_handler(session); }
        static void get_user_songs_queue_handler( const shared_ptr< Session > session ) { Requests_Client::get_user_songs_queue_handler(session); }
        static void post_user_song_handler( const shared_ptr< Session > session ) { Requests_Client::post_user_song_handler(session); }
        static void delete_user_song_handler( const shared_ptr< Session > session ) { Requests_Client::delete_user_song_handler(session); }


        /*************************************
        * Requests from Android - Supervisors  
        **************************************/
        static void post_supervisor_login_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_login_handler(session); }
        static void post_supervisor_logout_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_logout_handler(session); }
        static void post_supervisor_change_password_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_change_password_handler(session); }
        static void get_supervisor_songs_queue_handler( const shared_ptr< Session > session ) { Requests_Supervisor::get_supervisor_songs_queue_handler(session); }
        static void delete_supervisor_song_handler( const shared_ptr< Session > session ) { Requests_Supervisor::delete_supervisor_song_handler(session); }
        static void post_supervisor_song_position_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_song_position_handler(session); }
        static void get_supervisor_volume_handler( const shared_ptr< Session > session ) { Requests_Supervisor::get_supervisor_volume_handler(session); }
        static void post_supervisor_volume_up_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_volume_up_handler(session); }
        static void post_supervisor_volume_down_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_volume_down_handler(session); }
        static void post_supervisor_volume_mute_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_volume_mute_handler(session); }
        static void post_supervisor_volume_unmute_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_volume_unmute_handler(session); }
        static void post_supervisor_block_user_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_block_user_handler(session); }
        static void post_supervisor_unblock_user_handler( const shared_ptr< Session > session ) { Requests_Supervisor::post_supervisor_unblock_user_handler(session); }
        static void get_supervisor_blacklist_handler( const shared_ptr< Session > session ) { Requests_Supervisor::get_supervisor_blacklist_handler(session); }


        /**************************************
        * Requests from PC - Admin
        **************************************/
        static void post_admin_login_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_login_handler(session); }
        static void post_admin_logout_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_logout_handler(session); }
        static void post_admin_change_password_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_change_password_handler(session); }
        static void get_admin_statistics_handler( const shared_ptr< Session > session ) { Requests_Admin::get_admin_statistics_handler(session); }
        static void post_admin_logs_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_logs_handler(session); }
        static void post_admin_create_supaccount_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_create_supaccount_handler(session); }
        static void post_admin_delete_supaccount_handler( const shared_ptr< Session > session ) { Requests_Admin::post_admin_delete_supaccount_handler(session); }
        static void get_admin_list_sup_handler( const shared_ptr< Session > session ) { Requests_Admin::get_admin_list_sup_handler(session); }

};

#endif