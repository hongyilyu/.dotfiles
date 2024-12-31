export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/dev/flutter2/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# aws
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
