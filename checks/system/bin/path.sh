#!/bin/sh
eval $IMPORTS

body=$(echo $PATH 2>/dev/null | tr ":" "\n" | while read -r p; do
    ls=$(ls -dl "$p" 2>/dev/null)
    if [ $? -eq 0 ]; then
        perms=$(echo $ls | awk '{print$1}')
        user=$(echo $ls | awk '{print$3}')
        group=$(echo $ls | awk '{print$4}')
        if [ -w "$p" ]; then
            p=$($JO text="$p" level=critical)
            perms=$($JO text="$perms" level=critical)
        fi
        echo "$($JO -a "$p" "$perms" "$user" "$group"),"
    fi
done )

if [ "$body" ]; then
    header=$($JO -a "Location" "Permissions" "User" "Group")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1