# /etc/skel/.bash_profile

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/tmp/$(id -u)"
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export BROWSER="surf"
export PROMPT_DIRTRIM=3

if [ ! -d "$XDG_RUNTIME_DIR" ]
then
    mkdir -p "$XDG_RUNTIME_DIR"
fi

if [ -z "$SSH_AUTH_SOCK" ]
then
    eval "$(ssh-agent -s)"
    ssh-add
fi

if [[ "$(tty)" == '/dev/tty1' ]]
then
    startx "$XDG_CONFIG_HOME/X11/xinitrc" --vt1
    logout
else
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
    if [ -f "$HOME/.bashrc" ]  
    then
        . "$HOME/.bashrc"
    fi
fi
