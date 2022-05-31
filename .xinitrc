#!/bin/sh
# Define dwm as desktop session.
export XDG_SESSION_DESKTOP='dwm'
export XDG_CURRENT_DESKTOP='dwm'

a-start & # Autostart background programs with this script on ~/.local/bin.
while :; do # Run dwm on an infinite loop so it can be restarted on dwm quit.
  dwm 2> ~/.config/dwm.log || break && a-kill # Break loop and Autokill all background programs.
done
