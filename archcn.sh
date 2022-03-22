#!/bin/sh

if ! cat < /etc/pacman.conf | grep -q "\[archlinuxcn\]"; then
sudo tee -a /etc/pacman.conf << "EOF"
[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
EOF
fi

sudo pacman -Sy archlinuxcn-keyring --noconfirm
