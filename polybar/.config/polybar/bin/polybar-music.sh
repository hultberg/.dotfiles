#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon_playing=""
icon_paused=""

player_status=$(playerctl-cmus status 2> /dev/null)

if [[ $? -eq 0 ]]; then
    metadata="$(playerctl-cmus metadata artist) - $(playerctl-cmus metadata title)"
fi

player_status=${player_status,,}

# Foreground color formatting tags are optional
if [[ $player_status = "playing" ]]; then
    echo "%{F#D08770}$icon_playing $metadata"       # Orange when playing
elif [[ $player_status = "paused" ]]; then
    echo "%{F#555555}$icon_paused $metadata"       # Greyed out info when paused
else
    echo ""                 # Greyed out icon when stopped
fi
