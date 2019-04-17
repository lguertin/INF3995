package com.yellemon.view;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.TextView;

import com.yellemon.service.LyricsService;

// Classe de l'activité du client qui gère la vue et informe le présenter des requêtes à envoyer en fonction
// des actions de l'utilisateur. Cette classe créée une vue en se basant sur une disposition au format .XML
// et lie les fragments de cette vue aux fonctions du presenter qu'elle a en attribut.

/**
 * The type Lyrics activity.
 */
public class LyricsActivity extends AppCompatActivity {

    private final LyricsService lyricsService = new LyricsService();
    private TextView lyrics;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.client_lyrics_activity);
        this.lyrics = this.findViewById(R.id.lyrics);
        Intent intent = getIntent();
        fetchLyrics(intent.getStringExtra("artist"), intent.getStringExtra("trackName"));
    }

    private void fetchLyrics(String artist, String title) {
        setLyrics(lyricsService.getLyrics(artist, title));
    }

    /**
     * Set lyrics.
     *
     * @param lyrics the lyrics
     */
    public void setLyrics(String lyrics) {
        this.lyrics.setText(lyrics);
    }
}


