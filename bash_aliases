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
alias aliases="vim ~/.bash_aliases && . ~/.bashrc"
alias rc="vim ~/.bashrc && . ~/.bashrc"
alias pr="vim ~/.bash_profile"
alias \:q="exit"

alias gstat="git status"
alias gcommit="git commit"
alias gpush="git push"
alias gpull="git pull"
alias gmerge="git merge"
alias gco="git checkout"
alias gadd="git add"
alias gdiff="git diff"
alias gbr="git branch"
alias gapply="git apply"
alias glog="git log"
alias gclone="git clone"

###########################################
################# DISK ####################
###########################################
alias lsdisk="sudo fdisk -l"

###########################################
################ SYSTEM ###################
###########################################

## Power ##
alias shutdown="sudo poweroff"
alias restart="sudo reboot"
alias powreport="sudo powertop --html && firefox ./powertop.html"

## Packages ##
# Arch
#alias clean="sudo pacman -Rns $(pacman -Qtdq)"
alias pkgin="package_manager install"
alias pkgcl="package_manager clean"
alias pkgrm="package_manager remove"
alias pkgup="package_manager update" 
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
    while [ $i -lt $1 ]
    do
        cd ../
        i=$(($i+1))
    done
}

alias v="vim"
alias scrcpy="scrcpy -m 1024 --window-borderless --window-x 1604 --window-y 23 --window-width 308 --window-height 659"
alias df="df -h"
alias mnt="mount"
alias mnt-ntfs="sudo ntfs-3g -o uid=1000,guid=1000"

alias mbsync="mbsync -c ~/.config/mbsync/mbsyncrc"
alias irssi="irssi --config ~/.config/irssi/config"
alias weechat="weechat --dir ~/.local/share/weechat"
alias scrot="scrot '%Y-%m-%d_\$wx\$h.png' -e 'mv \$f ~/pictures/%Y/screenshots/'"
