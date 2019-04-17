#ifndef VOLUMEHANDLER_H
#define VOLUMEHANDLER_H

#include <mutex>
#include <stdio.h>
#include <iostream>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <vector>
#include <iomanip>

#include "mad.h"
#include <alsa/asoundlib.h>


#define VOL_CARD_SD "hw:ADAU1761"
#define VOL_CARD_PC "default"

#define SELEM_CARD_SD "Headphone"
#define SELEM_CARD_PC "Master"

#define PLAYING_ON_CARD true 

#define MAX_PERCENTAGE 100
#define MIN_PERCENTAGE 0

using namespace std;


/***************************************************************
* Class         : Volumehandler
* Desciption    : Handle volume of the sound on the card
****************************************************************/
class VolumeHandler {

    private:
    
        static int volume;
        static bool mute;

    public: 

        VolumeHandler();
        ~VolumeHandler();


        static int getVolume();
        static bool onMute();
        static void initVolELem();

        static void setVolumeUp(long volumeAdjustment);
        static void setVolumeDown(long volumeAdjustment);

        static void activateMute();
        static void desactivateMute();

        static void setAlsaVolume(/*long volumeToSet*/);
        static void putAlsaOnMute( int value);

};

#endif