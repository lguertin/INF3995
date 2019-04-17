#include "SoundManager.h"

/*
* Default construtor
*/
SoundManager::SoundManager() {}

/*
* Initialization of static members
*/
LogsManager SoundManager::logsManager = LogsManager();
StatsManager SoundManager::statsManager = StatsManager();
SongsQueueHandler SoundManager::songsQueueHandler = SongsQueueHandler();
VolumeHandler SoundManager::volumeHandler = VolumeHandler();
Player SoundManager::player = Player();

SongsQueueHandler SoundManager::getSongsQueue() {
	return songsQueueHandler;
}

VolumeHandler SoundManager::getVolumeHandler() {
	return volumeHandler;
}

mutex databaseMutex;
 
/***************************************************************************
* Method        : play
* Desciption    : Called in a thread in main to play the sound
****************************************************************************/
int SoundManager::play(bool onCard) {

	while(1) {
		try {
			if (!songsQueueHandler.isEmpty()) {
				string fileName = songsQueueHandler.playNextSong().getFileName();
				logsManager.decodingStart(songsQueueHandler.getSongTitle(0));
				player.playSong(fileName, onCard);
				songsQueueHandler.songFinished();
				deleteFile(fileName);
			}
		} catch (const out_of_range& error) {
			//cout << "Error : Queue is empty." << endl;
		}
	}

	return 0;
}

/***************************************************************************
* Method        : saveSong
* Desciption    : Saves the song under mp3 format with 
****************************************************************************/
int SoundManager::saveSong(pair<int, IUser> submittingUser, string string_encoded) {
	lock_guard<mutex> lock(databaseMutex);

	// write encoded data to a file with its daily number 
	string filePath = writeToFile(songsQueueHandler.getNbSongsReceived(), string_encoded);
	
	// Decode entire file if its has ID3 header
	if (player.hasID3Header(filePath)) {

		ISongInfos infos = player.decodeID3_header(filePath);
		Song newSong(infos, submittingUser, filePath);

		if (songsQueueHandler.addSongToQueue(newSong, submittingUser) == 0) {
			logsManager.songReceived(submittingUser.second.username, submittingUser.first, infos.titre);
			statsManager.newSongSubmitted(submittingUser.second, newSong.getDuree());
			return STATUS_OK;
		}
		else {
			deleteFile(filePath);
			return STATUS_SONG_REJECTED; 
		}
	}

	deleteFile(filePath);
	return STATUS_INCORRECT_FORMAT;
}

/***************************************************************************
* Method        : writeToFile
* Desciption    : Creates mp3 format file with the name of the its 
				  submitting position
****************************************************************************/
string SoundManager::writeToFile(int songNo, string string_encoded) {

	// get decoded string
	std::string data_decoded = base64_decode(string_encoded);

	string fileName = SONGSDIRECTORY + std::to_string(songNo) + ".mp3";

	std::ofstream out(fileName,std::ios::binary | std::ios::out);
	out << data_decoded; 
	out.close();

	return fileName.c_str();
}

/***************************************************************************
* Method        : removeSong
* Desciption    : Removes a song from the queue after it's finished or 
				  removed by user or supervisorand delete the mp3 file
****************************************************************************/
int SoundManager::removeSong(pair<int, IUser> *submittingUser, int songNumber, string supUsername) {
	lock_guard<mutex> lock(databaseMutex);

	try {

		Song songRemoved = songsQueueHandler.removeSongFromQueue(submittingUser, songNumber);
		cout << "[INFO] New Songs Queue content : " << endl;
		songsQueueHandler.printSongsQueue();

		deleteFile(songRemoved.getFileName());
		
		// Keep Stats and Logs
		statsManager.songRemoved();

		// For supervisors
		if (submittingUser == nullptr) 
			logsManager.songRemovedBySup(supUsername, songRemoved.getTitre());
		// For clients
		else
			logsManager.songRemovedByUser(submittingUser->second.username, submittingUser->first, songRemoved.getTitre());

		return STATUS_OK;

	} catch (invalid_argument& e) {
		cout << "[Error] " << e.what() << endl;
	}

	cout << "[Error] An error occured while trying to remove the song." << endl;
	return STATUS_DELETE_REJECTED;
}

/***************************************************************************
* Method        : deleteFile
* Desciption    : Called in removeSong to delete the mp3 file 
****************************************************************************/
void SoundManager::deleteFile(string fileName) {

	if (remove(fileName.c_str( )) != 0)
        cout << "Remove operation failed" << endl;
}


// reference : https://github.com/ReneNyffenegger/cpp-base64https://github.com/ReneNyffenegger/cpp-base64 
static const std::string base64_chars = 
						 "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
						 "abcdefghijklmnopqrstuvwxyz"
						 "0123456789+/";


static inline bool is_base64(unsigned char c) {
	return (isalnum(c) || (c == '+') || (c == '/'));
}

/***************************************************************************
* Method        : base64_decode
* Desciption    : Decode the encoded string received from client app 
				  into a string
****************************************************************************/
std::string SoundManager::base64_decode(std::string const& encoded_string) {
	int in_len = encoded_string.size();
	int i = 0;
	int j = 0;
	int in_ = 0;
	unsigned char char_array_4[4], char_array_3[3];
	std::string ret;

	while (in_len-- && ( encoded_string[in_] != '=') && is_base64(encoded_string[in_])) {
		char_array_4[i++] = encoded_string[in_]; in_++;
		if (i ==4) {
			for (i = 0; i <4; i++)
				char_array_4[i] = base64_chars.find(char_array_4[i]);

			char_array_3[0] = ( char_array_4[0] << 2       ) + ((char_array_4[1] & 0x30) >> 4);
			char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);
			char_array_3[2] = ((char_array_4[2] & 0x3) << 6) +   char_array_4[3];

			for (i = 0; (i < 3); i++)
				ret += char_array_3[i];
			i = 0;
		}
	}

	if (i) {
		for (j = 0; j < i; j++)
			char_array_4[j] = base64_chars.find(char_array_4[j]);

		char_array_3[0] = (char_array_4[0] << 2) + ((char_array_4[1] & 0x30) >> 4);
		char_array_3[1] = ((char_array_4[1] & 0xf) << 4) + ((char_array_4[2] & 0x3c) >> 2);

		for (j = 0; (j < i - 1); j++) ret += char_array_3[j];
	}

	return ret;
}
