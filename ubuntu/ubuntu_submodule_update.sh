#!/bin/bash
cd $HOME/.dotfiles
git submodule update --init --recursive
mv $HOME/.dotfiles/oh-my-zsh/custom/ /tmp/
rm -rf $HOME/.dotfiles/oh-my-zsh
YES | ZSH="$HOME/.dotfiles/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $HOME/.dotfiles/oh-my-zsh/custom
mv /tmp/custom $HOME/.dotfiles/oh-my-zsh/custom
cd $HOME/.dotfiles/oh-my-zsh
git checkout -- *
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
