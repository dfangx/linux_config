alias ls="ls --color=auto"
alias la="ls -a"
alias lal="ls -alh"
alias ll="ls -lh"
alias rm="rm -vI"
alias mv="mv -v"
alias rmdir="rmdir -v"
alias mkdir="mkdir -pv"

alias diff="diff --color=auto"
alias grep="grep --color=auto"

# Shell Maintenance
alias refresh="clear && source ~/.bashrc"
alias edtalias="vim ~/.bash_aliases"

# Disk Management
alias lfdisk="sudo fdisk -l"
alias pfdisk="sudo fdisk $1"

# Portage
alias updt-wrld="sudo emerge -uaDU --keep-going --with-bdeps=y @world"

# System Maintenance
alias powreport="sudo powertop --html && surf ./powertop.html"
