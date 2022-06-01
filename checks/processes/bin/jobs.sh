#!/bin/sh
eval $IMPORTS

list=$(ls -d /etc/cron* /etc/at* /etc/anacrontab /var/spool/cron/crontabs/* /etc/incron.d/* /var/spool/incron/* /var/spool/anacron 2>/dev/null | while read dir; do
    files=$(ls -A $dir | grep -vE ".placeholder|total*")
    if [ $? -eq 0 ]; then
        ls -A $dir | grep -vE ".placeholder|total*" | while read file; do
            if [ -f $file ]; then
                filename=$file
            else
                filename=${dir}/${file}
            fi
            content=$(cat $filename 2>/dev/null | grep -vE "^#|^$" | grep -E "^[0-9]")
            if [ "$content" ]; then
                json="$($JO type="file" filename="$filename" content="$content")"
                printf "%s," "$json"
            fi
        done
    fi
done )

if [ "$list" ]; then
    printf "%s" "[${list%?}]"
    exit 0
fi

exit 1
