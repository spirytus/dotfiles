#!/bin/sh
(mkdir -p ~/.vim/bundle;
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim)
cp .vimrc ~/.vimrc
