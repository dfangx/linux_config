# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

if [ -n "$SSH_AUTH_SOCKET" ]
then
    eval "$(/usr/bin/ssh-agent -k)"
fi

if [ -d "$XDG_RUNTIME_DIR" ]
then
    rm -r "$XDG_RUNTIME_DIR"
fi

# Clear the screen for security's sake.
clear
