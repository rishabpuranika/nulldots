#!/bin/bash

# Function to get song from various music players
get_current_song() {
    # Try MPD (Music Player Daemon)
    if command -v mpc &> /dev/null; then
        mpc current | cut -c1-50
        return 0
    fi

    # Try Spotify (requires playerctl)
    if command -v playerctl &> /dev/null; then
        spotify_status=$(playerctl -p spotify status 2>/dev/null)
        if [[ "$spotify_status" == "Playing" ]]; then
            playerctl -p spotify metadata --format '{{artist}} - {{title}}' | cut -c1-50
            return 0
        fi
    fi

    # Try MPRIS-compatible players
    if command -v playerctl &> /dev/null; then
        playerctl metadata --format '{{artist}} - {{title}}' | cut -c1-50
        return 0
    fi

    # Fallback if no music is playing
    echo "No music playing"
    return 1
}

get_current_song
