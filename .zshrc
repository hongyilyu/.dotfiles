# Path to your oh-my-zsh installation.
export ZSH=${HOME}"/.dotfiles/oh-my-zsh"
export ZSH_CONFIG=~/.dotfiles/zshrc
export VIM_CONFIG=~/.dotfiles/vimrc
export ZSH_CUSTOM=~/.dotfiles/oh-my-zsh/custom

ZSH_THEME=powerlevel10k/powerlevel10k
source $ZSH_CONFIG/p10k/p10k.zsh




# Use the force to load my functions
fpath=($ZSH_CONFIG/functions $fpath)
# autoload custom functions
autoload $^fpath/*(N:t)



source $ZSH_CONFIG/plugin.zsh
source $ZSH_CONFIG/fzf.zsh
source $ZSH_CONFIG/OS.zsh
source $ZSH_CONFIG/alias.zsh
source $ZSH_CONFIG/ls.zsh


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.cargo/bin"
export LANG="en_US.UTF-8"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
GITSTATUS_LOG_LEVEL=DEBUG

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zshrc/p10k/p10k.zsh.
[[ ! -f ~/.dotfiles/zshrc/p10k/p10k.zsh ]] || source ~/.dotfiles/zshrc/p10k/p10k.zsh
