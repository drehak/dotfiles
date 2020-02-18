#!/bin/sh
# install: copies file at $1 to $2
# install_if_exists: copies file at $2 to $3 if the command at $1 exists
install_if_exists  bash      files/bashrc         ~/.bashrc
install_if_exists  git       files/gitconfig      ~/.gitconfig
install_if_exists  redshift  files/redshift.conf  ~/.redshift.conf
install_if_exists  tmux      files/tmux.conf      ~/.tmux.conf
install_if_exists  vim       files/vimrc          ~/.vimrc
