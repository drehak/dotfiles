# case "$0" in
#           -sh|sh|*/sh)    modules_shell=sh ;;
#        -ksh|ksh|*/ksh)    modules_shell=ksh ;;
#        -zsh|zsh|*/zsh)    modules_shell=zsh ;;
#     -bash|bash|*/bash)    modules_shell=bash ;;
# esac
# module() { eval `/usr/bin/tclsh /usr/share/Modules/libexec/modulecmd.tcl $modules_shell $*`; }
# # .bashrc
# 

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# No pager for systemctl
export SYSTEMD_PAGER=

# User specific aliases and functions
alias vimrc="vim ~/.vimrc"
alias cal="cal -m"

alias dnfi="sudo dnf install"
alias dnfr="sudo dnf remove"
alias dnfs="dnf search"
alias dnfu="sudo dnf update"

branch() {
  git branch &>/dev/null && echo "($(git rev-parse --abbrev-ref HEAD)) "
}
export PS1='\[\e[97m\]\u\[\e[91m\]@\[\e[97m\]\h \[\e[92m\]$(branch)\[\e[96m\]\w\[\e[m\] '
# export PS1="\[\e[97m\]\u\[\e[m\]\[\e[91m\]@\[\e[m\]\[\e[97m\]\h\[\e[m\] \[\e[96m\]\w\[\e[m\] "

# Unlimited history
export HISTFILESIZE=
export HISTSIZE=

# Colored man pages
PAGER=most
alias man="PAGER=$PAGER man"
alias sfdoc="PAGER=$PAGER sfdoc"

# ipu colors
export PRETTY="color"

# previously: alias bashrc="vim ~/.bashrc"
bashrc() {
    local path="$HOME/.bashrc"
    vim "$path"
    >&2 echo "Reloading bashrc"
    source "$path"
}

stopwatch() {
    date1=`date +%s`; while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    done
}

mkcdir () {
    mkdir -p -- "$1" && cd -P -- "$1"
}

cdp () {
    cd -P -- "$1" 
}

src () {
    vim $(which "$1") 
}

hisgrep () {
    history | grep "$@"
}

lsfun () {
    grep "() {" "$@"
}

lab () {
    pushd tests/distribution/jats/lab || exit
    1minutetip rhel7
    popd
}

clone_rht () {
    git clone "ssh://pkgs.devel.redhat.com/tests/$1"
}

clone_gh () {
    git clone "https://github.com/$1/$2"
}

rover () {
    firefox --new-tab "https://rover.redhat.com/people/profile/$1"
}

PATH="/home/drehak/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/drehak/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/drehak/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/drehak/perl5\""; export PERL_MB_OPT;

# no cows!
export ANSIBLE_NOCOWS=1
PERL_MM_OPT="INSTALL_BASE=/home/drehak/perl5"; export PERL_MM_OPT;

alias pesdb='sudo docker start pesdb'
alias django='PES_DEVEL=1 ./manage.py'
