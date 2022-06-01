#!/bin/sh
eval $IMPORTS

body=$(ls -d /proc/*/ 2>/dev/null | while read folder; do
    maps=$(cat ${folder}maps 2>/dev/null)
    if [ $? -eq 0 ]; then
        count=0
        echo "$maps" | while read line; do
            if [ "$(echo "$line" | awk '{print $2}' | grep "wx" 2>/dev/null)" ]; then
                pid=$(echo "$folder" | cut -d "/" -f3)
                name=$(cat /proc/$pid/status 2>/dev/null | grep -w "Name:" | awk '{print $2}')
                address=$(echo "$line" | awk '{print $1}')
                perms=$(echo "$line" | awk '{print $2}')
                offset=$(echo "$line" | awk '{print $3}')
                dev=$(echo "$line" | awk '{print $4}')
                inode=$(echo "$line" | awk '{print $5}')
                pathname=$(echo "$line" | awk '{print $6}')
                row="[\"$pid\",\"$name\",\"$count\",\"$address\",{\"text\":\"$perms\", \"level\":\"high\"},\"$offset\",\"$dev\",\"$inode\",\"$pathname\"]"
                echo "$row,"
            fi
            count=$(( count+1 ))
        done
    fi
done )

if [ "$body" ]; then
    header=$($JO -a "PID" "Name" "Line nº" "Address" "Perms" "Offset" "Dev" "Inode" "Pathname" )
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1