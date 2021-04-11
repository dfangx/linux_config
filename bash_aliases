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
alias df="df -h"

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
alias gcm="git commit"
alias gpsh="git push"
alias gpl="git pull"
alias gmg="git merge"
alias gco="git checkout"
alias ga="git add"
alias gdf="git diff"
alias gbr="git branch"
alias gapp="git apply"
alias glog="git log"
alias gcl="git clone"

alias fgl="fzf-git log"
alias fgco="fzf-git co"
alias fga="fzf-git add"
alias fgd="fzf-git diff"

alias lsdisk="sudo fdisk -l"

# power
alias po="sudo poweroff"
alias rb="sudo reboot"
alias powreport="sudo powertop --html && firefox ./powertop.html"

# packages
alias pi="package_manager install"
alias c="package_manager clean"
alias pr="package_manager remove"
alias u="package_manager update" 

## Backup ##
alias restore="backup r"
alias backup="backup b"


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

# alias scrcpy="scrcpy -m 1024 --window-borderless --window-x 1604 --window-y 23 --window-width 308 --window-height 659"
# alias mnt="mount"
alias mnt-ntfs="sudo ntfs-3g -o uid=1000,guid=1000"


alias runescape="runelite"
alias rs="runelite"
alias def="define"

# taskwarrior
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

# fzf aliases
. ~/bin/bookmark
alias bo="browser_bm_open"
alias bm="xclip -sel clipboard -o | buku -w -a"
alias be="browser_bm_edit"
alias m="shell_bm_add"
alias cdb="shell_bm_enter"
alias be="shell_bm_edit"
alias rmb="shell_bm_remove"
alias ytfzf="ytfzf -t"
alias yt="ytfzf -t"

alias vs="fd -t f . ~/bin/ | fzf  -m --preview='cat {}' | xargs -roI % $EDITOR %"
alias vc="fd -Lt f . ~/.config/  | fzf  -m --preview='cat {}' | xargs -roI % $EDITOR %"

# xdg-dirs aliases
alias x2goclient="x2goclient --home=$HOME/.config"
alias mbsync="mbsync -c ~/.config/mbsync/mbsyncrc"
alias irssi="irssi --config ~/.config/irssi/config"
alias weechat="weechat --dir ~/.local/share/weechat"
