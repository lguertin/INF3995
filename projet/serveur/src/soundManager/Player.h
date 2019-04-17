#ifndef PLAYER_H
#define PLAYER_H

#include <stdio.h>
#include <iostream>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <vector>
#include <iomanip>

#include "mad.h"
#include <alsa/asoundlib.h>

#include <taglib/fileref.h>
#include <taglib/tag.h>
#include <taglib/tpropertymap.h>
#include <taglib/tfile.h>
#include <taglib/id3v1tag.h>
#include <taglib/id3v2header.h>
#include <taglib/apetag.h>

#include "../interfaces/ISongInfos.h"

#define SOUND_CARD_SD "default"
#define SOUND_CARD_PC "plughw:0,0"

using namespace std;
using namespace TagLib;

/*
* Buffer that contain decoding data struct
*/
struct buffer {
	unsigned char const *start;
	unsigned long length;
};


/***************************************************************
* Class         : Player
* Desciption    : Plays sound on the card
****************************************************************/
class Player {

    private:

    public: 

        Player();

        static FILE* getFileInfos(string fileName);

        static ISongInfos decodeID3_header(string fileName);

        static void print_infos(string fileName);

        static bool hasID3Header(string fileName);

        static long findID3v1(File *mp3File) ;

        static long findID3v2(File *mp3File);

        static int init_sound(const char* cardName, unsigned int sampleRate, int channels);

        static int playSong(string fileName, bool playingOnCard);

        static int decode(unsigned char const *start, unsigned long length);
        
};

#endif