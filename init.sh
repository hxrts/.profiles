#!/bin/bash

ln -s ~/.profiles/.bash_profile ~/.bash_profile
ln -s ~/.profiles/.bashrc ~/.bashrc
ln -s ~/.profiles/.profile ~/.profile
ln -s ~/.profiles/.Rprofile ~/.Rprofile
ln -s ~/.profiles/.tmux.conf ~/.tmux.conf
ln -s ~/.profiles/.zshrc ~/.zshrc

mkdir -p ~/.config/nvim
ln -s ~/.profiles/.vimrc ~/.config/init.vim
