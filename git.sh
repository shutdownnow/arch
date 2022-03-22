#!/bin/sh
sudo pacman -Sy git --noconfirm

tee ~/.gitconfig << "EOF"
[credential]
	helper = store
[user]
	name = shutdownnow
	email = 923551363@qq.com
EOF
