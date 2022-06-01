#!/bin/sh
eval $IMPORTS

body=$(netstat -punta 2>/dev/null | grep -i listen | while read line; do
    protocol=$(echo "$line" | awk '{print $1}')
    local_address=$(echo "$line" | awk '{print $4}')
    foreign_address=$(echo "$line" | awk '{print $5}')
    state=$(echo "$line" | awk '{print $6}')
    pid=$(echo "$line" | awk '{print $7}')
    if [ $(echo "$local_address" | grep -E "$($JQ -r '.high_active_ports' $NETWORK)") ]; then
        level="high"
    else
        level="default"
    fi
    echo "[\"$protocol\",{\"text\":\"$local_address\",\"level\": \"$level\"},\"$foreign_address\",\"$state\",\"$pid\"],"
done )

if [ "$body" ]; then
    header=$($JO -a "Protocol" "Local address" "Foreign address" "State" "Pid")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1