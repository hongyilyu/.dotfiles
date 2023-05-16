BASE_DIR="$HOME/.dotfiles"
ZSH_SUBMODULES="zsh/submodules"

rm $HOME/.zshrc
ln -s $BASE_DIR/zshrc $HOME/.zshrc
ln -s $BASE_DIR/config $HOME/.config
