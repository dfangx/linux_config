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
alias refresh="clear && source ~/.bashrc"
alias edtalias="vim ~/.bash_aliases"
alias \:q="exit"

###########################################
################# DISK ####################
###########################################
alias lfdisk="sudo fdisk -l"

###########################################
################ SYSTEM ###################
###########################################

## Power ##
alias shutdown="sudo poweroff"
alias restart="sudo reboot"

## Packages ##
alias install="package_manager install"
alias remove="package_manager remove"
alias clean="package_manager clean"
alias update="package_manager update"

## Backup ##
alias backup="sudo tar cvpzf $os-backup-$(date +%F).tgz ~/documents ~/pictures"
alias restore="mkdir ~/.recovery && sudo tar -xvpzf $os-backup-$1 -C ~/.recovery --numeric-owner"

## Power ##
alias powreport="sudo powertop --html && surf ./powertop.html"

alias irssi="irssi --home ~/.config/irssi -c chat.freenode.net"
