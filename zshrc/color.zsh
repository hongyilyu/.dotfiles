#!/bin/zsh
# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
alias ls='ls -GFh'

export ZSH_DIR_COLOR=$ZSH_CONFIG/dircolors-solarized/dircolors.ansi-universal





export LSCOLORS=gxfxcxdxbxegedabagacad


#//// activate gls colors
if [[ -a $ZSH_DIR_COLOR ]]; then
    if [[ "$TERM" == *256* ]]; then
        which gdircolors > /dev/null && eval "`gdircolors -b $ZSH_DIR_COLOR`"
    else
        # standard colors for non-256-color terms
        which gdircolors > /dev/null && eval "`gdircolors -b`"
    fi
else
    which gdircolors > /dev/null && eval "`gdircolors -b`"
fi
