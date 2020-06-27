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
Directory descriptions is as follows:
* acpi
    * Contains scripts that are used to control basic power control functions
      provided by the acpid package.
* arch
    * Contains scripts that are specific to arch linux. These include scripts
      for the AUR, as well as the packages that I have used for easy
      reinstallation of Arch.
* cron
    * Scripts that are run by cron
* gentoo
    * Scripts that I use to automate a Gentoo installation
* init
    * contains init scripts for:
        * OpenRc
        * Runit
        * X
* minecraft
    * Runs minecraft from TLauncher
* notmuch
    * Hooks for notmuch
* status_bar
    * Scripts used to set dwm status bar
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

See 
* dwm
* st
* surf
