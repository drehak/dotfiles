#!/bin/bash

[ $(timew get dom.active) -eq 1 ] || exit 1

info=$(timew)
tracking_tags=$(echo "$info" | head -n 1 | cut -d' ' -f2-)
tracking_current_time=$(echo "$info" | tail -n 1 | rev | cut -d' ' -f1 | rev)
echo "$tracking_tags [$tracking_current_time]"
