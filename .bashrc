#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups
export EDITOR='nvim'
export VISUAL='nvim'
export S='sudo'

#---------------------------------> LAZY F*CK!NG ALIASES <--------------------------------

# Basic Sh!t
alias XX='exit'
alias cp='cp -v'
alias mv='mv -v'
alias ll='exa -lag'

# Vim & Neovim's
alias vi="$S vim"
alias nv="$S nvim"
alias nvba='nv ~/.bashrc'
alias nvxi='nv ~/.xinitrc'
alias nvpi='nv ~/.config/picom.conf'
alias nvco='nv ~/.config/alacritty/colors.yml'
alias nval='nv ~/.config/alacritty/alacritty.yml'
alias nvdw="cd ~/.dwm && nv config.h && suckinstall && cd -"
alias nvst="cd ~/.config/st && nv config.h && suckinstall && cd -"
alias nvsl="cd ~/.config/sls && nv config.h && suckinstall && cd -"

# Sys Admin Stuff
#alias htop="$S htop"
alias iftop="$S iftop"
alias chown="$S chown"
alias chmod="$S chmod"
alias btrfs="$S btrfs"
alias mount="$S mount"
alias umount="$S umount"
#alias reboot="$S reboot"
#alias pacman="$S pacman"
#alias poweroff="$S poweroff"
alias shutdown="shutdown now"
alias mkinitram="$S mkinitcpio -p"
alias tishnd="$S timeshift-gtk && upgrub"
alias edgrub='nv /etc/default/grub && upgrub'
alias upgrub="$S grub-mkconfig -o /boot/grub/grub.cfg"

# Others
alias firefox='librewolf'
alias neofetch='fastfetch'
alias neofetchd='neofetch | lolcat'
alias gitcheckO="git checkout $PWD"
alias suckinstall="$S make clean install"
alias GitCheckUp="cd ~/.dwm && echo $PWD && gitcheckO && cd ~/.config/slstatus && echo $PW    D && gitcheckO && cd ~/.config/dmenu && echo $PWD && gitcheckO && cd ~/.config/st && echo     $PWD && gitcheckO && cd"

# # usage: ex <file>
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

#[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

neofetchd
