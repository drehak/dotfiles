#!/bin/sh
# install: copies file at $1 to $2
# install_if_exists: copies file at $2 to $3 if the command at $1 exists
install_if_exists  bash         files/bashrc                     ~/.bashrc
        if exists  cmus;        then mkdir -p                    ~/.config/cmus; fi
install_if_exists  cmus         files/cmus/autosave              ~/.config/cmus/autosave
install_if_exists  cmus         files/cmus/synth.theme           ~/.config/cmus/synth.theme
        if exists  dunst;       then mkdir -p                    ~/.config/dunst; fi
install_if_exists  dunst        files/dunstrc                    ~/.config/dunst/dunstrc
install_if_exists  git          files/gitconfig                  ~/.gitconfig
        if exists  polybar;     then mkdir -p                    ~/.config/polybar; fi
install_if_exists  polybar      files/polybar/config             ~/.config/polybar/config
install_if_exists  polybar      files/polybar/cmus.sh            ~/.config/polybar/cmus.sh
install_if_exists  polybar      files/polybar/task.sh            ~/.config/polybar/task.sh
install_if_exists  polybar      files/polybar/timew.sh           ~/.config/polybar/timew.sh
install_if_exists  polybar      files/polybar/wttr.sh            ~/.config/polybar/wttr.sh
        if exists  polybar;     then mkdir -p                    ~/scripts; fi
install_if_exists  polybar      files/polybar/launch_polybar.sh  ~/scripts/launch_polybar.sh
        if exists  qutebrowser; then mkdir -p                    ~/.config/qutebrowser; fi
install_if_exists  qutebrowser  files/qutebrowser/config.py      ~/.config/qutebrowser/config.py
install_if_exists  qutebrowser  files/qutebrowser/blockedHosts   ~/.config/qutebrowser/blockedHosts
install_if_exists  redshift     files/redshift.conf              ~/.config/redshift.conf
install_if_exists  task         files/taskrc                     ~/.taskrc
        if exists  timew;       then mkdir -p                    ~/.timewarrior; fi
install_if_exists  timew        files/timewarrior.cfg            ~/.timewarrior/timewarrior.cfg
install_if_exists  tmux         files/tmux.conf                  ~/.tmux.conf
install_if_exists  vim          files/vimrc                      ~/.vimrc
        if exists  vim;         then touch                       ~/.vimrc.local; fi
