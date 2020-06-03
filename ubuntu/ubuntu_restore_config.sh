cp $HOME/.dotfiles/.mackup.cfg $HOME/
mackup restore
source $HOME/.zshrc
vimupdate

gconftool-2 --dump '/apps/gnome-terminal' > /tmp/gnome-terminal-conf.xml
gconftool-2 --load /tmp/gnome-terminal-conf.xml

echo "22" | bash -c  "$(wget -qO- https://git.io/vQgMr)"
