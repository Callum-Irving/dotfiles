dunst &>/dev/null &
picom &>/dev/null &
lxsession &>/dev/null &
feh --bg-scale /home/callum/Pictures/Wallpapers/Wall21.jpg &
xidlehook --not-when-fullscreen --not-when-audio --timer 120 "slock" "" --timer 180 "systemctl suspend" "" &
dwmblocks &

# xrandr --output HDMI1 --mode 1920x1080  --primary --output eDP1 --mode 1600x900 --right-of HDMI1

exec dwm
