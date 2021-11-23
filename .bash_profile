#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.cargo/env"

export PATH="/home/callum/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/home/callum/.local/bin:$PATH"

bind '"\C-f":"project-opener\n"'

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
