#!/bin/bash
export LANG="en_CA.UTF-8"
export LCN_COLLATE="C"

export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export XINITRC="$HOME/bin/init/xinit/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export DISPLAY=":0"

export PROMPT_DIRTRIM=3

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export LESSHISTFILE=-

[ -d "$HOME/bin/common" ] && PATH="$HOME/bin/common:$PATH"
[ -d "$CARGO_HOME/bin" ] && PATH="$CARGO_HOME/bin:$PATH" && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
[ -d "$HOME/bin/common/minecraft" ] && PATH="$HOME/bin/common/minecraft:$PATH"

#light -I

if [ -z "$SSH_AUTH_SOCK" ]
then
    eval "$(ssh-agent -s)"
    ssh-add
fi

if [[ "$(tty)" == '/dev/tty1' ]]
then
    startx "$XINITRC"
    logout
else
    # This file is sourced by bash for login shells.  The following line
    # runs your .bashrc and is recommended by the bash info pages.
    if [ -f "$HOME/.bashrc" ]  
    then
        . "$HOME/.bashrc"
    fi
fi
