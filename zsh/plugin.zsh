################################################## COMPLITION ##################################################
fpath=($ZSH_PLUGIN/zsh-completions/src $fpath)

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'
#############################################################################################################

################################################## VI-MODE ##################################################
# enable vi bindings
bindkey -v
# Better searching in command mode
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward
bindkey '^A' beginning-of-line
bindkey '^B' backward-char
bindkey '^F' forward-char
bindkey "^?" backward-delete-char

# Beginning search with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Fix cursor invisible in visual mode.
_fix_cursor() {
   echo -ne '\e[5 q'
}

# Other shortcuts
# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
        for c in {a,i}{\',\",\`}; do
                bindkey -M $m $c select-quoted
        done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
        for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
                bindkey -M $m $c select-bracketed
        done
done

precmd_functions+=(_fix_cursor)
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
#############################################################################################################

################################################## HIGHLIGHT ##################################################
source $ZSH_PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red
#############################################################################################################

################################################## AUTOSUGGEST ##################################################
source $ZSH_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
bindkey '¼' autosuggest-accept # ctrl + space
#############################################################################################################

################################################## FZF ##################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#00ff2b
--color=info:#af87ff,prompt:#5fff87,pointer:#af5fff,marker:#ff87d7,spinner:#ff87d7
'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
#############################################################################################################

