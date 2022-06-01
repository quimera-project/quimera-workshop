#!/bin/sh
eval $IMPORTS

body=$(awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null | tr ":" " " | while read line; do
    username=$(echo "$line" | awk '{print $1}')
    password=$(echo "$line" | awk '{print $2}')
    uid=$(echo "$line" | awk '{print $3}')
    gid=$(echo "$line" | awk '{print $4}')
    gecos=$(echo "$line" | awk '{print $5}')
    home=$(echo "$line" | awk '{print $6}')
    shell=$(echo "$line" | awk '{print $7}')
    row="[\"$username\",\"$password\",\"$uid\",\"$gid\",\"$gecos\",\"$home\",\"$shell\"]"
    echo "$row,"
done
)
header=$($JO -a "Username" "Password" "UID" "GID" "Full name" "Home" "Login shell")
$JO header="$header" body="[${body%?}]"