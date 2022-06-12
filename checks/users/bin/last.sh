#!/bin/sh
eval $IMPORTS

body=$(last -Fiw 2>/dev/null | grep -Ev "^$|^reboot" | head | while read line; do
    user=$(echo "$line" | awk '{print $1}')
    tty=$(echo "$line" | awk '{print $2}')
    ip=$(echo "$line" | awk '{print $3}')
    date=$(echo "$line" | awk '{$1=$2=$3="";$0=$0;$1=$1}1' )
    echo "[ \"$user\",\"$tty\",\"$ip\",\"$date\"],"
done )

if [ "$body" ]; then
    header=$($JO -a "User" "Tty" "IP" "Date")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1