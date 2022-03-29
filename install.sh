#!/bin/sh
# install: copies file at $1 to $2
# install_if_exists: copies file at $2 to $3 if the command at $1 exists
install_if_exists  bash         files/bashrc                     ~/.bashrc
install_if_exists  git          files/gitconfig                  ~/.gitconfig
install_if_exists  polybar      files/polybar/config             ~/.config/polybar/config
install_if_exists  polybar      files/polybar/cmus.sh            ~/.config/polybar/cmus.sh
# TODO find a way to create necessary directories (like here)
install_if_exists  polybar      files/polybar/launch_polybar.sh  ~/scripts/launch_polybar.sh
install_if_exists  qutebrowser  files/qutebrowser/config.py      ~/.config/qutebrowser/config.py
install_if_exists  qutebrowser  files/qutebrowser/blockedHosts   ~/.config/qutebrowser/blockedHosts
install_if_exists  redshift     files/redshift.conf              ~/.config/redshift.conf
install_if_exists  task         files/taskrc                     ~/.taskrc
install_if_exists  timew        files/timewarrior.cfg            ~/.timewarrior/timewarrior.cfg
install_if_exists  tmux         files/tmux.conf                  ~/.tmux.conf
install_if_exists  vim          files/vimrc                      ~/.vimrc
