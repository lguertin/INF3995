/**********************************
* 
* Main program of the server
*
**********************************/


#include <restbed>
#include <thread>
#include "requests/RequestsHandler.h"
#include "soundManager/SoundManager.h"

// #define IP_ADDR_LOCAL "127.0.0.1"
#define IP_ADDR_LOCAL "10.200.16.32"
#define IP_ADDR_CARD "132.207.89.31"
#define PORT_LOCAL 8080
#define PORT_CARD 80


using namespace std;
using namespace restbed;


int main( const int argc, const char** args ) {

	string ip_addr = IP_ADDR_CARD;
    int port_number = PORT_CARD;
    bool onCard = true;
  
    if (argc > 1 && strcmp(args[1], "-l") == 0) {
        ip_addr = IP_ADDR_LOCAL;
        port_number = PORT_LOCAL;
        onCard = false;
    }

    SoundManager soundManager;
    thread sm_t = thread(soundManager.play, onCard);


    RequestsHandler requestsHandler;
    requestsHandler.resourcePublisher();
    requestsHandler.serviceStarter(ip_addr, port_number, onCard);

    return EXIT_SUCCESS;
}
