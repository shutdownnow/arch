#!/bin/bash

# 执行脚本前需先手动操作:

# 1、连上网络
# 2、手动建立硬盘分区，并挂载在 /mnt 目录下

# 调整包路径
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
cp ./mirrorlist /etc/pacman.d/mirrorlist

# 更新系统时间
timedatectl set-ntp true

# 安装软件包
pacstrap /mnt base linux linux-firmware \
    base-devel neovim man-db man-pages \
    zsh zsh-syntax-highlighting dhcpcd \
    neofetch grub efibootmgr

# 配置 Fstab
genfstab -U /mnt >> /mnt/etc/fstab

mv /mnt/etc/default/grub /mnt/etc/default/grub_bac
cp ./grub /mnt/etc/default/grub

# 进入新安装的系统
arch-chroot /mnt

# 时间设置
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# 本地化 生成 locale 信息
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Arch" >> /etc/hostname
echo "127.0.0.1\tlocalhost\t::1\tlocalhost\n127.0.1.1\tArch.localdomain\tArch" >> /etc/hosts

# 安装 grub 并生成配置
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

# 请使用 passwd 手动修改 root 密码，并重启

exit 0
