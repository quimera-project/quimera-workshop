#!/bin/sh
eval $IMPORTS

body=$(ls -d /proc/*/ 2>/dev/null | while read folder; do
    status=$(cat ${folder}status 2>/dev/null)
    if [ $? -eq 0 ]; then
        pid=$(echo "$status" | grep -w "Pid:" | cut -d ":" -f2- | xargs)
        name=$(echo "$status" | grep -w "Name:" | awk '{print $2}')
        state=$(echo "$status" | grep -w "State:" | cut -d ":" -f2- | xargs)
        uids=$(echo "$status" | grep -w "Uid:")
        ruid=$(echo "$uids" | awk '{print $2}')
        euid=$(echo "$uids" | awk '{print $3}')
        suid=$(echo "$uids" | awk '{print $4}')
        fsuid=$(echo "$uids" | awk '{print $5}')
        gids=$(echo "$status" | grep "Gid:")
        rgid=$(echo "$gids" | awk '{print $2}')
        egid=$(echo "$gids" | awk '{print $3}')
        sgid=$(echo "$gids" | awk '{print $4}')
        fsgid=$(echo "$gids" | awk '{print $5}')
        if [ $(( $ruid+$euid+$suid+$fsuid )) -ne $(( $ruid*4 )) ]; then
            row="[\"$pid\",\"$name\",\"$state\",\"UserID\",{\"text\":\"$ruid\", \"level\":\"high\"},{\"text\":\"$euid\", \"level\":\"high\"},{\"text\":\"$suid\", \"level\":\"high\"},{\"text\":\"$fsuid\", \"level\":\"high\"}]"
            echo "$row,"
        fi
        if [ $(( $rgid+$egid+$sgid+$fsgid )) -ne $(( $rgid*4 )) ]; then
            row="[\"$pid\",\"$name\",\"$state\",\"GroupID\",{\"text\":\"$rgid\", \"level\":\"high\"},{\"text\":\"$egid\", \"level\":\"high\"},{\"text\":\"$sgid\", \"level\":\"high\"},{\"text\":\"$fsgid\", \"level\":\"high\"}]"
            echo "$row,"
        fi
    fi
done )

if [ "$body" ]; then
    header=$($JO -a "PID" "Name" "State" "Type of ID" "Real ID" "Effective ID" "Saved set ID" "Filesystem ID")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1