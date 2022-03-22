#!/bin/sh
SURF="$1"

if [ ! -d "$SURF" ]; then
	echo "surf path is not exists!"
	exit 1
fi

sudo pacman -Sy gcr webkit2gtk gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly --noconfirm

cd "$SURF" || exit
sudo make install clean
cd - || exit
