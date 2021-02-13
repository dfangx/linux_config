#!/bin/bash

###########################################
############# BASH COMMANDS ###############
###########################################
alias ls="ls --color=auto"
alias la="ls -a"
alias lal="ls -alh"
alias ll="ls -lh"
alias rm="rm -I"
alias mv="mv -v"
alias rmdir="rmdir -v"
alias mkdir="mkdir -pv"

alias diff="diff --color=auto"
alias grep="grep --color=auto"

###########################################
################ SHELL ####################
###########################################
alias vim="nvim"
alias nv="nvim"
alias ba="$EDITOR ~/.bash_aliases && . ~/.bashrc"
alias vrc="$EDITOR ~/.config/vim/vimrc"
alias nvrc="$EDITOR ~/.config/nvim/init.vim"
alias brc="$EDITOR ~/.bashrc && . ~/.bashrc"
alias bpr="$EDITOR ~/.bash_profile"
alias \:q="exit"

alias gst="git status"
alias gcmt="git commit"
alias gpsh="git push"
alias gpl="git pull"
alias gmerge="git merge"
alias gco="git checkout"
alias ga="git add"
alias gdf="git diff"
alias gbr="git branch"
alias gapp="git apply"
alias glog="git log"
alias gclone="git clone"

alias fgl="fzf-git log"
alias fgco="fzf-git co"
alias fga="fzf-git add"

###########################################
################# DISK ####################
###########################################
alias lsdisk="sudo fdisk -l"

###########################################
################ SYSTEM ###################
###########################################

## Power ##
alias po="sudo poweroff"
alias rb="sudo reboot"
alias powreport="sudo powertop --html && firefox ./powertop.html"

## Packages ##
# Arch
#alias clean="sudo pacman -Rns $(pacman -Qtdq)"
alias pi="package_manager install"
alias c="package_manager clean"
alias pr="package_manager remove"
alias u="package_manager update" 
# Gentoo
#alias update="sudo emerge -quaDU --keep-going --with-bdeps=y @world"
#alias remove="sudo emerge -Cav"
#alias clean="sudo emerge -ca"
#alias install="sudo emerge -a"

## Backup ##
#alias backup="sudo tar --exclude=/home/cyrusng/documents/{kvm,backup} -cvpzf $(grep "^ID" /usr/lib/os-release | cut -f2 -d "=")-backup-$(date +%F).tgz ~/documents ~/pictures"
alias restore="mkdir ~/.recovery && sudo tar -xvpzf $os-backup-$1 -C ~/.recovery --numeric-owner"

alias def="define"

function cd () {
    builtin cd "$@" && ls
}

function cu() {
    i=0
    [ -z $1 ] && cd ../

    if [ ! -z $1 ]; then
        while [ $i -lt $1 ]
        do
            cd ../
            i=$(($i+1))
        done
    fi
}

alias vs="fd -t f . ~/bin/ | fzf  -m --preview='cat {}' | xargs -roI % $EDITOR %"
alias vc="fd -Lt f . ~/.config/  | fzf  -m --preview='cat {}' | xargs -roI % $EDITOR %"
alias scrcpy="scrcpy -m 1024 --window-borderless --window-x 1604 --window-y 23 --window-width 308 --window-height 659"
alias df="df -h"
alias mnt="mount"
alias mnt-ntfs="sudo ntfs-3g -o uid=1000,guid=1000"

alias mbsync="mbsync -c ~/.config/mbsync/mbsyncrc"
alias irssi="irssi --config ~/.config/irssi/config"
alias weechat="weechat --dir ~/.local/share/weechat"

alias runescape="runelite"
alias rs="runelite"

#. "$HOME/bin/taskwarrior"
alias t="task"
alias ta="task add"
alias tin="task add +in"
alias tick="tickle"
alias in="task in"
function tickle() {
    wait_time="$1"
    shift
    tin +tickle wait:"$wait_time" "$@"
}
function pro() {
    task pro:"$*"
}

alias rem="rem -g"
