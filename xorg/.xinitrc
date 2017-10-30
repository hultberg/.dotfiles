#!/usr/bin/env bash

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

compton -CGb &
bash -c ~/.screenlayout/layout.sh &
bash -c ~/.config/i3/bin/background.sh &
dunst -config ~/.dunstrc &

exec i3
