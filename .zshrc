eval "$(starship init zsh)"

# Path to your oh-my-zsh installation.
export BASE_DIR=${HOME}/.dotfiles
export ZSH=${BASE_DIR}/oh-my-zsh
export ZSH_CONFIG=${BASE_DIR}/zshrc

# Use the force to load my functions
fpath=($ZSH_CONFIG/functions $fpath)
# autoload custom functions
autoload $^fpath/*(N:t)



source $ZSH_CONFIG/plugin.zsh
source $ZSH_CONFIG/fzf.zsh
source $ZSH_CONFIG/OS.zsh
source $ZSH_CONFIG/alias.zsh


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

export LANG="en_US.UTF-8"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.cargo/bin"
# aws
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
