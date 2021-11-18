#!/usr/bin/env zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Fig pre
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh

fpath+=~/.zsh_functions
autoload copy disable_gatekeeper github_clone pretty_log \
time_machine_exclude_deps update switch_eject switch_split

# Use antigen from homebrew
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle z
antigen bundle fzf
antigen bundle yarn
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
# Must be last
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Setup history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Start fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
# End fix slowness of pastes

# Source ~/.profile if it exists
if test -e "$HOME/.profile"; then
    source "$HOME/.profile"
fi

# Source ~/.profile_override if it exists
# .profile_override is not tracked in git
if test -e "$HOME/.profile_override"; then
    source "$HOME/.profile_override"
fi

# Init starship
eval "$(starship init zsh)"

# Init direnv
eval "$(direnv hook zsh)"

# Fig post
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
