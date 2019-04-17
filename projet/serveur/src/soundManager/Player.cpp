
#include "Player.h"


snd_pcm_t *sndPcm;

/*
* Default construtor
*/
Player::Player() { 
}

/***************************************************************************
* Method        : getFileInfos
* Desciption    : Create file descriptor to manipulate mp3 file
****************************************************************************/
FILE* Player::getFileInfos(string fileName) {
    return fopen(fileName.c_str(), "r");
}

/*****************************************************************************
* Method        : decodeID3_header
* Desciption    : Get the infos from the mp3 file header and song properties
*****************************************************************************/
ISongInfos Player::decodeID3_header(string fileName) {

    // TAG INFOS
    TagLib::FileRef f(fileName.c_str());
    ISongInfos songInfos = {};

    if(hasID3Header(fileName) && f.audioProperties()) {
        TagLib::Tag *tag = f.tag();
       
        // TAG PROPERTIES
        TagLib::AudioProperties *properties = f.audioProperties();

        int seconds = properties->length() % 60;
        int minutes = (properties->length() - seconds) / 60;

        string duree = seconds < 10 ? (to_string(minutes) + ":" + "0" + to_string(seconds)) : (to_string(minutes) + ":" + to_string(seconds));

        songInfos = { tag->title().to8Bit(), tag->artist().to8Bit(), duree, properties->sampleRate(), properties->channels()};
        
    }

    return songInfos;
}

/*****************************************************************************
* Method        : print_infos
* Desciption    : Print the infos from the mp3 file header and song properties
*****************************************************************************/
void Player::print_infos(string fileName) {
    TagLib::FileRef f(fileName.c_str());
    ISongInfos songInfos = {};

    TagLib::Tag *tag = f.tag();

    cout << endl << "-- PLAYING SONG'S TAG INFOS --" << endl;
    cout << "title   - \"" << tag->title() << "\"" << endl;
    cout << "artist  - \"" << tag->artist()  << "\"" << endl;
    cout << "year    - \"" << tag->year()    << "\"" << endl;
    
    // TAG PROPERTIES
    TagLib::AudioProperties *properties = f.audioProperties();

    int seconds = properties->length() % 60;
    int minutes = (properties->length() - seconds) / 60;

    cout << "-- AUDIO --" << endl;
    cout << "bitrate     - " << properties->bitrate() << endl;
    cout << "sample rate - " << properties->sampleRate() << endl;
    cout << "channels    - " << properties->channels() << endl;
    cout << "length      - " << minutes << ":" << setfill('0') << setw(2) << seconds << endl << endl;
}

/*****************************************************************************
* Method        : hasID3Header
* Desciption    : Check if the mp3 file has a ID3 tag
*****************************************************************************/
bool Player::hasID3Header(string fileName) {

    TagLib::FileRef f(fileName.c_str());
    File* file(f.file());

    // Check if the file has a valid ID3v1 or v2 header
    if (findID3v1(file) == -1 && findID3v2(file) ==-1) {
        cout << "MP3 File has no ID3 v1 or v2 tag!" << endl;
        return false;
    }

    // Check if the file has a tag
    if (f.isNull() || !f.tag())
        cout << "MP3 File has no tag!" << endl;
    
    return !f.isNull() && f.tag();
}

/*****************************************************************************
* Method        : findID3v1
* Desciption    : Check if the mp3 file has a ID3 v1 tag
*****************************************************************************/
// Taken from : https://github.com/taglib/taglib/blob/master/taglib/tagutils.cpp
long Player::findID3v1(File *mp3File) {
  if(!mp3File->isValid())
    return -1;

  mp3File->seek(-128, File::End);
  const long p = mp3File->tell();

  if(mp3File->readBlock(3) == ID3v1::Tag::fileIdentifier())
    return p;

  return -1;
}

/*****************************************************************************
* Method        : findID3v2
* Desciption    : Check if the mp3 file has a ID3 v2 tag
*****************************************************************************/
// Taken from : https://github.com/taglib/taglib/blob/master/taglib/tagutils.cpp
long Player::findID3v2(File *mp3File) {
  if(!mp3File->isValid())
    return -1;

  mp3File->seek(0);

  if(mp3File->readBlock(3) == ID3v2::Header::fileIdentifier())
    return 0;

  return -1;
}


