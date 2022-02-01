#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.cargo/env"

export PATH="/home/callum/.local/share/solana/install/active_release/bin:$PATH"
export PATH="/home/callum/.local/bin:$PATH"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="brave"

export BAT_THEME="gruvbox-dark"

# For Netbeans
export _JAVA_AWT_WM_NONREPARENTING=1

export GOPATH="$XDG_DATA_HOME/go"
