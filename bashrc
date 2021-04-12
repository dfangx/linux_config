# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

export GPG_TTY=$(tty)
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then 
    return # Shell is non-interactive.  Be done now!
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/bin/fzf-git ] && . ~/bin/fzf-git
# [ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash

[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -f /usr/share/bash-completion/completions/fzf ] && . /usr/share/bash-completion/completions/fzf
[ -f $HOME/dev/src/fzf-tab-completion/bash/fzf-bash-completion.sh ] && . $HOME/dev/src/fzf-tab-completion/bash/fzf-bash-completion.sh
# . wrap_alias
#[ -z "$TMUX" ] && exec tmux -2 -f "$XDG_CONFIG_HOME"/tmux/tmux.conf

# Shell Prompt
curDate="[\d]"
machInfo="\u@\h"
end=" \w\$ "
PS1="\[\e[1;34m\]$curDate \[\e[1;34m\]$machInfo\[\e[1;32m\] [\$(task +in +PENDING count)]$end\[\e[0m\]"
unset curDate
unset machInfo
unset end

stty -ixon
set -o vi
shopt -s autocd

bind -m vi-command '"\er": redraw-current-line'
bind -m vi-command '"\C-g\C-f": "$(_gf)\er\n"'
bind -m vi-command '"\C-g\C-b": "$(_gb)\er\n"'
bind -m vi-command '"\C-g\C-t": "$(_gt)\er\n"'
bind -m vi-command '"\C-g\C-h": "$(_gh)\er\n"'
bind -m vi-command '"\C-g\C-r": "$(_gr)\er\n"'
bind -m vi-command '"\C-g\C-s": "$(_gs)\er\n"'
bind -m vi-insert '"\er": redraw-current-line'
bind -m vi-insert '"\C-g\C-f": "$(_gf)\er\n"'
bind -m vi-insert '"\C-g\C-b": "$(_gb)\er\n"'
bind -m vi-insert '"\C-g\C-t": "$(_gt)\er\n"'
bind -m vi-insert '"\C-g\C-h": "$(_gh)\er\n"'
bind -m vi-insert '"\C-g\C-r": "$(_gr)\er\n"'
bind -m vi-insert '"\C-g\C-s": "$(_gs)\er\n"'

bind -m vi-insert '"\C-x": "$(pwd)/$(fzf-sh)\er\n"'
bind -x '"\t" : fzf_bash_completion'
# bind -m vi-command '"\C-f": "cd $(fd -t d | fzf --height=50% --preview=\"ls {}\")\n"'
# bind -m vi-command '"\C-e": "fd -t f | fzf --height=50% --preview=\"cat {}\" | xargs -ro $EDITOR\n"'
# bind -m vi-command '"\C-o": "fd -t f | fzf -m --height=50% | xargs -rod \"\n\" xdg-open\n"'
# bind -m vi-insert '"\C-f": "cd $(fd -t d | fzf --height=50% --preview=\"ls {}\")\n"'
# bind -m vi-insert '"\C-e": "fd -t f | fzf --height=50% --preview=\"cat {}\" | xargs -ro $EDITOR\n"'
# bind -m vi-insert '"\C-o": "fd -t f | fzf -m --height=50% | xargs -rod \"\n\" xdg-open\n"'

ls
