#!/bin/bash
[ -f /etc/profile.env ] && . /etc/profile.env

home_bin="$HOME/bin"

export LANG="en_CA.UTF-8"
export LCN_COLLATE="C"

os="$(cat /etc/os-release | grep "^ID" | cut -d "=" -f2)"
[ -f "/usr/lib/os-release" ] && os="$(cat /usr/lib/os-release | grep "^ID" | cut -d "=" -f2)"
[ ! $os == "gentoo" ] && export EDITOR="/usr/bin/nvim"
#export BROWSER="/usr/local/bin/firefox"
export BROWSER="/opt/firefox/firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

#export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

export FZF_DEFAULT_COMMAND="fd -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export XINITRC="$home_bin/init/xinit/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export DISPLAY=":0"

export PROMPT_DIRTRIM=3

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

#export RUST_SRC_PATH=$(rustc --print target-libdir)/../../src/rust/src
#export RUST_SRC_PATH=/usr/lib64/rust-1.46.0/rustlib/src/rust
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export LESSHISTFILE=-
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export TASKDATA="$XDG_DATA_HOME/task"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export DOTREMINDERS="$HOME/remind/remind.rem"

export TERMINFO="$HOME/.local/share/terminfo"
export MANPATH="/usr/share/man:/usr/local/share/man:$HOME/.local/share/man"

[ -d "$home_bin" ] && PATH="$PATH:$home_bin"
[ -d "$CARGO_HOME/bin" ] && PATH="$CARGO_HOME/bin:$PATH" && export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
[ -d "$home_bin/minecraft" ] && PATH="$PATH:$home_bin/minecraft"
[ -d "$home_bin/runelite" ] && PATH="$PATH:$home_bin/runelite"
[ -d "$home_bin/dart-sass" ] && PATH="$PATH:$home_bin/dart-sass"
[ -d "$home_bin/dotnet" ] && PATH="$PATH:$home_bin/dotnet"

unset home_dir

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" && ssh-add
#[ "$(tty)" = "/dev/tty1" ] && (startx "$XINITRC"; logout) || [ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"

if [[ "$(tty)" == '/dev/tty1' ]]
then
    startx "$XINITRC"
    logout
else
   # This file is sourced by bash for login shells.  The following line
   # runs your .bashrc and is recommended by the bash info pages.
   [ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"
fi
