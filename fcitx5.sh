#!/bin/sh
sudo pacman -Sy fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color fcitx5-pinyin-moegirl --noconfirm

sudo tee /etc/environment << "EOF"
INPUT_METHOD=fcitx5
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS=@im=fcitx5
SDL_IM_MODULE=fcitx5
EOF
