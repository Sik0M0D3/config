#!/bin/sh
# This file is written to be read by the Dash Shell on User Login.
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"  # Include ~/.local/bin to ENV
[ -f $HOME/.config/.aliases ] && . $HOME/.config/.aliases   # Include aliases

# If no display AND current TTY = 1 AND exec Xorg OR Log into Bash.
[ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] && exec startx || exec bash -l
# Bash Login only occurs when every other condition returns False.
