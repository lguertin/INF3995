##############################
#     Makefile Server		 #
##############################


LIB_DIR  = lib
CXX 	 =  g++
SRC_DIR  = src/
BUILD_DIR  = build/

LIBS     = -l restbed -L/usr/$(LIB_DIR) -L/usr/local/$(LIB_DIR) -lssl -lcrypto -pthread -lstdc++fs -lasound -lmad -ltag -lz
DEFS     =  -DLINUX -g -Wall -Wno-unused -fexceptions -fPIC -D_REENTRANT
CXXFLAGS =  -O4  -Wdeprecated-declarations
INCLUDE = -I/usr/include/ -I/usr/local/include/

LDFLAGS  = -g -Wall -Wno-unused -O3   

PROG = main
OBJS =  main.o RequestsHandler.o AuthentificationHandler.o BlacklistHandler.o Player.o VolumeHandler.o SoundManager.o


#######################
# DEPENDENCE'S RULES  #
#######################

all: $(PROG)

$(PROG): $(OBJS)
	$(CXX) $(LDFLAGS) -o $(PROG) $(OBJS) $(LIBS) 
	@for i in $(OBJS); do  rm -f $$i ; done
	@rm -f database/songsToPlay/*
	@rm -f database/logs/*

BlacklistHandler.o: $(SRC_DIR)blacklist/BlacklistHandler.cpp $(SRC_DIR)blacklist/*.h $(SRC_DIR)utils/FileManager.h $(SRC_DIR)utils/Utils.h
	$(CXX) -c $(SRC_DIR)blacklist/BlacklistHandler.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

AuthentificationHandler.o: $(SRC_DIR)authentification/AuthentificationHandler.cpp $(SRC_DIR)authentification/*.h $(SRC_DIR)utils/FileManager.h $(SRC_DIR)utils/Utils.h
	$(CXX) -c $(SRC_DIR)authentification/AuthentificationHandler.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

RequestsHandler.o: $(SRC_DIR)requests/RequestsHandler.cpp $(SRC_DIR)requests/*.h $(SRC_DIR)songs/Song.h $(SRC_DIR)songs/SongsQueueHandler.h $(SRC_DIR)utils/LogsManager.h $(SRC_DIR)utils/StatsManager.h $(SRC_DIR)utils/Utils.h
	$(CXX) -c $(SRC_DIR)requests/RequestsHandler.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

Player.o: $(SRC_DIR)soundManager/Player.cpp 
	$(CXX) -c $(SRC_DIR)soundManager/Player.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

VolumeHandler.o: $(SRC_DIR)soundManager/VolumeHandler.cpp 
	$(CXX) -c $(SRC_DIR)soundManager/VolumeHandler.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

SoundManager.o: $(SRC_DIR)soundManager/SoundManager.cpp $(SRC_DIR)soundManager/Player.h $(SRC_DIR)soundManager/VolumeHandler.h $(SRC_DIR)songs/SongsQueueHandler.h $(SRC_DIR)utils/LogsManager.h $(SRC_DIR)utils/Utils.h
	$(CXX) -c $(SRC_DIR)soundManager/SoundManager.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)

main.o: $(SRC_DIR)main.cpp $(SRC_DIR)requests/RequestsHandler.h $(SRC_DIR)authentification/AuthentificationHandler.h $(SRC_DIR)blacklist/BlacklistHandler.h $(SRC_DIR)soundManager/SoundManager.h  $(SRC_DIR)blacklist/BlacklistHandler.h $(SRC_DIR)soundManager/Player.h $(SRC_DIR)soundManager/VolumeHandler.h
	$(CXX) -c $(SRC_DIR)main.cpp $(CXXFLAGS) $(DEFS) $(INCLUDE)


clean:
	@rm -f $(PROG) 
	@for i in $(OBJS); do  rm -f $$i ; done
	@rm -f database/songsToPlay/*
	@rm -f database/logs/*

#localhost
runl: $(PROG)
	./main -l

#sdCard
runc:	$(PROG)
	./main
