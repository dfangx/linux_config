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
    exec tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf
fi

# Put your fun stuff here.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi 

eval "$(dircolors -b $XDG_CONFIG_HOME/dircolors)"

# Shell Prompt
curDate="[\d]"
machInfo="\u@\h"
end=" \w\$ "
PS1="\[\e[1;31m\]$curDate\[\e[0m\] \[\e[1;93m\]$machInfo\[\e[0m\] \[\e[1;36m\]$end\[\e[0m\]"
