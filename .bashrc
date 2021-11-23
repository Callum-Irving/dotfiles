#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="exa -la --group-directories-first"

if [ "`id -u`" -eq 0 ]; then
    PS1="\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
else
    PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
fi


. "$HOME/.cargo/env"

bind '"\C-f":"project-opener\n"'

