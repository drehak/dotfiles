#!/bin/sh

if command -v tput >/dev/null; then
    I=$(tput bold)$(tput setaf 2)  # installed - green
    S=$(tput bold)$(tput setaf 3)  # skipped - yellow
    F=$(tput bold)$(tput setaf 1)  # failed - red
    R=$(tput sgr0)                 # reset
    alias echo="echo -e"
else
    I=":) "
    S="   "
    F=":( "
fi

count_I=0
count_S=0
count_F=0

backup() {
    # copies file at $1 to first suitable filename
    # return: 0 = installed, 1 = failed, 2 = skipped, 3 = doesn't exist
    if [ ! -e "$1" ]; then
        echo >&2 "$S$1: file doesn't exist - skipping backup$R"
        return 3
    elif [ ! -r "$1" ]; then
        echo >&2 "$F$1: can't read file$R"
        return 1
    fi

    local day=$(date '+%Y%m%d')
    for n in $(seq -w 0 999); do
        # always start destination name with a dot
        local bn="$(basename $1)"
        local dn="$(dirname $1)"
        case "$bn" in
            .*)  local dst="$dn/$bn.$day.$n"   ;;
            *)   local dst="$dn/.$bn.$day.$n"  ;;
        esac
        if [ ! -e "$dst" ]; then
            if [ -n "$last" ] && diff -q "$1" "$last" >/dev/null; then
                # echo >&2 "$S$1: last backup $last does not differ - skipping backup$R"
                return 2
            fi
            cp "$1" "$dst"
            echo >&2 "$I$1: backed up to $dst$R"
            return 0
        fi
        local last="$dst"
    done
        
    echo >&2 "$F$1: could not backup - exhausted suffixes?$R"
    return 1
}

install() {
    # copies file at $1 to $2
    # return: 0 = installed, 1 = failed, 2 = skipped
    if [ ! -r "$1" ]; then
        echo >&2 "$F$1: can't read file$R\n"
        count_F=$((count_F+1))
        return 1
    fi

    backup "$2"
    result="$?"
    if [ "$result" -eq 1 ]; then
        echo >&2 "$F$1: failed to backup - aborting install$R\n"
        count_F=$((count_F+1))
        return 1
    elif [ "$result" -eq 2 ]; then
        echo >&2 "$S$1: last backup does not differ - skipping install$R\n"
        count_S=$((count_S+1))
        return 2
    fi

    cp "$1" "$2" || {
        echo >&2 "$F$1: failed to install to $2$R\n"
        count_F=$((count_F+1))
        return 1
    }
    echo >&2 "$I$1: installed to $2$R\n"
    count_I=$((count_I+1))
    return 0
}

install_if_exists() {
    # copies file at $2 to $3 if the command at $1 exists
    # return: 2 if not installed, else passed from `install`
    if command -v "$1" >/dev/null; then
        install "$2" "$3"
        return "$?"
    else
        echo >&2 "$S$2: $1 is not installed, skipping$R\n"
        count_S=$((count_S+1))
        return 2
    fi
}

install files/bashrc ~/.bashrc
install_if_exists vim files/vimrc ~/.vimrc
install_if_exists redshift files/redshift.conf ~/.redshift.conf

[ $count_I -gt 0 ] && echo >&2 "$I$count_I installed$R"
[ $count_S -gt 0 ] && echo >&2 "$S$count_S skipped$R"
[ $count_F -gt 0 ] && echo >&2 "$F$count_F failed$R"
