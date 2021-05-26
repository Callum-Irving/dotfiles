# xrandr --output HDMI1 --mode 1920x1080  --primary --output eDP1 --mode 1600x900 --right-of HDMI1
# Will set external monitor to primary if connected
xrandr --listmonitors | grep 'HDMI1' &> /dev/null && xrandr --output HDMI1 --mode 1920x1080 --primary --output eDP1 --right-of HDMI1

dunst &>/dev/null &
picom &>/dev/null &
lxsession &>/dev/null &

xwallpaper --stretch /home/callum/Pictures/Wallpapers/Wall21.jpg &
monitor_detect.sh &

xidlehook --not-when-fullscreen --not-when-audio --timer 240 "slock" "" --timer 60 "systemctl suspend" "" &
dwmblocks &


# exec i3
exec dbus-launch dwm
