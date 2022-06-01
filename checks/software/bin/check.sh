#!/bin/sh
eval $IMPORTS

software=$(echo "$*" | tr ' ' '\n' | while read s; do
    if [ $(command -v "$s") ]; then
        echo "$($JO type="checkbox" query="$s" passed=true),"
    else
        echo "$($JO type="checkbox" query="$s" passed=false),"
    fi
done )

if [ "$software" ]; then
    echo "[${software%?}]"
    exit 0
fi

exit 1