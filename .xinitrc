#!/bin/bash

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] . "$f"
    done
    unset f
fi

exec ~/.config/./auto.sh &
while :; do
    ssh-agent dwm
done
