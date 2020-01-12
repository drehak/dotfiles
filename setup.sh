#!/bin/sh

backup() {
    # copies file at $1 to first suitable filename
    if [ ! -r "$1" ]; then
        echo >&2 "$1: can't read file"
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
                echo >&2 "$1: last backup $last does not differ - skipping"
                return 2
            fi
            cp "$1" "$dst"
            echo >&2 "$1: backed up to $dst"
            return 0
        fi
        local last="$dst"
    done
        
    echo >&2 "$1: could not backup - exhausted suffixes?"
    return 1
}

# just a test
backup "$1"
