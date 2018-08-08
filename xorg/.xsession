#!/usr/bin/env bash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Dunst notification manager.

# Polybar.

# Background images.
#~/.config/i3/bin/background.sh &
