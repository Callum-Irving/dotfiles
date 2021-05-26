#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERMINAL="alacritty"
export BROWSER="brave"
export VISUAL="nvim"
export EDITOR="nvim"
export OPENER="xdg-open"

export GOPATH="/home/callum/go"

# For Netbeans/MPLab software that uses Java
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=/home/callum/Scripts:/home/callum/.local/bin:$PATH
export PATH=/home/callum/Scripts/Modules:/home/callum/.local/bin:$PATH
export PATH=/opt/microchip/xc8/v2.32/bin:$PATH
export PATH=/opt/GCBASIC:$PATH

if [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi
export GPG_TTY=$(tty)
