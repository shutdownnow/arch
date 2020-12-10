#!/bin/bash

# 执行脚本前需先手动操作:

# 1、连上网络
# 2、手动建立硬盘分区，并挂载在 /mnt 目录下

# 调整包路径
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
curl -fLo /etc/pacman.d/mirrorlist \
    https://github.com/17696710501/archlinux-project/tree/main/base-config/mirrorlist

# 更新系统时间
timedatectl set-ntp true

# 安装软件包
pacstrap /mnt base linux linux-firmware \
    base-devel  neovim man-db man-pages \
    zsh zsh-syntax-highlighting dhcpcd

# 配置 Fstab
genfstab -U /mnt >> /mnt/etc/fstab

# 进入新安装的系统
arch-chroot /mnt

# 时间设置
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# 本地化 生成 locale 信息
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

exit 0
