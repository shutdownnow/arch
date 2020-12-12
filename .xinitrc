export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

export INPUT_METHOD=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export FZF_DEFAULT_COMMAND='find . -name "*" -type f'

xrandr --output eDP-1 --mode 1920x1080
xrandr --output HDMI-1 --same-as eDP-1
xset s off -dpms

fcitx5 &
while true; do
	xsetroot -name "$(date +'%F %H:%M:%S %A')"
	sleep 1
done &

exec dwm
