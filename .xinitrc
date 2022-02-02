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
feh --bg-fill ~/Pictures/landscape_mountains_art.jpg --no-feh-bg &
# Auto sleep and lock
xidlehook --detect-sleep --not-when-fullscreen --not-when-audio --timer 240 'slock' '' --timer 60 'systemctl suspend' '' &

# Bind CAPS to CTRL
setxkbmap -option ctrl:nocaps

exec xmonad

# For wacom tablet:
# xsetwacom set 15 Area 0 0 15200 8550
