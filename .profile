#!/bin/sh

# if ~/.local/bin exists then add directory to the PATH var
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.config/.aliases" ] && . $HOME/.config/.aliases

# if           And    if                Then              Or
# No display          current TTY = 1        start  Xorg      Login to Bash
[ ! $DISPLAY ]  &&  [ $XDG_VTNR -eq 1 ]  &&  exec startx  ||  exec bash -l
# Bash Login only occurs when everything else is False
