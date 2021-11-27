lxsession &
# Cursor pointer instead of X
xsetroot -cursor_name left_ptr
dunst &
picom &

# Systray
nm-applet &
# Not working for some reason
shutter --min_at_startup &
trayer --edge top --align center --SetPartialStrut true --expand true --width 10 --height 19 --transparent true --alpha 0 --SetDockType true --tint 0x000000 &

# Set background
feh --bg-fill ~/Pictures/landscape_mountains_art.jpg &
# Auto sleep and lock
xidlehook --not-when-fullscreen --not-when-audio --timer 240 'slock' '' --timer 60 'systemctl suspend' '' &

exec xmonad
