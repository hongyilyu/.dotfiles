BASE_DIR="$HOME/.dotfiles"
ZSH_SUBMODULES="zsh/submodules"

rm $HOME/.zshrc
ln -s $BASE_DIR/zshrc $HOME/.zshrc
ln -s $BASE_DIR/config $HOME/.config
ln -s $BASE_DIR/tmux/scripts $HOME/.tmux/scripts
ln -s $BASE_DIR/tmux.conf $HOME/.tmux.conf
ln -s $BASE_DIR/tmux.conf.local $HOME/.tmux.conf.local
