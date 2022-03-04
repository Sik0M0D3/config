#   ~/.bashrc

# If  no display && actual tty == 1  run startx
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

S='sudo'
D="$HOME/.src/dwm"

# Basic
alias XX='exit'
alias cl='clear'
alias rm='rm -v'
alias wl='wc -l'
alias mv='mv -vi'
alias cp='cp -vi'
alias ll='exa -lagF --group-directories-first --sort=type --colour-scale --icons'
alias grep='grep --color=auto'
#alias sudo='doas'

# Neo Shorts
alias nv="$S nvim"
alias nvx='nv ~/.xinitrc'
alias nvb='nvim ~/.bashrc'
alias nvp='nvim ~/.profile'
alias nvs="nv ~/.config/auto.sh"
alias nvc='nvim ~/.config/alacritty/colors.yml'
alias nva='nvim ~/.config/alacritty/alacritty.yml'
alias nvd="cd $D && nvim ~/.src/dwm/config.def.h && c-c && suk"

# Others
alias neo='fastfetch'
alias suc='c-c && suk'
alias lol='neo | lolcat'
alias res='chmod go-rwx'
alias sct="$S systemctl"
alias s.b='source ~/.bashrc'
alias apr="chown $USER:$USER"
alias suk="$S make clean install"
alias edg="nv /etc/default/grub && upg"
alias c-c="$S cp config.def.h -R config.h -vi"
alias upg="$S grub-mkconfig -o /boot/grub/grub.cfg"
alias steam=' flatpak  run  com.valvesoftware.Steam '
alias bakdwm="
$S  cp  config.def.h      -R  config.def.bak   -v  &&
$S  cp  config.h          -R  config.h.bak     -v  &&
$S  cp  config.mk         -R  config.mk.bak    -v  &&
$S  cp  drw.c             -R  drw.c.bak        -v  &&
$S  cp  drw.h             -R  drw.h.bak        -v  &&
$S  cp  dwm.c             -R  dwm.c.bak        -v  &&
$S  cp  dwm.1             -R  dwm.1.bak        -v  &&
$S  cp  movestack.c       -R  movestack.c.bak  -v  &&
$S  cp  transient.c       -R  transient.c.bak  -v  &&
$S  cp  util.c            -R  util.c.bak       -v  &&
$S  cp  util.h            -R  util.h.bak       -v
"
alias unbakdwm="
$S  cp  config.def.h.bak  -R  config.def.h     -v  &&
$S  cp  config.h.bak      -R  config.h         -v  &&
$S  cp  config.mk.bak     -R  config.mk        -v  &&
$S  cp  drw.c.bak         -R  drw.c            -v  &&
$S  cp  drw.h.bak         -R  drw.h            -v  &&
$S  cp  dwm.c.bak         -R  dwm.c            -v  &&
$S  cp  dwm.1.bak         -R  dwm.1            -v  &&
$S  cp  movestack.c.bak   -R  movestack.c      -v  &&
$S  cp  transient.c.bak   -R  transient.c      -v  &&
$S  cp  util.c.bak        -R  util.c           -v  &&
$S  cp  util.h.bak        -R  util.h           -v
"

# # Usage: ex <file>
# Stolen from arco linux config files
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf    $1  ;;
            *.tar.gz)    tar xzf    $1  ;;
            *.bz2)       bunzip2    $1  ;;
            *.rar)       unrar x    $1  ;;
            *.gz)        gunzip     $1  ;;
            *.tar)       tar xf     $1  ;;
            *.tbz2)      tar xjf    $1  ;;
            *.tgz)       tar xzf    $1  ;;
            *.zip)       unzip      $1  ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x       $1  ;;
            *.deb)       ar x       $1  ;;
            *.tar.xz)    tar xf     $1  ;;
            *.tar.zst)   tar xf     $1  ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#lol
#neo
#neofetch

PS1=" \u @ \h > \w $ "

################### EOF ##################
