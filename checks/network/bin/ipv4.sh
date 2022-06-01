#!/bin/sh
eval $IMPORTS

split() {
    set -f
    old_ifs=$IFS
    IFS=$2
    set -- $1
    printf '%s\n' "$@"
    IFS=$old_ifs
    set +f
}

hosts=$(grep -vE "^$|^#"$'\xEF\xBB\xBF' /etc/hosts 2>/dev/null | grep "^[0-9].*" | while read line; do
    ip=$(echo "$line" | awk '{print $1}')
    aliases=$(echo "$line" | cut -d " " -f2-)
    for alias in $aliases; do
        case $alias in
            *seal*)
                column="$column$alias "
            ;;

            *.htb)
                column="$column$($JO text=$alias level=info) "
            ;;

            *.docker*)
                column="$column$($JO text=$alias level=high) "
            ;;

            *)
                column="$column$alias "
            ;;
        esac
    done
    if [ $(echo $column | wc -w) -gt 1 ]; then
        row="$($JO -a $ip $($JO -a ${column%?}))"
    else
        row="$($JO -a $ip ${column%?})"
    fi
    column=""
    echo $row
    done )
    
$JO header=$($JO -a ip aliases) body=$($JO -a $hosts)