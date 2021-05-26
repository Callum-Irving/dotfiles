alias ls="exa -al --color=always --group-directories-first"
alias grep="rg"
alias monwallet="monero-wallet-cli --daemon-address node.moneroworld.com:18089 --wallet-file Monero/wallets/callums-wallet/callums-wallet"

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

set fish_greeting

pfetch
