******************************************************************************

INF3995 : How to install and launch the server on a fpga card with Arcchlinux

******************************************************************************

Dependencies:

    On an Archlinux system, use "pacman -Sy" + "librairy name" in the command line 
	to download the following librairies :
        - Restbed
        - RapidJson
        - Libmad
        - alsa-plugins
        - alsa-utils
        - Taglib
        - Zlib


Compilation :

    In the folder /serveur/src, the file main.cpp contains the IP address of the server. 
	Replace the define IP_ADDR_CARD with your distant server IP.
    Then open a terminal in /serveur/ and launch the server with the command (with root authorization):
		-   On distant server : make runc -j4 
        -   On localhost : sudo make runl -j4 
				- Note : By default the volume constroler we used is set to the FPGA sound card,
				to run on the PC, you need to change the define 'PLAYING_ON_CARD' to 'false' on the 23rd line
				of the file /serveur/src/soundManager/VolumeHandler.h(TODO : precise ine VolumeHandler.h false)
        


Folder structure :
	- database : 
		- accounts : contains the different accounts information (for the admin and the supervisors)
		- blacklist : contains the blacklist with all blocked user
		- logs : contains the server logs
		- songsToPlay : folder where we keep the mp3 files of the song currently in the server queue
		- ssl and sslCard : contains the key and certificate required for https request

	- docs :
		- testRequests.txt : list of requests available in curl command line
		- boot_with_systemd : file to put on card and a Readme with commands line about how to handler the 
		server if it's enabled as a systemD service
		- alsa_config_file : this file is the Alsa configuration file we used, must be placed in /etc/

	- src : the source code
	

