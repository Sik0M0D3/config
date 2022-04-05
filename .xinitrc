#!/bin/sh

# Run dwm on an infinite loop so it can be restarted
# And allow to break off the loop to exit dwm when you kill dwm's process
while :; do
    dwm || break
done
