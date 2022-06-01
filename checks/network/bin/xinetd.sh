#!/bin/sh
eval $IMPORTS

content=$(cat /etc/xinetd.conf 2>/dev/null | grep -Ev "^$|^#")
if [ $? -eq 0 ]; then
    $JO type="file" filename="/etc/xinetd.conf" content="$content"
    exit 0
fi

exit 1