#!/bin/bash

cmus-remote -C status | grep stopped >/dev/null && exit 1

prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" -m 1| cut -d ' ' -f 3-))
song=$(echo -n $(cmus-remote -C status | grep "tag title" | cut -d ' ' -f 3-))

position=$(cmus-remote -C status | grep position | cut -c 10-)
minutes1=$(prepend_zero $(($position / 60)))
seconds1=$(prepend_zero $(($position % 60)))

duration=$(cmus-remote -C status | grep duration | cut -c 10-)
minutes2=$(prepend_zero $(($duration / 60)))
seconds2=$(prepend_zero $(($duration % 60)))

echo -n "$artist - $song [$minutes1:$seconds1 / $minutes2:$seconds2]"
