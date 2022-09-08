#!/bin/bash

cmus-remote -C status | grep stopped >/dev/null && exit 1
info=$(cmus-remote -C status)
max_song_length=40

prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(echo "$info" | grep "tag artist" -m 1 | cut -d ' ' -f 3-))
song=$(echo -n $(echo "$info" | grep "tag title" -m 1 | cut -d ' ' -f 3-))
if [ ${#song} -gt $max_song_length ]; then
    song="$(echo $song | cut -c1-$max_song_length | xargs)…"
fi

position=$(echo "$info" | grep position | cut -c 10-)
minutes1=$(prepend_zero $(($position / 60)))
seconds1=$(prepend_zero $(($position % 60)))

duration=$(echo "$info" | grep duration | cut -c 10-)
minutes2=$(prepend_zero $(($duration / 60)))
seconds2=$(prepend_zero $(($duration % 60)))

echo -n "$artist - $song [$minutes1:$seconds1 / $minutes2:$seconds2]"
