#!/bin/sh
eval $IMPORTS

body=$(lastlog 2>/dev/null | grep -Eiv "Never|^Username\s+Port" | while read line; do
    user=$(echo "$line" | awk '{print $1}')
    tty=$(echo "$line" | awk '{print $2}')
    if [ $(echo "$tty" | grep "pts/") ]; then
        ip=$(echo "$line" | awk '{print $3}')
        date=$(echo "$line" | awk '{$1=$2=$3="";$0=$0;$1=$1}1')
    else
        tty=""
        ip=""
        date=$(echo "$line" | awk '{$1="";$0=$0}1')
    fi
    echo "[ \"$user\",\"$tty\",\"$ip\",\"$date\"],"
done )

if [ "$body" ]; then
    header=$($JO -a "User" "Tty" "IP" "Date")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1