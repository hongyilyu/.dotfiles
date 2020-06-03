alias vimupdate="nvim +PlugUpgrade +PlugUpdate +PlugClean +qall &&
					upgrade_oh_my_zsh"

## get rid of command not found ##
alias cd..='cd ..'

## exa
alias exa='exa -hHlm --color-scale'

## git
alias g="git"
alias gs='git status --ignore-submodules=dirty'
alias gd='git diff'

## todo.sh
export TODOTXT_DEFAULT_ACTION=ls
alias todo='todo.sh -d ~/.todo.cfg'

## use neovim
alias vim='nvim'

alias :q='exit'

## react
alias create-tsx='yarn create react-app --template typescript'
