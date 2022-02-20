#!/bin/sh


if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] . "$f"
    done
    unset f
fi


# Run only one-time programs
xsct 3800
nitrogen --restore &


#while xsetroot -name " `date '+%a %d %b %Y %R:%S' | sed 's/.*,//'` "
#do
#    sleep 1
#done &


#mv ~/.config/xsession-errors ~/.config/xsession-errors.old
#exec dwm > ~/.config/xsession-errors 2>&1
exec ~/.src/dwm/scripts/./autostart.sh
