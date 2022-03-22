#!/bin/sh
DWM="$1"
DMENU="$2"
ST="$3"

if [ ! -d "$DWM" ]; then
	echo "dwm path is not exists!"
	exit 1
fi

if [ ! -d "$DMENU" ]; then
	echo "dmenu path is not exists!"
	exit 1
fi

if [ ! -d "$ST" ]; then
	echo "st path is not exists!"
	exit 1
fi

sudo pacman -Sy xorg-server xorg-xsetroot xorg-xinit flameshot xcompmgr feh --noconfirm
sudo cp config/dbar /bin/dbar

build() {
	DIR="$1"
	
	cd "$DIR" || exit
	sudo make install clean
	cd - || exit
}

build "$DWM"
build "$DMENU"
build "$ST"

tee ~/.xinitrc << "EOF"
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

export FZF_DEFAULT_COMMAND='find . -name "*" -type f'

exec dwm
EOF

tee -a ~/.bash_profile << "EOF"
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#	exec startx
#fi
EOF
