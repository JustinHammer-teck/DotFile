#!/bin/zsh

alias nvimrc='nvim ~/.config/nvim/'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

alias lla='ls -a'

alias c='clear'

alias ls="eza --all --color=always --long --accessed --git --no-filesize --icons=always --no-time"

alias cd="z"

alias conf="nvim ~/.home"
alias dotf="nvim ~/.config"
alias note="nvim ~/paranote"

alias szsh="source ~/.config/zsh/.zshrc"

alias btm="nix-shell -p bottom --run btm"

alias ts="tailscale"
alias tss="tailscale status"
alias tssh="tailscale ssh"
alias toxucxich="tailscale ssh xucxich@xucxich"

alias rider="open -na "Rider.app" &"
alias pycharm="open -na "Pycharm.app" &"
alias phpstorm="open -na "PhpStorm.app" &"
