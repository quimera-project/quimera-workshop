#!/bin/sh
eval $IMPORTS

body=$(cat /etc/inetd.conf 2>/dev/null | grep -Ev "^$|^#" | while read line; do
    service=$(echo "$line" | awk '{print$1}')
    type=$(echo "$line" | awk '{print$2}')
    protocol=$(echo "$line" | awk '{print$3}')
    wait=$(echo "$line" | awk '{print$4}')
    user=$(echo "$line" | awk '{print$5}')
    program=$(echo "$line" | awk '{print$6}')
    params=$(echo "$line" | awk '{$1=$2=$3=$4=$5=$6="";$0=$0;$1=$1}1' )
    echo "$($JO -a "$service" "$type" "$protocol" "$wait" "$user" "$program" "$params"),"
done )

if [ "$body" ]; then
    header=$($JO -a "Service" "Type" "Protocol" "Wait" "User" "Program" "Params")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1