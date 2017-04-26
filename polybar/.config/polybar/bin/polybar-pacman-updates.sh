#!/bin/bash

# Checks for pacman (and aur) updates if these conditions are met:
# - /tmp/polybar-pacman-updates-last modification time is higher than $treshold
# - /tmp/polybar-pacman-updates-now exists

if [ ! -f /tmp/polybar-pacman-updates-last ]
then
    touch -d "5 days ago" /tmp/polybar-pacman-updates-last
fi

if [ ! -f /tmp/polybar-pacman-cache ]
then
    touch /tmp/polybar-pacman-cache
fi

last=$(echo $(($(date +%s) - $(date +%s -r /tmp/polybar-pacman-updates-last))))

treshold=120
cache=/tmp/polybar-pacman-cache

if [ $treshold -ge "$last" ] && [ ! -f /tmp/polybar-pacman-updates-now ]
then
    cat $cache
else
    touch /tmp/polybar-pacman-updates-last
    rm -f /tmp/polybar-pacman-updates-now

    pac=$(checkupdates | wc -l)
    aur=$(cower -u | wc -l)

    check=$((pac + aur))

    if [ $check == "0" ]
    then
        echo "" > $cache
        echo ""
    else
        echo "%{F#555555}%{F-} $pac:$aur" > $cache
        echo "%{F#555555}%{F-} $pac:$aur"
    fi
fi
