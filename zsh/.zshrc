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
[[ -f $ZDOTDIR/function.zsh ]] && source $ZDOTDIR/function.zsh

[[ -f $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh ]] && source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f $ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]] && source $ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# keybinds
bindkey '^ ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

eval "$(/usr/local/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
