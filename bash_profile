#!/bin/bash
[ -f /etc/profile.env ] && . "/etc/profile.env"
[ -f "defaultpath/bash/profile.env" ] && . "defaultpath/bash/profile.env"

if [[ "$(tty)" == '/dev/tty1' ]]
then
    startx "$XINITRC"
    logout
else
   # This file is sourced by bash for login shells.  The following line
   # runs your .bashrc and is recommended by the bash info pages.
   [ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"
fi
