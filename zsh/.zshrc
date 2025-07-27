#!/bin/zsh

export HOMEBREW_NO_ANALYTICS=1
export PATH="$HOME/.local/bin":$PATH
export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'

# history
HISTFILE=~/.zsh_history

# source
[[ -f $ZDOTDIR/aliases.zsh ]] && source $ZDOTDIR/aliases.zsh
[[ -f $ZDOTDIR/git.zsh ]] && source $ZDOTDIR/git.zsh
[[ -f $ZDOTDIR/lima.zsh ]] && source $ZDOTDIR/lima.zsh
[[ -f $ZDOTDIR/tailscale.zsh ]] && source $ZDOTDIR/tailscale.zsh

[[ -f $ZDOTDIR/modules/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZDOTDIR/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZDOTDIR/modules/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source $ZDOTDIR/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -f $ZDOTDIR/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZDOTDIR/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f $ZDOTDIR/modules/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source $ZDOTDIR/modules/zsh-autocomplete/zsh-autocomplete.plugin.zsh
[[ -f $ZDOTDIR/modules/nix-zsh-completions/nix-zsh-completions.plugin.zsh ]] && source $ZDOTDIR/modules/nix-zsh-completions/nix-zsh-completions.plugin.zsh

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi


# Key binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

export DIRENV_LOG_FORMAT="$(printf "\033[2mdirenv: %%s\033[0m")"
eval "$(direnv hook zsh)"
_direnv_hook() {
  eval "$(direnv export zsh 2> >(egrep -v -e '^....direnv: export' >&2))"
};

eval "$(/usr/local/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# Lima
export LIMA_INSTANCE=podman

autoload -U compinit; compinit

source <(limactl completion zsh)
