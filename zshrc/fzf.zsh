[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=dark
# --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
# --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
# '
# export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
# export FZF_DEFAULT_OPTS=" --color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#9d0006,hl:#928374,fg:#3c3836,header:#928374,info:#427b58,pointer:#9d0006,marker:#9d0006,fg+:#3c3836,prompt:#9d0006,hl+:#9d0006  --layout=reverse  --margin=1,4"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
export FZF_BI_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=bg+:#ebdbb2,bg:#fbf1c7,spinner:#9d0006,hl:#928374,fg:#3c3836,header:#928374,info:#427b58,pointer:#9d0006,marker:#9d0006,fg+:#3c3836,prompt:#9d0006,hl+:#9d0006"
