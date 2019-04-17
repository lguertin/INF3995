
#include "VolumeHandler.h"

/*
* Default construtor
*/
VolumeHandler::VolumeHandler() {
    initVolELem();
}

/*
* Declaration of global variables
*/
long actualVol = 0;
snd_mixer_t* handle;
snd_mixer_selem_id_t* sid;
snd_mixer_elem_t* elem;
long minVol = 0;
long maxVol = 0;

// Select the and cardName depending on wether or not we're playing on the card
const char* card = PLAYING_ON_CARD ? VOL_CARD_SD : VOL_CARD_PC;
const char* selem_name = PLAYING_ON_CARD ? SELEM_CARD_SD : SELEM_CARD_PC;

/*
* Default destructor to close sound card handle
*/
VolumeHandler::~VolumeHandler() {
    /* | Old way | */
    // snd_mixer_close(handle);
}

/*
* Initialize of static attributes
*/
bool VolumeHandler::mute = false;
int VolumeHandler::volume = 50;
mutex volHandleMutex;

/***************************************************************************
* Method        : initVolELem
* Desciption    : Initializes the sound card device to set volume parameters
****************************************************************************/
// Adapted from : https://stackoverflow.com/questions/6787318/set-alsa-master-volume-from-c-code 
void VolumeHandler::initVolELem() {
    snd_mixer_open(&handle, 0);
    snd_mixer_attach(handle, card);
    snd_mixer_selem_register(handle, NULL, NULL);
    snd_mixer_load(handle);

    snd_mixer_selem_id_alloca(&sid);
    snd_mixer_selem_id_set_index(sid, 0);
    snd_mixer_selem_id_set_name(sid, selem_name);
    elem = snd_mixer_find_selem(handle, sid);

    long min, max;
    snd_mixer_selem_get_playback_volume(elem, SND_MIXER_SCHN_FRONT_LEFT, &actualVol);

    snd_mixer_selem_get_playback_volume_range(elem, &min, &max);

    minVol = min;
    maxVol = max;

    setAlsaVolume();

    /* | Old way |
    volume = MAX_PERCENTAGE * (actualVol - min) / (max - min);
    snd_mixer_selem_set_playback_volume_all(elem, actualVol);


    cout << "actualVol " << actualVol << endl;
    cout << "min " << minVol << endl;
    cout << "max " << maxVol << endl;
    */

}

/***************************************************************************
* Method        : getVolume
* Desciption    : Returns the actual percentage of the volume of alsamixer
****************************************************************************/
int VolumeHandler::getVolume() {
    lock_guard<mutex> lock(volHandleMutex);

    return volume;
}

/***************************************************************************
* Method        : onMute
* Desciption    : Returns true if the sound is on mute
****************************************************************************/
bool VolumeHandler::onMute() {
    lock_guard<mutex> lock(volHandleMutex);

    return mute;
}

/***************************************************************************
* Method        : setVolumeUp
* Desciption    : Called to increase the volume percentage
****************************************************************************/
void VolumeHandler::setVolumeUp(long volumeAdjustment) {
    lock_guard<mutex> lock(volHandleMutex);
    
    if (mute) {
        putAlsaOnMute(1);
    }
    mute = false;

    volume += volumeAdjustment;
    if (volume >= MAX_PERCENTAGE) {
        volume = MAX_PERCENTAGE;
    }
    
    setAlsaVolume();

    /* | Old way |
    snd_mixer_selem_get_playback_volume(elem, SND_MIXER_SCHN_FRONT_LEFT, &actualVol);
    volume += volumeAdjustment;
    long volumeToSet = actualVol + volumeAdjustment * maxVol / MAX_PERCENTAGE;

    if (volumeToSet >= maxVol) volumeToSet = maxVol;
    if (volume >= MAX_PERCENTAGE) {
        volume = MAX_PERCENTAGE;
        volumeToSet = maxVol;
    }
    setAlsaVolume(volumeToSet);
    */
}

