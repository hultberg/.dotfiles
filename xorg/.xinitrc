#!/usr/bin/env bash

# Kill the existing compton and dunst processes.
killall -q compton
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x compton >/dev/null; do sleep 1; done
while pgrep -x dunst >/dev/null; do sleep 1; done

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#compton -CGb &
bash -c ~/.screenlayout/layout.sh &
bash -c ~/.config/i3/bin/background.sh &
dunst -config ~/.dunstrc &

exec i3
