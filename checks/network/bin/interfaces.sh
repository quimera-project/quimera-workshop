#!/bin/sh
eval $IMPORTS

body=$( ip a list | awk -F': ' '/^[0-9]/ {print $2}' | while read interface; do
    line=$(ip a show $(echo "$interface" | cut -d "@" -f1))
    state=$(echo "$line" | grep -oE "\sstate\s[A-Z]*" | awk '{print $2}')
    flags=$(echo "$line" | grep -Eo "<([A-Z]|,|_)*>")
    link=$(echo "$line" | grep -E "^   \s*link/" | awk '{print $1}')
    link_addr=$(echo "$line" | grep -E "^\s*link/" | awk '{print $2}')
    link_brd=$(echo "$line" | grep -E "^\s*link/" | awk '{print $4}')
    ipv4_addr=""
    ipv4_brd=""
    ipv4_line=$(echo "$line" | grep -E "^\s*inet\s")
    if [ $? -eq 0 ];then
        ipv4_addr=$(echo "$ipv4_line" | awk '{print $2}')
        if [ $(echo "$ipv4_line" | awk '{print $3}') = "brd" ]; then
            ipv4_brd=$(echo "$ipv4_line" | awk '{print $4}')
        fi
    fi
    ipv6_addr=""
    inet6_line=$(echo "$line" | grep -E "^\s*inet6\s")
    if [ $? -eq 0 ];then
        ipv6_addr=$(echo "$inet6_line" | awk '{print $2}')
    fi
    if [ $state = "DOWN" ]; then
        interface=$($JO text="$interface" level="missing")
        state=$($JO text="DOWN" level="missing")
        flags=$($JO text="$flags" level="missing")
        link=$($JO text="$link" level="missing")
        link_addr=$($JO text="$link_addr" level="missing")
        link_brd=$($JO text="$link_brd" level="missing")
        ipv4_addr=$($JO text="$ipv4_addr" level="missing")
        ipv4_brd=$($JO text="$ipv4_brd" level="missing")
        ipv6_addr=$($JO text="$ipv6_addr" level="missing")
        echo "["$interface","$state","$flags","$link","$link_addr","$link_brd","$ipv4_addr","$ipv4_brd","$ipv6_addr"],"
    else
        echo "[\""$interface"\",\""$state"\",\""$flags"\",\""$link"\",\""$link_addr"\",\""$link_brd"\",\""$ipv4_addr"\",\""$ipv4_brd"\",\""$ipv6_addr"\"],"
    fi
done )

if [ "$body" ]; then
    header=$($JO -a "Interface" "State" "Flags" "Link" "Link addr" "Link brd" "IPv4 addr" "IPv4 brd" "IPv6 addr")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1


