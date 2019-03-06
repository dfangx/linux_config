# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

if [ -n "$SSH_AUTH_SOCK" ]
then
    eval $(ssh-agent -k)
fi

if [ -d "$XDG_RUNTIME_DIR" ]
then
    echo "y" | rm -rv "$XDG_RUNTIME_DIR"
fi

# Clear the screen for security's sake.
clear
