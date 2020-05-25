# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then 
    return # Shell is non-interactive.  Be done now!
fi

[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)
[ -f ~/.cache/wal/colors-tty.sh ] && . ~/.cache/wal/colors-tty.sh
[ -f ~/.cache/wal/colors.sh ] && . ~/.cache/wal/colors.sh
[ -z "$TMUX" ] && exec tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Gentoo bash completion
#. /etc/bash/bashrc.d/bash_completion.sh
# Arch bash completion
. /usr/share/bash-completion/bash_completion

#eval "$(dircolors -b $XDG_CONFIG_HOME/dircolors)"

os="$(cat /etc/os-release | grep "^ID" | cut -d "=" -f2)"
[ -f "/usr/lib/os-release" ] && os="$(cat /usr/lib/os-release | grep "^ID" | cut -d "=" -f2)"

case "$os" in
    "arch" | "artix")
        PATH="$PATH:$HOME/bin/arch"
        ;;
    *)
        ;;
esac
unset os

# Shell Prompt
curDate="[\d]"
machInfo="\u@\h"
end=" \w\$ "
#PS1="\[\e[38;2;133;79;219;1m\]$curDate \[\e[38;2;189;147;249;1m\]$machInfo\[\e[38;2;148;125;179;1m\]$end\[\e[0m\]"
PS1="\[\e[1;36m\]$curDate \[\e[1;34m\]$machInfo\[\e[1;33m\]$end"

unset curDate
unset machInfo
unset end

stty -ixon
set -o vi
