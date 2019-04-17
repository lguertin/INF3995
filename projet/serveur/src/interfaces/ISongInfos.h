#ifndef ISONGINFOS
#define ISONGINFOS

#include <string>

/***************************************************************************
* Interface      : ISongInfos
* Description    : Represents the informations about a song.
***************************************************************************/
struct ISongInfos {
    std::string titre;   // Song's title
    std::string artiste; // Song's artist
    std::string duree;   // Song's duration

    int sampleRate;      // Song's samplerate
	int channels;        // Song's channels number
};

#endif