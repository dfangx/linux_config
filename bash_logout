# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

if [ -n "$SSH_AUTH_SOCK" ]
then
    eval $(ssh-agent -k)
fi

light -O
# Clear the screen for security's sake.
clear
