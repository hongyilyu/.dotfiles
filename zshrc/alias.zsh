alias vimupdate="nvim +PlugUpgrade +qall && echo 'vim upgrade' &&
				nvim +PlugUpdate +qall && echo 'vim update' &&
				nvim +PlugClean +qall && echo 'vim cleanup' &&
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
