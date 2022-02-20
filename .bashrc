#   ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

S='sudo'
DWM='~/.src/dwm'

# Basic
alias XX='exit'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias cl='clear'
alias ll='exa -lagF --group-directories-first --sort=type --colour-scale --icons'
alias grep='grep --color=auto'

# Neo Shorts
alias nv="$S nvim"
alias nvb='nvim ~/.bashrc'
alias nvx='nvim ~/.xinitrc'
alias s.b='source ~/.bashrc'
alias nvp='nvim ~/.bash_profile'
alias suk='sudo make clean install'
alias nvd='nvim ~/.src/dwm/config.def.h && ctc'
alias ctc="cp $DWM/config.def.h -R $DWM/config.h"
alias nva='nvim ~/.config/alacritty/alacritty.yml'

# SU Shorts & SYS Stuff
alias ufw="$S ufw"
alias gfw="$S gufw"
alias ift="$S iftop"
alias pac="$S pacman"
alias cho="$S chown"
alias chm="$S chmod"
alias virsh="$S virsh"
alias fetch='fastfetch'
alias restr='chmod ugo-rwx' #  <-- run with caution
alias aprop="chown $USER:$USER"
alias edgrub="nv /etc/default/grub && upgrub"
alias upgrub="$S grub-mkconfig -o /boot/grub/grub.cfg"
alias bakwm="
$S cp config.def.h -R config.def.bak -v &&
$S cp config.h -R config.h.bak -v &&
$S cp config.mk -R config.mk.bak -v &&
$S cp drw.c -R drw.c.bak -v &&
$S cp drw.h -R drw.h.bak -v &&
$S cp dwm.c -R dwm.c.bak -v &&
$S cp dwm.1 -R dwm.1.bak -v &&
$S cp movestack.c -R movestack.c.bak -v &&
$S cp transient.c -R transient.c.bak -v &&
$S cp util.c -R util.c.bak -v &&
$S cp util.h -R util.h.bak -v"
alias unbakwm="
$S cp config.def.h.bak -R config.def.h -v &&
$S cp config.h.bak -R config.h -v &&
$S cp config.mk.bak -R config.mk -v &&
$S cp drw.c.bak -R drw.c -v &&
$S cp drw.h.bak -R drw.h -v &&
$S cp dwm.c.bak -R dwm.c -v &&
$S cp dwm.1.bak -R dwm.1 -v &&
$S cp movestack.c.bak -R movestack.c -v &&
$S cp transient.c.bak -R transient.c -v &&
$S cp util.c.bak -R util.c -v &&
$S cp util.h.bak -R util.h -v"

PS1="\u@\h -> \w \$ "

# # Usage: ex <file>
# Stolen from arco linux config files
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   tar xf $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

fetch
##### EOF #####
