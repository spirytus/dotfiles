#!/bin/sh
export TERM=xterm-256color
#(mkdir -p ~/.vim/bundle;
#git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim)
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