/***************************************************************************
* Method        : setVolumeDown
* Desciption    : Called to decrease the volume percentage
****************************************************************************/
void VolumeHandler::setVolumeDown(long volumeAdjustment) {
    lock_guard<mutex> lock(volHandleMutex);    
    if (mute) {
        putAlsaOnMute(1);
    }
    mute = false;

    volume -= volumeAdjustment;

    // When decreasing if volume equals 0, activate mute 
    if (volume <= MIN_PERCENTAGE) {
        volume = MIN_PERCENTAGE;
        setAlsaVolume();
        putAlsaOnMute(0);
        mute = true;
    } else {
        setAlsaVolume();
    }

    /* | Old way |
    snd_mixer_selem_get_playback_volume(elem, SND_MIXER_SCHN_FRONT_LEFT, &actualVol);
    long volumeToSet = actualVol - volumeAdjustment * maxVol / MAX_PERCENTAGE;
    volume -= volumeAdjustment;

    if (volume <= MIN_PERCENTAGE) {
        volume = MIN_PERCENTAGE;
        putAlsaOnMute(0);
        volumeToSet = minVol;
        mute = true;
    } else {
        setAlsaVolume(volumeToSet);
    }
    setAlsaVolume(volumeToSet);
    */
}

/***************************************************************************
* Method        : setVolumeDown
* Desciption    : Called to activate the mute mode on alsa
****************************************************************************/
void VolumeHandler::activateMute() {
    lock_guard<mutex> lock(volHandleMutex);

    mute = true;
    putAlsaOnMute(0);

}

/***************************************************************************
* Method        : setVolumeDown
* Desciption    : Called to desactivate the mute mode on alsa
****************************************************************************/
void VolumeHandler::desactivateMute() {
    lock_guard<mutex> lock(volHandleMutex);

    if (volume != MIN_PERCENTAGE) {
        mute = false;
        putAlsaOnMute(1);
        setAlsaVolume();
    }

    /* | Old way |
    snd_mixer_selem_get_playback_volume(elem, SND_MIXER_SCHN_FRONT_LEFT, &actualVol);
    if (actualVol != minVol) {
        mute = false;
        putAlsaOnMute(1);
        setAlsaVolume(actualVol);
    }
    */
}

/***************************************************************************
* Method        : setAlsaVolume
* Desciption    : Give alsa element the wanted volume percentage 
* Precision     : Now using amixer command lines because it synchronizes
                  alsamixer with the actual percentage that is returned 
                  to android app. Old way works fine too but without that 
                  synchronization
****************************************************************************/
void VolumeHandler::setAlsaVolume(/*long volumeToSet*/)  {
    // Using Amixer which converts a percentage directly to Alsamixer scale, 
    // which gives a better representation of what human ear perceives
    string pctg = to_string(volume) + "%";
    string controler = PLAYING_ON_CARD ? SELEM_CARD_SD : SELEM_CARD_PC;

    string cmdLine = "amixer set -M " + controler + " " + pctg;

    if (system(cmdLine.c_str()) != 0) {
        cout << "Error while trying to call amixer." << endl; 
    }

    /* | Old way |
    snd_mixer_selem_get_playback_volume_range(elem, &minVol, &maxVol);
    snd_mixer_selem_set_playback_volume_all(elem, volumeToSet);
    */

}

/***************************************************************************
* Method        : putAlsaOnMute
* Desciption    : Called to switch all elements on/off mute mode on alsa
* Precision     : Now using amixer command lines because it synchronizes
                  alsamixer with the actual percentage that is returned 
                  to android app. Old way works fine too but without that 
                  synchronization
****************************************************************************/
void VolumeHandler::putAlsaOnMute(int value) {

    string controller = PLAYING_ON_CARD ? SELEM_CARD_SD : SELEM_CARD_PC;
    string mode = (value == 0) ? "mute" : "unmute";
    string cmdLine = "amixer set " + controller + " " + mode;
    
    if (system(cmdLine.c_str()) != 0) {
        cout << "Error while trying to call amixer." << endl; 
    }

    /* | Old way |
    if (snd_mixer_selem_has_playback_switch(elem)) {
        if (value == 0) {
            volume = MIN_PERCENTAGE;
            setAlsaVolume();
        }
        snd_mixer_selem_set_playback_switch_all(elem,value);
    }
    */
}