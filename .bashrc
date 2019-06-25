alias fuck='sudo $(history -p \!\!)'
alias ytrip='youtube-dl --extract-audio --add-metadata --audio-format vorbis'
alias py3='python3'
alias gits='git status'
alias gitas='git add . && git status'
alias oneline='git log --oneline'
alias vimp='vim -p'

alias Syu='sudo pacman -Syu'
alias Ss='sudo pacman -Ss'
alias S='sudo pacman -S'
alias R='sudo pacman -R'

# configs
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf'
alias i3conf='vim ~/.tmux.conf'

# temporary shortcuts bound to change frequently
alias hw='cd ~/pb161/hw05'
alias mini='cd ~/pb161/mini09'

# network
alias wifi-menu='sudo wifi-menu'
alias aisa='ssh xrehak2@aisa'
alias aisaf='ssh xrehak2@aisa.fi.muni.cz'
alias scanhome='nmap -sn 192.168.0.1/24'
alias myip='curl ipinfo.io/ip'

# colors
alias ls='ls --color=auto'
alias tree='tree -C'
alias difc='diff --color=always'


export PATH=/usr/local/bin:/home/rehy/bin:/home/rehy/.local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/usr/bin/core_perl:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:~/scripts
export PS1="\[\e[93m\]\u\[\e[m\]@\h \[\e[96m\]\w\[\e[m\] \[\e[93m\]\\$\[\e[m\] "
export VISUAL=vim
export EDITOR=vim

#Various goodies below

#this is for rtorrent
stty stop undef
stty start undef

#tab completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#force_color_prompt=yes

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=
shopt -s histappend
shopt -s checkwinsize

case $- in
    *i*) ;;
      *) return;;
esac

mkcdir() {
    mkdir "$@"
    if [ "$1" = "-p" ]; then
        cd "$2"
    else
        cd "$1"
    fi
}

bin2ascii() { { tr -cd 01 | fold -w8; echo; } | sed '1i obase=8; ibase=2' | bc | sed 's/^/\\/' | tr -d '\n' | xargs -0 echo -e; }

# colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# ambiance
rainymood() {
	FILE=$((RANDOM%4))
	URL="https://rainymood.com/audio1110/${FILE}.ogg"
	mpv "$URL" && rainymood
}


