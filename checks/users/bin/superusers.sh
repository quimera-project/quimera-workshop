#!/bin/sh
eval $IMPORTS

body=$(awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null | while read line; do
    username=$(echo "$line" | awk -F: '{print $1}')
    password=$(echo "$line" | awk -F: '{print $2}')
    uid=$(echo "$line" | awk -F: '{print $3}')
    gid=$(echo "$line" | awk -F: '{print $4}')
    gecos=$(echo "$line" | awk -F: '{print $5}')
    home=$(echo "$line" | awk -F: '{print $6}')
    shell=$(echo "$line" | awk -F: '{print $7}')
    if [ "$username" = "root" ]; then
        row="[\"$username\",\"$password\",\"$uid\",\"$gid\",\"$gecos\",\"$home\",\"$shell\"]"
    else
        row="[{\"level\":\"medium\", \"text\":\"$username\"},{\"level\":\"medium\", \"text\":\"$password\"},{\"level\":\"medium\", \"text\":\"$uid\"},{\"level\":\"medium\", \"text\":\"$gid\"},{\"level\":\"medium\", \"text\":\"$gecos\"},{\"level\":\"medium\", \"text\":\"$home\"},{\"level\":\"medium\", \"text\":\"$shell\"}]"
    fi
    echo "$row,"
done
)
header=$($JO -a "Username" "Password" "UID" "GID" "Full name" "Home" "Login shell")
$JO header="$header" body="[${body%?}]"