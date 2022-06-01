#!/bin/sh
eval $IMPORTS

software="cron crontab incrontab atq anacron"
software=$(echo $software | tr " " "\n" | while read scheduler; do
    if [ $(command -v $scheduler) ]; then
        echo "$($JO type="checkbox" query="$scheduler" passed=true),"
    else
        echo "$($JO type="checkbox" query="$scheduler" passed=false),"
    fi
done )

if [ "$software" ]; then
    echo "[${software%?}]"
    exit 0
fi

exit 1