#!/bin/sh
eval $IMPORTS

sockets=$(ss -xlpH 2>/dev/null | awk '{print $5}' | uniq)
if ! [ "$sockets" ]; then
    sockets=$(netstat -pa --unix 2>/dev/null | grep -i "LISTENING" | awk '{print $10}' | uniq )
fi

body=$( echo "$sockets" | while read socket; do
    if [ "$(echo "$socket" | cut -c1)" = "@" ]; then
        continue
    fi
    file=$(ls -lh $socket 2>/dev/null)
    perms=$(echo $file | awk '{print$1}')
    links=$(echo $file | awk '{print$2}')
    user=$(echo $file | awk '{print$3}')
    group=$(echo $file | awk '{print$4}')
    size=$(echo $file | awk '{print$5}')
    date=$(echo $file |  awk '{print $6, $7, $8}')
    name=$($JO text="$socket" level="default")
    description=$($JO text="No info available" level="missing")
    if [ -O "$socket" ]; then
        name=$($JO text="$socket" level="medium")
        description=$($JO text="You own the file" level="medium")
    else
        level="medium"
        if [ -r "$socket" ]; then
            perms2="read and "
        fi
        if [ -w "$socket" ]; then
            perms2="${perms2}write and "
            if [ "$socket" = "/var/run/docker.sock" ]; then
                level="critical"
            fi
        fi
        if [ "$perms2" ]; then
            name=$($JO text="$socket" level="$level")
            description=$($JO text="You can ${perms2%?????} it" level="$level")
        fi
    fi
    socketcurl=$(curl --max-time 0.05 --unix-socket "$socket" http:/index 2>/dev/null)
    if [ $? -eq 0 ]; then
        http="$($JO text="Yes" level="info")"
    else
        http="$($JO text="No" level="default")"
    fi
    echo "[$name,\"$perms\",\"$links\",\"$user\",\"$group\",\"$size\",\"$date\",$description,$http],"
done )

if [ "$body" ]; then
    header=$($JO -a "File" "Permissions" "Links" "User" "Group" "Size" "Date" "Info" "Uses HTTP?")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1