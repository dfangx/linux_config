# My Linux Configuration Files
## Description
This is a central repository for all my Linux configuration files and scripts. 
## Installation
1. Clone the repository. For **HTTPS**, use `git clone
   https://www.github.com/dfangx/linux_config.git`. For **SSH** (recommended), use
   `git clone git@github.com:dfangx/linux_config.git`. Use `git clone
    --recurse-submodules` if you want to include the tools from Suckless. **Note:
    If you decide to not use the aforementioned option, you will not be able to use
    git-suckless properly**
2. Initialize the Suckless Tools submodules by using `git submodule init`
   followed by `git submodule update`
3. Run the `install` script with `./install`. This will symlink all the
   directories in the repository to your $HOME. You may choose to modify this if
   you wish.
## Helper Scripts
### install
This symlinks all directories in the repository to your $HOME, which is where
your user specific configuration files are supposed to reside.  
## Directory Descriptions
### bin
This directory contains my personal scripts that I have use(d) in my setup.
* acpi
    * Contains scripts that are used to control basic power control functions
      provided by the acpid package.
* arch
    * Contains scripts that are specific to arch linux. These include scripts
      for the AUR, as well as the packages that I have used for easy
      reinstallation of Arch.
* common
    * Contains scripts that are used in both my Arch and Gentoo installations
* gentoo_install
    * Scripts that I use to automate a Gentoo installation
* local.d
    * This gets symlinked into the /etc directory. If using OpenRC as your init
      system, the scripts in this folder will be run on startup and shutdown.
* openrc
    * Scripts that are used by OpenRC.
### config
This directory contains the configuration files that I use(d) for the following
packages:
* bash (actually found at the git root directory)
* compton
* conky
* dwm
* i3wm
* i3blocks
* linux kernel
* newsboat
* portage (Gentoo package manager)
* st
* surf
* tmux
* vim
* X
* zathura
### suckless
This directory contains my own forks of the following suckless tools:
* dwm
* st
* surf
