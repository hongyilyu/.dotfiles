#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
mv $HOME/.dotfiles/oh-my-zsh/custom/ /tmp/
rm -rf $HOME/.dotfiles/oh-my-zsh
cd $HOME/.dotfiles
YES | ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.dotfiles/oh-my-zsh/custom
mv /tmp/custom $HOME/.dotfiles/oh-my-zsh/custom
git submodule update --init --recursive
cd $HOME/.dotfiles/oh-my-zsh/custom
git checkout -- *

