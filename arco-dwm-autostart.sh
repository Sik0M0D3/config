#!/bin/sh
# This i keep for the program names the exports and the run function.

export XDG_SESSION_DESKTOP='dwm'
export XDG_CURRENT_DESKTOP='dwm'

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

# Run One-Shot applications here
xwallpaper --zoom /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
gammastep -x -m randr && gammastep -O 5000 -m randr &

# Run utility/background applications at dwm start
numlockx on &
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Run user applications at boot time
run xfce4-power-manager &
run volumeicon &
run nm-applet &
run sxhkd &
picom &
