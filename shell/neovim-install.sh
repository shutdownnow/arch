#!/bin/sh
pacman -Sy
pacman -S neovim --noconfirm

ln -sf /usr/bin/nvim /usr/bin/vi
ln -sf /usr/bin/nvim /usr/bin/vim

if [ -d "~/.config" ];then
    cp -r ./config/nvim ~/.config
else
    mkdir ~/.config&&cp -r ./config/nvim ~/.config
fi
