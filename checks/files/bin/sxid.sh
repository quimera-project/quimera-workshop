#!/bin/sh
eval $IMPORTS

if [ "$1" = "u" ]; then
    id="SUID"
    perm="-4000"
else
    id="SGID"
    perm="-2000"
fi

body=$(find / -not \( -path /dev -prune \) -not \( -path /proc -prune \)  -not \( -path /mnt -prune \) -perm "$perm" -type f 2>/dev/null | while read file; do
    file=$(ls -lh "$file")
    perms=$(echo "$file" | awk '{print$1}')
    links=$(echo "$file" | awk '{print$2}')
    user=$(echo "$file" | awk '{print$3}')
    group=$(echo "$file" | awk '{print$4}')
    size=$(echo "$file" | awk '{print$5}')
    date=$(echo "$file" | awk '{print $6, $7, $8}')
    path=$(echo "$file" | awk '{print$9}')
    name=$($JO text="$path" level="default")
    description=$($JO text="No info available" level="missing")
    if ! [ "$IAMROOT" ] && [ -O "$path" ]; then
        name=$($JO text="$path" level="high")
        description=$($JO text="You own the "$id" file" level="high")
    elif ! [ "$IAMROOT" ] && [ -w "$path" ]; then
        name=$($JO text="$path" level="critical")
        description=$($JO text="You can write the "$id" file" level="critical")
    else
        # filtered=$(echo "$path" | awk -F/ '{print $NF}' | sed -E  "s,^([a-zA-Z]+).*$,\1,")
        filtered=$(echo "$path" | awk -F/ '{print $NF}')
        json=$(cat "$FILES" | $JQ ".sxid[] | select(.name==\"$filtered\")" 2>/dev/null)
        text=""
        level=""
        if [ "$json" ]; then
            text=$(echo "$json" | $JQ -r ".text")
            level=$(echo "$json" | $JQ -r ".level")
        else
            text="None"
            level="missing"
        fi
        description=$($JO text="$text" level="$level")
        name=$($JO text="$path" level="$level")
    fi
    echo "[$name,\"$perms\",\"$links\",\"$user\",\"$group\",\"$size\",\"$date\",$description],"
done )

if [ "$body" ]; then
    header=$($JO -a "File" "Permissions" "Links" "User" "Group" "Size" "Date" "Info")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1