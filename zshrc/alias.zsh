alias vimupdate="nvim +PlugUpgrade +PlugUpdate +PlugClean +qall &&
					omz update"

## get rid of command not found ##
alias cd..='cd ..'

## exa
alias exa='exa -hHlm --color-scale'

## git
alias g="git"
alias gs='git status --ignore-submodules=dirty'
alias gd='git diff'

## use neovim
alias vim='nvim'
alias v='nvim'

alias :q='exit'

## react
alias create-tsx='yarn create react-app --template typescript'
