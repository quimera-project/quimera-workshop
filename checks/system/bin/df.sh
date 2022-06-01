#!/bin/sh
eval $IMPORTS

df=$(df -h 2>/dev/null | tail -n +2)
if [ $? -eq 0 ]; then
    body=$(echo "$df" | while read line; do
        filesystem=$(echo "$line" | awk '{print$1}')
        size=$(echo "$line" | awk '{print$2}')
        used=$(echo "$line" | awk '{print$3}')
        avail=$(echo "$line" | awk '{print$4}')
        percentage=$(echo "$line" | awk '{print$5}')
        mounted=$(echo "$line" | awk '{print$6}')
        row="[\"$filesystem\",\"$size\",\"$used\",\"$avail\",\"$percentage\",\"$mounted\"]"
        echo "$row,"
    done )
    header=$($JO -a "Filesystem" "Size" "Used" "Avail" "Use%" "Mounted on")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1