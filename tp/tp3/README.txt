
****************
    Librairie
****************

Nous utilisons Libnavajo disponible à l'adresse : https://github.com/titi38/libnavajo.git
(et une version non compilée de la librairie se trouve dans le répertoire tp3/libnavajo)

Afin de la compiler nous suivons les étapes suivantes :
	mkdir build
	cd build
	cmake ..
	make
	sudo make install

Par la suite pour avoir accès aux fichiers sur la carte nous les avons copiés avec les commandes :
    cp -r  /home/alarm/projects/libnavajo/build/lib/* -r /usr/lib/
    cp -r  /home/alarm/projects/libnavajo/include/* -r /usr/include/


****************
    Structure
****************
La structure du dossier tp3 :
    - libnavajo : contient la librairie compilée
    - src : contient les fichiers sources du serveur et un Makefile
    - src/data : contient les éléments sur le serveur (l'image)


*************************
    Lancer le serveur
*************************
Pour lancer le serveur :
    - effectuer la commade "make" pour compiler le serveur
    - démarrer le serveur avec "./server"