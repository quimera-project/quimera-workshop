#!/bin/sh
eval $IMPORTS

sessions=$(screen -ls 2>/dev/null | grep -E "^\s.+")

if [ "$sessions" ]; then
    list=$(echo "$sessions" | while read session; do
        s=$($JO type="pair" key="$($JO text="$(echo $session | awk '{print $1}')" level="high")" value="$(echo $session | awk '{print $(NF)}')")
        echo "$s,"
    done )
    echo "[${list%?}]"
    exit 0
fi

exit 1