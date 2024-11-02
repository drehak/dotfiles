#!/bin/bash

if [ $(timew get dom.active) -eq 1 ]; then
    info=$(timew)
    tracking_tags=$(echo "$info" | head -n 1 | cut -d' ' -f2-)
    tracking_current_time=$(echo "$info" | tail -n 1 | rev | cut -d' ' -f1 | rev | sed -e 's/[0:]*//')
    # timew 1.5.0 supports ANSI colored tags - pipe through sed to strip ANSI sequences
    echo "$tracking_tags [$tracking_current_time]" | sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g'
else
    echo "idle"
fi
