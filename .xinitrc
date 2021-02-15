dunst &>/dev/null &
picom &>/dev/null &
lxsession &>/dev/null &
feh --bg-scale /home/callum/Pictures/Wallpapers/Wall21.jpg &
xidlehook --not-when-fullscreen --not-when-audio --timer 120 "slock" "" --timer 180 "systemctl suspend" "" &
dwmblocks &
exec dwm
