#!/bin/sh
sudo pacman -S archlinuxcn-keyring --noconfirm

sudo cat >> /etc/pacman.conf << "EOF"
[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
EOF
