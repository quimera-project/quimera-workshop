#!/bin/sh
eval $IMPORTS

list=$(for json in $(cat "FILES" | $JQ -r ".writable[]"); do
    name=$(echo "$json" | $JQ -r ".name")
    if [ -w "$name" ]; then
        key=$($JO text="$name" level="$(echo "$json" | $JQ -r ".level")")
        value=$(echo "$json" | $JQ -r ".info")
        echo "$($JO type="pair" key="$key" value="$value"),"
    fi
done )

if [ "$list" ]; then
    echo "[${list%?}]"
    exit 0
fi

exit 1
