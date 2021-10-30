include config.mk

PREFIX ?= /usr/local

XDG_CONFIG_DIR ?= /etc
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_BIN_HOME ?= $(HOME)/.local/bin
XDG_DATA_HOME ?= $(HOME)/.local/share
XDG_SRC_HOME ?= $(HOME)/.local/src

PROJ_ROOT = $(PWD)
PROJ_BIN = $(PROJ_ROOT)/bin
PROJ_CONFIG = $(PROJ_ROOT)/config
SUB_PATH_PAT = defaultpath
GIT_SSH = git@github.com

all: $(CONFIG) $(BIN) $(OS) $(WM) $(SHELL) $(BROWSER) $(TERM)

gentoo: portage

configdir:
	mkdir -pv $(XDG_CONFIG_HOME)

bash: configdir
	ln -svf $(PROJ_ROOT)/bash_aliases $(HOME)/.bash_aliases
	ln -svf $(PROJ_ROOT)/bash_logout $(HOME)/.bash_logout
	ln -svf $(PROJ_ROOT)/bash_profile $(HOME)/.bash_profile
	ln -svf $(PROJ_ROOT)/bashrc $(HOME)/.bashrc
	ln -svf $(PROJ_CONFIG)/bash $(XDG_CONFIG_HOME)

alacritty: configdir
	ln -svf $(PROJ_CONFIG)/alacritty $(XDG_CONFIG_HOME)

conky: configdir
	ln -svf $(PROJ_CONFIG)/conky $(XDG_CONFIG_HOME)

dunst: configdir
	ln -svf $(PROJ_CONFIG)/dunst $(XDG_CONFIG_HOME)
	
firefox: configdir
	ln -svf $(PROJ_CONFIG)/firefox/user.js $(HOME)/.mozilla/firefox/*.default*/
	ln -svf $(PROJ_CONFIG)/firefox/chrome $(HOME)/.mozilla/firefox/*.default*/
	ln -svf $(PROJ_CONFIG)/firefox/updater.sh $(HOME)/.mozilla/firefox/*.default*/
	ln -svf $(PROJ_CONFIG)/tridactyl $(XDG_CONFIG_HOME)

zathura: configdir
	ln -svf $(PROJ_CONFIG)/zathura $(XDG_CONFIG_HOME)

git: configdir
	ln -svf $(PROJ_CONFIG)/git $(XDG_CONFIG_HOME)

neomutt: configdir
	ln -svf $(PROJ_CONFIG)/neomutt $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/mbsync $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/notmuch $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/msmtp $(XDG_CONFIG_HOME)
	
nvim: configdir
	ln -svf $(PROJ_CONFIG)/nvim $(XDG_CONFIG_HOME)

i3: configdir
	ln -svf $(PROJ_CONFIG)/i3 $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/i3blocks $(XDG_CONFIG_HOME)

udevmon: configdir
	ln -svf $(PROJ_CONFIG)/udevmon $(XDG_CONFIG_HOME)

tmux: configdir
	ln -svf $(PROJ_CONFIG)/tmux $(XDG_CONFIG_HOME)

picom: configdir
	ln -svf $(PROJ_CONFIG)/picom $(XDG_CONFIG_HOME)

core: configdir
	ln -svf $(PROJ_CONFIG)/coreutils $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/user-dirs.dirs $(XDG_CONFIG_HOME)
	ln -svf $(PROJ_CONFIG)/user-dirs.locale $(XDG_CONFIG_HOME)

mpv: configdir
	ln -svf $(PROJ_CONFIG)/mpv $(XDG_CONFIG_HOME)

task: configdir
	ln -svf $(PROJ_CONFIG)/task $(XDG_CONFIG_HOME)

x11:  configdir
	mkdir -p $(XDG_CONFIG_HOME)/X11
	ln -svf $(PROJ_CONFIG)/X11/xinit $(XDG_CONFIG_HOME)/X11
	sudo cp -v $(PROJ_CONFIG)/X11/xorg.conf.d/20-modesetting.conf $(XDG_CONFIG_DIR)/X11/xorg.conf.d/
	sudo cp -v $(PROJ_CONFIG)/X11/xorg.conf.d/40-libinput.conf $(XDG_CONFIG_DIR)/X11/xorg.conf.d/

sxhkd: configdir
	ln -svf $(PROJ_CONFIG)/sxhkd $(XDG_CONFIG_HOME)

