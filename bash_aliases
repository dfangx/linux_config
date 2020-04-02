#!/bin/bash

###########################################
############# BASH COMMANDS ###############
###########################################
alias ls="ls --color=auto"
alias la="ls -a"
alias lal="ls -alh"
alias ll="ls -lh"
alias rm="rm -vI"
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
alias \:q="exit"

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
alias install="sudo pacman -S"
alias clean="sudo pacman -Rns $(pacman -Qtdq)"
alias remove="sudo pacman -Rns"
alias update="sudo pacman -Syu && aurupdate" 
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

alias v="vim"
alias scrcpy="scrcpy -m 1024 --window-borderless --window-x 1604 --window-y 23 --window-width 308 --window-height 659"