/*****************************************************************************
* Method        : init_sound
* Desciption    : Inits the device card that will play the songs
*****************************************************************************/
int Player::init_sound(const char* cardName, unsigned int sampleRate, int channels) {
    int err_snd;
    snd_pcm_hw_params_t *params;

    if ((err_snd = snd_pcm_open(&sndPcm, cardName, SND_PCM_STREAM_PLAYBACK, 0)) < 0) {
        printf("failed to open pcm device (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_malloc(&params)) < 0) {
        printf("cannot allocate hardware parameter structure (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_any(sndPcm, params)) < 0) {
        printf("failed to initialize hardware parameter structure (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_set_access(sndPcm, params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {
        printf("cannot set access type (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_set_format(sndPcm, params, SND_PCM_FORMAT_S32_LE)) < 0) {
        printf("cannot set sample format (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_set_rate_near(sndPcm, params, &sampleRate, 0)) < 0) {
        printf("cannot set sample format (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params_set_channels(sndPcm, params, channels)) < 0) {
        printf("cannot set channel count (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_hw_params(sndPcm, params)) < 0) {
        printf("cannot set parameters (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    if ((err_snd = snd_pcm_prepare(sndPcm)) < 0) {
        printf("cannot prepare audio interface for use (%s)\n", snd_strerror(err_snd));
        return -1;
    }

    snd_pcm_hw_params_free(params);

    return 0;
}

/*****************************************************************************
* Method        : playSong
* Desciption    : Initializes the device and play song in it
*****************************************************************************/
int Player::playSong(string fileName, bool playingOnCard) {

    // Get decoding header informations
    ISongInfos infos = decodeID3_header(fileName);

    print_infos(fileName);
    struct stat fileInfo;
    void *filedescMap;

    // Select the and cardName depending on wether or not we're playing on the card
    const char* cardName = playingOnCard ? SOUND_CARD_SD : SOUND_CARD_PC;

    if (init_sound(cardName, infos.sampleRate, infos.channels) < 0)
        std::cout << "Error while trying to init the device!!! " << endl;
    
    FILE* fd = getFileInfos(fileName);

    int no = fileno(fd);

    if (no < 0) std::cout << "Error while trying to open a file!!! " << no << endl;

    if (fstat(no, &fileInfo) == -1 || fileInfo.st_size == 0) {
        return -1;
    }

    // Map the file into memory
    filedescMap = mmap(0, fileInfo.st_size, PROT_READ, MAP_SHARED, no, 0);
    if (filedescMap == MAP_FAILED) {
        return -1;
    }

    // Start  frames decoding
    unsigned char *inStream = static_cast<unsigned char *>(filedescMap);
    decode(inStream, fileInfo.st_size);

    // Unmap the file
    munmap(filedescMap, fileInfo.st_size);

    // Close sound PCM and file
    snd_pcm_close(sndPcm);
    fclose(fd);

    return 0;

}


/*****************************************************************************
* Call_Back function    : mad_flow output
* Desciption            : Get the frames and pass them through the 
                          decoding precess
*****************************************************************************/
static enum mad_flow input(void *data, struct mad_stream *stream) {
	struct buffer *buffer = (struct buffer *)data;

	if (!buffer->length) {
		cout << "\n *** THE END ***\n" << endl ;
		return MAD_FLOW_STOP;
	}

	mad_stream_buffer(stream, buffer->start, buffer->length);

	buffer->length = 0;
	return MAD_FLOW_CONTINUE;
}


/*****************************************************************************
* Call_Back function    : mad_flow output
* Desciption            : Get the results of the frames decoding and write 
                          them to the output buffer
*****************************************************************************/
static enum mad_flow output(void *data, struct mad_header const *header, struct mad_pcm *madPcm) {
	unsigned int nchannels, nsamples;
	mad_fixed_t const *left_ch, *right_ch;
	vector<char> outStream;

	nchannels = madPcm->channels;
	nsamples = madPcm->length;
	left_ch = madPcm->samples[0];
	right_ch = madPcm->samples[1];

    for(unsigned int i = 0; i < nsamples; i++) {  
        signed int sample = madPcm->samples[0][i];
        outStream.push_back((sample >> 0) & 0xff);
        outStream.push_back(sample >> 8);
        outStream.push_back(sample >> 16);
        outStream.push_back(sample >> 24);

        if (nchannels == 2) {
            signed int sample = madPcm->samples[1][i];
            outStream.push_back((sample >> 0) & 0xff);
            outStream.push_back(sample >> 8);
            outStream.push_back(sample >> 16);
            outStream.push_back(sample >> 24);
        }

    }

    int err_snd; 
    if ((err_snd = snd_pcm_writei(sndPcm, outStream.data(), madPcm->length)) != madPcm->length) {
        // cout << "Error while trying to write the output data " << snd_strerror(err_snd) << endl;
        
    }

	return MAD_FLOW_CONTINUE;
}


/*****************************************************************************
* Call_Back function    : mad_flow error
* Desciption            : Detects error during decoding mp3 frames
*****************************************************************************/
static enum mad_flow error(void *data, struct mad_stream *stream, struct mad_frame *frame) {
	struct buffer *buffer = (struct buffer *)data;

	if (MAD_RECOVERABLE(stream->error)) {
		// cout << "MAD_RECOVERABLE " << endl;
	}
	else if (stream->error == MAD_ERROR_BUFLEN)	{
		cout << "MAD_ERROR_BUFLEN " << endl;
	}
	else if (stream->error == MAD_ERROR_LOSTSYNC) {
		cout << "MAD_ERROR_LOSTSYNC " << endl;
	}
	else {
		fprintf(stderr, "decoding error 0x%04x (%s) at byte offset %u\n",
            stream->error, mad_stream_errorstr(stream),
            (unsigned int)(stream->this_frame - buffer->start));
	}

	return MAD_FLOW_CONTINUE;
}


/*****************************************************************************
* Method        : decode
* Desciption    : Decodes mp3 file using previous call back function 
*****************************************************************************/
int Player::decode(unsigned char const *start, unsigned long length) {
	struct buffer buffer;
	struct mad_decoder decoder;
	int result;

	buffer.start = start;
	buffer.length = length;

	// Configure input, output, and error functions
	mad_decoder_init(&decoder, &buffer, input, 0, 0, output, error, 0);

	// Start decoding
	result = mad_decoder_run(&decoder, MAD_DECODER_MODE_SYNC);

	// Release the decoder
	mad_decoder_finish(&decoder);

	return result;
}
