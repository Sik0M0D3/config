#
# ~/.zshrc
#

[[ $- != *i* ]] && return

#---------------------------------> LAZY F*CK!NG ALIASES <--------------------------------#

S='sudo'

# Basic Sh!t
alias XX='exit'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ll='exa -lag'

# Vim, Neovim's, Stuff & More Lazyness YES!!!
alias nv="$S nvim"
alias nvz='nv ~/.zshrc'
alias nvxi='nv ~/.xinitrc'
alias nvpi='nv ~/.config/picom.conf'
alias nvdw='cd ~/.dwm && nv config.h && cd -'
alias nvco='nv ~/.config/alacritty/colors.yml'
alias nval='nv ~/.config/alacritty/alacritty.yml'
alias tmatrix='tmatrix --fade --fall-speed=1.0,2.0'
alias nvdws='cd ~/.dwm && nv config.h && suckinstall && cd -'
alias nvsls='cd ~/.config/slstatus/ && nv config.h && suckinstall && cd -'
alias bakwm="
$S cp config.def.h -R config.def.h.bak && 
$S cp config.h -R config.h.bak && 
$S cp config.mk -R config.mk.bak && 
$S cp drw.c -R drw.c.bak && 
$S cp drw.h -R drw.h.bak && 
$S cp dwm.c -R dwm.c.bak"

alias unbakwm="
$S cp config.def.h.bak -R config.def.h && 
$S cp config.h.bak -R config.h && 
$S cp config.mk.bak -R config.mk && 
$S cp drw.c.bak -R drw.c && 
$S cp drw.h.bak -R drw.h && 
$S cp dwm.c.bak -R dwm.c"

# Sys Admin Stuff
alias pac="$S pacman"
alias iftop="$S iftop"
alias chown="$S chown"
alias chmod="$S chmod"
alias btrfs="$S btrfs"
alias virsh="$S virsh"
alias mount="$S mount"
alias umount="$S umount"
alias shutdown="shutdown now"
alias tish="$S timeshift-gtk && upgrub"
alias edgrub='nv /etc/default/grub && upgrub'
alias upgrub="$S grub-mkconfig -o /boot/grub/grub.cfg"

# Others
alias gitCheckO='git checkout'
alias suckinstall='sudo make clean install'
alias GitCheckUp="cd ~/.dwm && echo 'dwm ↓' && gitcheckO && cd ~/.config/slstatus && echo 'slstatus ↓' && gitcheckO && cd ~/.config/dmenu && echo 'dmenu ↓' && gitcheckO && cd ~/.config/st && echo 'st ↓' && gitcheckO && cd -"


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

#Display colorful command
