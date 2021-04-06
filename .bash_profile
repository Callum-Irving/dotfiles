#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export TERMINAL="kitty"
export BROWSER="brave"
export EDITOR="vim"

# For Netbeans/MPLab software that uses Java
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=/home/callum/Scripts:/home/callum/.local/bin:$PATH
export PATH=/home/callum/Scripts/Modules:/home/callum/.local/bin:$PATH
export PATH=/opt/microchip/xc8/v2.32/bin:$PATH
export PATH=/opt/GCBASIC:$PATH

if [ "$(tty)" = "/dev/tty1" ]; then
    startx
fi
