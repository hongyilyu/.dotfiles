#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo add-apt-repository -y ppa:neovim-ppa/unstable
apt-get -y update
apt-get -y upgrade
apt-get -y install vim python3 python3-pip tmux neovim zsh nodejs npm curl autojump
npm install -g neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --system --upgrade mackup
