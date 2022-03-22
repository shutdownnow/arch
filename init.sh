#!/bin/sh
EFI="$1"
ln -sf /bin/vim /bin/vi
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sed "s/#\(Parallel\)/\1/" -i /etc/pacman.conf

hwclock --systohc

sed "s/#\(en_US.UTF-8\)/\1/" -i /etc/locale.gen
sed "s/#\(zh_CN.UTF-8\)/\1/" -i /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "ARCH" > /etc/hostname
cat > /etc/hosts << "EOF"
127.0.0.1	localhost
::1			localhost
127.0.1.1	ARCH.localdomain	ARCH
EOF

tee -a /etc/profile << "EOF"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -A --color=auto"
alias lla="ls -lA --color=auto"
alias s="neofetch"
alias lg="lazygit"
alias pacman="sudo pacman"

ra() {
	if [ -z "$RANGER_LEVEL" ]
	then
		ranger
	else
		exit
	fi
}
EOF

pacman -Sy grub efibootmgr --noconfirm
sed "s/TIMEOUT=5/TIMEOUT=0/" -i /etc/default/grub
sed "s/quiet/quiet nowatchdog/" -i /etc/default/grub
grub-install --target=x86_64-efi --efi-directory="${EFI}" --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd
useradd -mG wheel -s /bin/bash nobume
passwd root << "EOF"
123456
123456
EOF
passwd nobume << "EOF"
123456
123456
EOF
