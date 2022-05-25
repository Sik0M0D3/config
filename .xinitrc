#!/bin/sh

# Define dwm as desktop session.
export XDG_SESSION_DESKTOP='dwm'
export XDG_CURRENT_DESKTOP='dwm'

a-start & # Autostart background programs with this script on ~/.local/bin.

# Run dwm on an infinite loop so it can be restarted on dwm quit.
while :; do
  # Allow to break off the loop and logout when you kill dwm's process.
  ssh-agent dwm || break && a-kill # Autokill, the same as Autostart but to kill all programs on logout.
done
