#!/bin/sh
eval $IMPORTS

hosts=$(grep -vE "^#|^[0-9]" /etc/hosts 2>/dev/null | grep -v "^$" | while read line; do
    ip=$(echo "$line" | awk '{print $1}')
    aliases=$(echo "$line" | cut -d " " -f2-)
    if [ $(echo $aliases | wc -w) -gt 1 ]; then
        aliases=$($JO -a $aliases)
    fi
    case $ip in
        fc*|fd*|fe*)
            $JO -a $ip $aliases
        ;;
        ::1)
            $JO -a "\::1" $aliases
        ;;
        *)
            $JO -a $ip $aliases
        ;;
    esac
done )
    
$JO header=$($JO -a "ip" "aliases") body=$($JO -a $hosts)