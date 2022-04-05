#!/bin/sh
# This file is written to be read by Dash Shell on User Login

# if ~/.local/bin exists and it's a directory then add it to the PATH environment variable
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f $HOME/.config/.aliases ] && . $HOME/.config/.aliases

# IF no display AND IF current TTY = 1   AND  exec  Xorg  OR  exec Bash Login
[ ! $DISPLAY ]  &&  [  $XDG_VTNR -eq 1 ]  &&  exec startx ||  exec bash -l

# Bash Login only occurs when every other condition returns False