acpi: 
	sudo cp -rvf $(XDG_BIN_HOME)/acpi $(XDG_CONFIG_DIR)/acpi

iwd:
	sudo cp -v $(PROJ_CONFIG)/iwd/main.conf $(XDG_CONFIG_DIR)/iwd

portage:
	sudo cp -v $(PROJ_CONFIG)/portage/* $(XDG_CONFIG_DIR)/portage

grub:
	sudo cp -v $(PROJ_CONFIG)/grub/* $(XDG_CONFIG_DIR)/grub.d/

elogind:
	sudo cp -v $(PROJ_BIN)/elogind/sleep/* /lib64/elogind/system-sleep/

srcdir:
	mkdir -pv $(XDG_SRC_HOME)

suckless: dwm st

dwm: srcdir bar sxhkd
	if [ ! -d $(XDG_SRC_HOME)/dwm ]; then git clone $(GIT_SSH):$(DWM) $(XDG_SRC_HOME)/dwm; fi
	cd $(XDG_SRC_HOME)/dwm && git pull origin master
	sudo $(MAKE) -C $(XDG_SRC_HOME)/dwm install

st: srcdir
	if [ ! -d $(XDG_SRC_HOME)/st ]; then git clone $(GIT_SSH):$(ST) $(XDG_SRC_HOME)/st; fi
	cd $(XDG_SRC_HOME)/st && git pull origin master
	sudo $(MAKE) -C $(XDG_SRC_HOME)/st install

bindir: 
	mkdir -pv $(XDG_BIN_HOME)

fzf: bindir
	ln -svf $(PROJ_BIN)/fzf/* $(XDG_BIN_HOME)

ffpwa: bindir
	if [ ! -d $(XDG_SRC_HOME)/FirefoxPWA ]; then git clone $(GIT_SSH):$(FFPWA) $(XDG_SRC_HOME)/FirefoxPWA; fi
	cd $(XDG_SRC_HOME)/FirefoxPWA && git pull origin main
	cp -v $(PROJ_CONFIG)/ffpwa/Makefile $(XDG_SRC_HOME)/FirefoxPWA/native
	sudo $(MAKE) -C $(XDG_SRC_HOME)/FirefoxPWA/native VERSION=$(FFPWA_VERSION)
	ln -svf $(PROJ_BIN)/ffpwa/* $(XDG_BIN_HOME)/

games: bindir
	ln -svf $(PROJ_BIN)/games/* $(XDG_BIN_HOME)/

utils: bindir
	for FILE in $(PROJ_BIN)/utils/*; do if [ -f $$FILE ]; then ln -svf $$FILE $(XDG_BIN_HOME); fi done
	sed 's#oldconfig=\"$(SUB_PATH_PAT)\"#oldconfig=\"$(PROJ_CONFIG)/kernel/kernel-config-$$(uname -r)\"#' $(PROJ_BIN)/utils/root/bkern > $(PROJ_BIN)/utils/root/bkern.new
	sudo mv -v $(PROJ_BIN)/utils/root/bkern.new $(PREFIX)/bin/bkern
	sed 's#dir=\"$(SUB_PATH_PAT)\"#dir=\"$(XDG_SRC_HOME)/FirefoxPWA\"#' $(PROJ_BIN)/utils/root/recomp > $(PROJ_BIN)/utils/root/recomp.new
	sudo mv -v $(PROJ_BIN)/utils/root/recomp.new $(PREFIX)/bin/recomp
	sudo cp -v $(PROJ_BIN)/utils/root/pkgmgr $(PREFIX)/bin/pkgmgr

notes: bindir
	ln -svf $(PROJ_BIN)/notes/* $(XDG_BIN_HOME)

bar: bindir
	sed 's#status_dir=\"$(SUB_PATH_PAT)\"#status_dir=\"$(PROJ_BIN)/status_bar/scripts\"#' $(PROJ_BIN)/status_bar/bar > $(PROJ_BIN)/status_bar/bar.new
	chmod +x $(PROJ_BIN)/status_bar/bar.new
	mv $(PROJ_BIN)/status_bar/bar.new $(XDG_BIN_HOME)/bar

.PHONY: install bash config confidr alacritty conky dunst firefox zathura git grub neomutt nvim i3 udevmon tmux picom userdirs coreutils mpv task iwd portage x11 sxhkd srcdir suckless dwm st bin bindir fzf ffpwa games utils notes bar acpi elogind
