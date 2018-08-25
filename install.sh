#!/bin/bash

if [ ! -d ~/.vim/autoload/plug.vim ]; then
  curl -sfLo ~/.vim/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PluginInstall +qall
fi
