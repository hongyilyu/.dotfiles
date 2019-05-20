alias vimupdate="vim +PlugUpgrade +qall && echo 'vim upgrade' &&
                  vim +PlugUpdate +qall && echo 'vim update' && 
                  vim +PlugClean +qall && echo 'vim cleanup'"

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## git
alias g="git"
alias gs='git status'
alias gd='git diff'

## todo.sh
export TODOTXT_DEFAULT_ACTION=ls
alias todo='todo.sh -d ~/.todo.cfg'
