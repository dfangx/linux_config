#!/bin/bash
[ -f /etc/profile.env ] && . /etc/profile.env
[ -f $HOME/.config/bash/profile.env ] && . $HOME/.config/bash/profile.env

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" && ssh-add
#[ "$(tty)" = "/dev/tty1" ] && (startx "$XINITRC"; logout) || [ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"

if [[ "$(tty)" == '/dev/tty1' ]]
then
    startx "$XINITRC"
    # dbus-run-session sway
    logout
else
   # This file is sourced by bash for login shells.  The following line
   # runs your .bashrc and is recommended by the bash info pages.
   [ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"
fi
