cp $HOME/.dotfiles/.mackup.cfg $HOME/
echo "YES" | mackup restore
source $HOME/.zshrc
vimupdate
echo "22" | bash -c  "$(wget -qO- https://git.io/vQgMr)"
