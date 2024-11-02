#!/bin/bash

info=$(cmus-remote -C status) || exit 1
echo "$info" | grep stopped >/dev/null && exit 1
max_song_length=41

prepend_zero () {
    seq -f "%02g" $1 $1
}

song=$(echo -n $(echo "$info" | grep "tag title" -m 1 | cut -d ' ' -f 3-))
if [ -z "$song" ]; then
    song=$(echo -n $(echo "$info" | grep "file" -m 1 | rev | cut -d '/' -f 1 | rev))
fi
if [ "${#song}" -gt $max_song_length ]; then
    song="$(echo $song | colrm $max_song_length)…"
fi
artist=$(echo -n $(echo "$info" | grep "tag artist" -m 1 | cut -d ' ' -f 3-))

position=$(echo "$info" | grep position | cut -c 10-)
minutes1=$(prepend_zero $(($position / 60)))
seconds1=$(prepend_zero $(($position % 60)))

duration=$(echo "$info" | grep duration | cut -c 10-)
minutes2=$(prepend_zero $(($duration / 60)))
seconds2=$(prepend_zero $(($duration % 60)))

if [ -n "$artist" ]; then
    echo -n "$artist - $song [$minutes1:$seconds1 / $minutes2:$seconds2]"
else
    echo -n "$song [$minutes1:$seconds1 / $minutes2:$seconds2]"
fi
