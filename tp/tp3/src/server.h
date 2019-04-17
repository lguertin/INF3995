////////////////////////////////////////////////////////////////////////////////
/// \file       Server.h
/// \authors   INF3995 Equipe (03)
///            Christella Cidolit 
///            Issifath Sanni
///            Anis Redjdal   
///            Léandre Guertin
///            Constantin Bouis
/// \Description
///         Contains ServerZynq class using a WebServer pointer on which
///         needed methods are called 
////////////////////////////////////////////////////////////////////////////////

#include <libnavajo/libnavajo.hh>
#include <libnavajo/LogStdOutput.hh>
#include <memory>
using namespace std;

////////////////////////////////////////////////////////////////////////////////
/// \Class  ServerZynq       
/// \Description :
///         Classes representing the server on the card
/// \Attibutes :
///         - shared_ptr<WebServer> server
/// \Functions :
///        - ServerZynq(shared_ptr<WebServer> webServer, int port)
///        - void start()
///        - void wait()
///        - shared_ptr<WebServer> getWebServer()
////////////////////////////////////////////////////////////////////////////////
class ServerZynq {

    private:
        shared_ptr<WebServer> server;

    public:
        ServerZynq(shared_ptr<WebServer> webServer, int port): server(webServer) {
            server->setServerPort(port);
            NVJ_LOG->addLogOutput(new LogStdOutput);
        };
        void start() { server->startService(); };
        void wait() { server->wait(); };
        shared_ptr<WebServer> getWebServer() { return server; };
};
