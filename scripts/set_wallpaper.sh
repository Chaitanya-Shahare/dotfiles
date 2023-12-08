
#!/bin/bash

# Replace the file path with your image file
image_path="/Users/chaitanyashahare/Downloads/javier-miranda-gqCAgAOfhy8-unsplash.jpg"

# Function to set the wallpaper for a specific space
set_wallpaper_for_space() {
    space_id="$1"
		echo "$1"
    osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$image_path\""
}

# Get the list of spaces and set the wallpaper for each space
spaces=$(osascript -e 'tell application "System Events" to get the name of every desktop')
for space in $spaces; do
		echo "$space"
    set_wallpaper_for_space "$space"
done
