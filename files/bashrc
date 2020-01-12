alias fuck='sudo $(history -p \!\!)'
alias rm='rm -v'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf'

alias py3='python3'

alias gits='git status'
alias gitas='git add . && git status'
alias oneline='git log --oneline'

alias scanhome='nmap -sn 192.168.0.1/24'
alias publip='curl -s ipinfo.io/ip'

alias ls='ls --color=auto'
alias tree='tree -C'

export PS1="\[\e[93m\]\u\[\e[m\]@\h \[\e[96m\]\w\[\e[m\] \[\e[93m\]\\$\[\e[m\] "
export VISUAL=vim
export EDITOR=vim
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:~/scripts

#Various goodies below

#tab completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#force_color_prompt=yes
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

case $- in
    *i*) ;;
      *) return;;
esac

export CC=clang
export CXX=clang++
