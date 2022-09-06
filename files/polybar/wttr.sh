#!/bin/bash
location="Brno"

output=$(curl -s wttr.in/$location?format=%t)
code=$?

[ $code != 0 ] && echo "curl: $code" && exit 1
[ $(echo "$output" | wc -l) != 1 ] && echo "error?" && exit 1
echo "$output"
