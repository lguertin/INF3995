package com.yellemon.service;


import android.os.StrictMode;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;

import java.io.IOException;

//This class implements a service that returns lyrics from Genius api or google.

/**
 * The type Lyrics service.
 */
public class LyricsService {

    /**
     * Instantiates a new Lyrics service.
     */
    public LyricsService() {
    }

    /**
     * Gets lyrics from Genious Api .
     *
     * @param artist the artist
     * @param title  the title
     * @return the lyrics
     */
    public String getLyrics(String artist, String title) {
        String baseUrl = "https://genius.com/";

        //artist
        String temp1 = artist.replaceAll("\\(.*?\\) ?", "");
        String tempArtist = temp1.replaceAll("\\s", "-");

        //title
        String temp2 = title.replaceAll("\\(.*?\\) ?", "");
        String tempTitle = temp2.replaceAll("\\s", "-");

        //all
        String arg = (tempArtist + "-" + tempTitle + "-lyrics").replaceAll("[^a-zA-Z0-9\\w-]+", "");
        String url = baseUrl + arg;

        String lyrics;
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Document doc = Jsoup.connect(url).get();
            lyrics = doc.getElementsByClass("lyrics").toString();
            Document.OutputSettings settings = new Document.OutputSettings();
            settings.prettyPrint(false);
            lyrics = Jsoup.clean(lyrics, "", Whitelist.none(), settings);

        } catch (IOException e) {
            lyrics = getGoogleLyrics(artist, title);
        }
        return lyrics;
    }

    /**
     * Gets lyrics from Google.
     *
     * @param artist the artist
     * @param title  the title
     * @return the google lyrics
     */
    private String getGoogleLyrics(String artist, String title) {
        String url = "https://google.com/search?q=" + artist + " " + title + " lyrics";
        String lyrics = "Aucun lyric trouvé pour cette chanson...";
        try {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
            StrictMode.setThreadPolicy(policy);

            Document doc = Jsoup.connect(url).get();
            lyrics = doc.getElementsByClass("iw7h9e").toString();
            Document.OutputSettings settings = new Document.OutputSettings();
            settings.prettyPrint(false);
            lyrics = Jsoup.clean(lyrics, "", Whitelist.none(), settings);

        } catch (IOException e) {
            // lyrics = musixmatchAPI call ?
        }
        return lyrics;
    }


}
