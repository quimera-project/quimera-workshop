#!/bin/sh
eval $IMPORTS

body=$(ls -d /etc/cron* /etc/at* /etc/anacrontab /var/spool/cron/crontabs/* /etc/incron.d/* /var/spool/incron/* /var/spool/anacron 2>/dev/null | while read dir; do
    files=$(ls -A $dir | grep -vE ".placeholder|total*")
    if [ $? -eq 0 ]; then
        ls -Al $dir | grep -vE ".placeholder|total*" | while read file; do
            perms=$(echo $file | awk '{print$1}')
            links=$(echo $file | awk '{print$2}')
            user=$(echo $file | awk '{print$3}')
            group=$(echo $file | awk '{print$4}')
            size=$(echo $file | awk '{print$5}')
            date=$(echo $file |  awk '{print $6, $7, $8}')
            filename=$(echo $file |  awk '{print$9}')
            if [ -f $filename ]; then
                filename=$filename
            else
                filename=${dir}/${filename}
            fi
            if [ -w "$dir/$(echo $file | awk '{print$(NF)}')" ]; then
                perms=$($JO text="$perms" level=critical)
                filename=$($JO text="$filename" level=critical)
            else
                perms=$($JO text="$perms" level=default)
                filename=$($JO text="$filename" level=default)
            fi
            echo "[$filename,$perms,\"$links\",\"$user\",\"$group\",\"$size\",\"$date\"],"
        done
    fi
done )

if [ "$body" ]; then
    header=$($JO -a "File" "Permissions" "Links" "User" "Group" "Size" "Date")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1



