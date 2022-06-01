#!/bin/sh
eval $IMPORTS

body=$(dmesg -eT 2>/dev/null | grep "signature" | while read line; do
    date=$(echo "$line" | awk '{print $1,$2,$3,$4,$5}')
    module=$(echo "$line" | cut -d " " -f6- | cut -d ":" -f1)
    info=$(echo "$line" | cut -d " " -f6- | cut -d ":" -f2- | xargs)
    echo "$($JO -a "$date" "$($JO text="$module" level="high")" "$info"),"
done )

if [ "$body" ]; then
    header=$($JO -a "Date" "Module" "Info")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1