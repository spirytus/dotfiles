#!/bin/sh
MISC=misc.zip
wget http://peterodding.com/code/vim/downloads/$MISC
unzip $MISC -d ~/.vim/
rm $MISC

export TERM=xterm-256color
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
