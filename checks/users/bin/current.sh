#!/bin/sh
eval $IMPORTS

users=$(users)
if [ $? -eq 0 ]; then
    if [ $(echo $users | wc -w) -gt 0 ]; then
        $JO type="raw" content="$users"
    else
        $JO type="raw" content="$($JO text="None" level="missing")"
    fi
    exit 0
fi

exit 1