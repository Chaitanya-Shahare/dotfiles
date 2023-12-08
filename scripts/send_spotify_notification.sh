#!/bin/bash

# Initialize variables to keep track of the current song
current_song=""
current_artist=""

# Check for song changes in a loop
while true; do
    # Get the current song and artist from Spotify
    song_info=$(osascript -e 'tell application "Spotify" to name of current track & " - " & artist of current track')

    # Check if the song has changed
    if [ "$song_info" != "$current_song" ]; then
        # Send or update the notification
        osascript -e "display notification \"$song_info\" with title \"Now Playing\""

        # Update the current song
        current_song="$song_info"
    fi

    # Sleep for a few seconds before checking again
    sleep 1
done
