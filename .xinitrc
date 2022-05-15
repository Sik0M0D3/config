#!/bin/sh

# Autostart background programs with this script.
a-start &

# Run dwm on an infinite loop so it can be restarted on dwm quit.
while :; do
  # allow to break off the loop when you kill dwm's process.
  dwm || $(break && a-kill) # autokill, the same as autostart but to kill all programs on logout.
done
