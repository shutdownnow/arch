#!/bin/sh

cp ./config/mirrorlist /etc/pacman.d/mirrorlist
echo "ParallelDownloads = 5" >> /etc/pacman.conf
timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware dhcpcd iwd neovim sudo bash-completion
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash -c "pacman -Sy;ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;hwclock --systohc;echo -e ;en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8' >> /etc/locale.gen;locale-gen;echo 'LANG=en_US.UTF-8' >> /etc/locale.conf;echo 'Arch' >> /etc/hostname;echo -e '127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\tArch.localdomain\tArch' >> /etc/hosts;pacman -S grub efibootmgr --noconfirm;"

exit 0
