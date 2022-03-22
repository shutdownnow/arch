#!/bin/sh
sudo pacman -Sy ranger ueberzug --noconfirm

ranger --copy-config=all
RC="$HOME/.config/ranger/rc.conf"

sed -i "s/^set preview_images false/set preview_images true/" "$RC"
sed -i "s/^set preview_images_method w3m/set preview_images_method ueberzug/" "$RC"
sed -i "s/^set update_tmux_title true/set update_tmux_title false/" "$RC"

if ! cat < "$RC" | grep -q "^# Smart \"cw\""; then
	tee -a "$RC" << "EOF"

# Smart "cw"
map cw eval fm.execute_console("bulkrename") if fm.thisdir.marked_items else fm.open_console("rename ")
EOF
fi
