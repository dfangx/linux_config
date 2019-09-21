# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -z "$TMUX" ]
then
    exec tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf
fi

# Put your fun stuff here.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi 

# Gentoo path
#. /etc/bash/bashrc.d/bash_completion.sh
. /usr/share/bash-completion/bash_completion

#eval "$(dircolors -b $XDG_CONFIG_HOME/dircolors)"
PATH="$PATH:$HOME/bin/common:$HOME/.cargo/bin"
if [ -f "/usr/lib/os-release" ]
then
    os="$(cat /usr/lib/os-release | grep "^ID" | cut -d "=" -f2)"
else
    os="$(cat /etc/os-release | grep "^ID" | cut -d "=" -f2)"
fi

case "$os" in
    "arch" | "artix")
        PATH="$PATH:$HOME/bin/arch"
        ;;
    *)
        ;;
esac

# Shell Prompt
curDate="[\d]"
machInfo="\u@\h"
end=" \w\$ "

PS1="\[\e[38;2;133;79;219;1m\]$curDate \[\e[38;2;189;147;249;1m\]$machInfo\[\e[38;2;148;125;179;1m\]$end\[\e[0m\]"

unset curDate
unset machInfo
unset end

stty -ixon
