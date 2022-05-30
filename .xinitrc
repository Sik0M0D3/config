#!/bin/sh
# Define dwm as desktop session.
export XDG_SESSION_DESKTOP='dwm'
export XDG_CURRENT_DESKTOP='dwm'

a-start & # autostart background programs with this script on ~/.local/bin.
while :; do # Run dwm on an infinite loop so it can be restarted on dwm quit.
  dwm 2> ~/.config/dwm.log || break && a-kill # break loop and autokill all background programs.
done
