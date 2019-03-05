# /etc/skel/.bash_logout

# This file is sourced when a login shell terminates.

if [ "$TERM" == "linux" ]
then
    if [ -n "$SSH_AUTH_SOCKET" ]
    then
        eval "$(/usr/bin/ssh-agent -k)"
    fi

    if [ -d "$XDG_RUNTIME_DIR" ]
    then
        echo y | rm -r "$XDG_RUNTIME_DIR"
    fi

    cp -v /sys/class/backlight/intel_backlight/brightness ~/brightness
fi

# Clear the screen for security's sake.
clear
