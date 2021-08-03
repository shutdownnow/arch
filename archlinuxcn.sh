#!/bin/bash
sed -i "/# If you want to run 32 bit applications on your x86_64 system,/i\[archlinuxcn\]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n" /etc/pacman.conf
pacman -S archlinuxcn-keyring --noconfirm
