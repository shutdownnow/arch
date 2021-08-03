#!/bin/bash
ln -sf /usr/bin/nvim /usr/bin/vi
ln -sf /usr/bin/nvim /usr/bin/vim
# 时间设置
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# 本地化 生成 locale 信息
echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "Arch" >> /etc/hostname
echo -e "127.0.0.1\tlocalhost\n::1\tlocalhost\n127.0.1.1\tArch.localdomain\tArch" >> /etc/hosts

# 安装 grub 并生成配置
pacman -S grub efibootmgr --noconfirm
mv /mnt/etc/default/grub /mnt/etc/default/grub_bac
cp ./config/grub /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd.service

# 请使用 passwd 手动修改 root 密码，并重启

exit 0
