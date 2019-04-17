////////////////////////////////////////////////////////////////////////////////
/// \file   main.cpp
/// \authors   INF3995 Equipe (03)
///            Christella Cidolit 
///            Issifath Sanni
///            Anis Redjdal   
///            Léandre Guertin
///            Constantin Bouis
/// \Description
///         Main class instanciating and starting the Server
////////////////////////////////////////////////////////////////////////////////

#include <signal.h>
#include <libnavajo/LogStdOutput.hh>
#include <libnavajo/libnavajo.hh>
#include <memory>
#include "server.h"
#include "OnlineRepo.h"

/***********************************************************************/

// WebServer global instance
shared_ptr<WebServer> webServer(new WebServer);

// Exit function assigned to stop signals
void stopServer( int sig )
{
   if (webServer != NULL) webServer->stopService();
}

/***********************************************************************/

// Main funtion instanciating the server and starting it
int main ( int argc, char* argv[] )
{
    // Connecting signals
    signal( SIGTERM, stopServer );
    signal( SIGINT, stopServer );

    // Initializing Server and Repositories
    ServerZynq server(webServer, 80);

    LocalRepository localRep("", "./data");
    server.getWebServer()->addRepository(&localRep);
    OnlineRepo onlineRep;
    server.getWebServer()->addRepository(&onlineRep);

    // Starting and running the server
    server.start();
    server.wait();
    
    LogRecorder::freeInstance();
    return 0;
}



