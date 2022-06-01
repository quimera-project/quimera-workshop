#!/bin/sh
eval $IMPORTS

sessions=$(tmux ls 2>/dev/null)

if [ $? -eq 0 ]; then
    list=$(echo $sessions | while read session; do
        s=$($JO type="pair" key="$($JO text="$(echo "$session" | awk '{print $2,$3}')" level="high")" value="$(echo "$session" | awk '{print $(NF)}')")
        echo "$s,"
    done )
    echo "[${list%?}]"
    exit 0
fi

exit 1
