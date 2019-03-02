# My Linux Configuration Files
## Description
This is a central repository for all my Linux configuration files. The
configuration files for the following packages can be found here:
* Bash
* X
* Portage (Gentoo package manager)
* Tmux
* Vim
* Linux Kernel
* Suckless tools
    * dwm
    * st
    * surf
## Installation
1. Clone the repository. For **HTTPS**, use `git clone
   https://www.github.com/dfangx/linux_config.git`. For **SSH** (recommended), use
   `git clone git@github.com:dfangx/linux_config.git`.
2. Initialize the Suckless Tools submodules by using `git submodule init`
   followed by `git submodule update`
3. Run the `install` script with `./install`. This will symlink all the
   directories in the repository to your $HOME. You may choose to modify this if
   you wish.
## Helper Scripts
    install
This symlinks all directories in the repository to your $HOME, which is where
your user specific configuration files are supposed to reside.  
    git-suckless
Submodules can be a pain to manage in git. This script is my attempt to automate
the process by adding and committing submodule changes as necessary and then
doing a final push to the main repository.
