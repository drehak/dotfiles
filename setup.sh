#!/bin/sh

I=$(tput bold)$(tput setaf 2)  # installed - green
S=$(tput bold)$(tput setaf 3)  # skipped - yellow
F=$(tput bold)$(tput setaf 1)  # failed - red
R=$(tput sgr0)                 # reset

backup() {
    # copies file at $1 to first suitable filename
    # return: 0 = installed, 1 = failed, 2 = skipped, 3 = doesn't exist
    if [ ! -e "$1" ]; then
        echo -e >&2 "$S$1: file doesn't exist - skipping backup$R"
        return 3
    elif [ ! -r "$1" ]; then
        echo -e >&2 "$F$1: can't read file$R"
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
                # echo -e >&2 "$S$1: last backup $last does not differ - skipping backup$R"
                return 2
            fi
            cp "$1" "$dst"
            echo -e >&2 "$I$1: backed up to $dst$R"
            return 0
        fi
        local last="$dst"
    done
        
    echo -e >&2 "$F$1: could not backup - exhausted suffixes?$R"
    return 1
}

install() {
    # copies file at $1 to $2
    # return: 0 = installed, 1 = failed, 2 = skipped
    if [ ! -r "$1" ]; then
        echo -e >&2 "$F$1: can't read file$R"
        return 1
    fi

    backup "$2"
    if [ "$?" -eq 1 ]; then
        return 1
    fi

    cp "$1" "$2" || { echo -e >&2 "$F$1: failed to install to $2$R"; return 1; }
    echo -e >&2 "$I$1: installed to $2$R"
    return 0
}

# just a test
mkdir testhome
echo this kills the frog > testhome/topkek
for pass in 0 1 2; do
    echo >&2 "--- pass #$pass"
    echo >&2
    install files/bashrc testhome/.bashrc
    echo >&2
    install files/vimrc testhome/.vimrc
    echo >&2
    install files/redshift.conf testhome/topkek
    echo >&2
    install files/redshift.conf testhome/top/kek
    echo >&2
    install files/bashrc files/bashrc
    echo >&2
done
echo >&2 "--- cleaning up"
rm -rf testhome
