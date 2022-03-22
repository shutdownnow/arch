#!/bin/sh
sudo pacman -Sy mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau --noconfirm

if ! cat < /etc/mkinitcpio.conf | grep -q "^MODULES.*amdgpu.*"; then
	sudo sed -i "s/^MODULES=(\(.*\))/MODULES=(amdgpu \1)/" /etc/mkinitcpio.conf
fi

sudo tee /etc/modprobe.d/amdgpu.conf << "EOF"
options amdgpu si_support=1
options amdgpu cik_support=1
EOF
sudo mkinitcpio -P

sudo cp config/xorg.conf /etc/X11/xorg.conf
