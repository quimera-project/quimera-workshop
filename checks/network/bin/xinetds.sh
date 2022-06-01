#!/bin/sh
eval $IMPORTS

if [ $? -eq 0 ]; then
    list=$(ls -d /etc/xinetd.d/* | while read file; do 
        content=$(cat $file 2>/dev/null | grep -Ev "^$|^#")
        if [ $? -eq 0 ]; then
            json="$($JO type="file" filename="$file" content="$content")"
            printf "%s," "$json"
        fi
    done )
    if [ "$list" ]; then
        printf "%s" "[${list%?}]"
        exit 0
    fi
fi

exit 1