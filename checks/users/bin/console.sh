#!/bin/sh
eval $IMPORTS

no_shells=$(grep -Ev "sh$" /etc/passwd 2>/dev/null | cut -d ':' -f 7 | sort | uniq)
printf "%s\n" "$no_shells" | while read shell; do
    if $shell -c "whoami" 2>/dev/null | grep -q "$WHOAMI"; then
        unexpected_shells="$unexpected_shells\n$shell"
    fi
done
consoleusers=$(grep "sh$" /etc/passwd 2>/dev/null | sort | while read line; do
    username=$(echo "$line" | cut -d ":" -f1)
    password=$(echo "$line" | cut -d ":" -f2)
    uid=$(echo "$line" | cut -d ":" -f3)
    gid=$(echo "$line" | cut -d ":" -f4)
    gecos=$(echo "$line" | cut -d ":" -f5)
    home=$(echo "$line" | cut -d ":" -f6)
    shell=$(echo "$line" |  cut -d ":" -f7)
    row="[\"$username\",\"$password\",\"$uid\",\"$gid\",\"$gecos\",\"$home\",\"$shell\"]"
    echo "$row,"
done
)
possible_consoleusers=$(if [ "$unexpected_shells" ]; then
    echo "$unexpected_shells" | while read shell; do
        if [ "$shell" ]; then
            grep -E "${shell}$" /etc/passwd | while read line; do
                username=$(echo "$line" | cut -d ":" -f1)
                password=$(echo "$line" | cut -d ":" -f2)
                uid=$(echo "$line" | cut -d ":" -f3)
                gid=$(echo "$line" | cut -d ":" -f4)
                gecos=$(echo "$line" | cut -d ":" -f5)
                home=$(echo "$line" | cut -d ":" -f6)
                shell=$(echo "$line" |  cut -d ":" -f7)
                shell=$($JO text="$shell" level="high")
                row="[\"$username\",\"$password\",\"$uid\",\"$gid\",\"$gecos\",\"$home\",$shell]"
                echo "$row,"
            done
        fi
    done
fi )
body="$consoleusers$possible_consoleusers"

if [ "$body" ]; then
    header=$($JO -a "Username" "Password" "UID" "GID" "Full name" "Home" "Login shell")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1