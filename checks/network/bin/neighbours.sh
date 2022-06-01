#!/bin/sh
eval $IMPORTS

body=$(cat /proc/net/route 2>/dev/null | grep -iv "^Iface" | while read line; do
    interface=$(echo "$line" | awk '{print $1}')
    destination=$(echo "$line" | awk '{$0=$2; gsub(/../, "0x& "); printf "%d.%d.%d.%d\n", $4, $3, $2, $1}')
    gateway=$(echo "$line" | awk '{$0=$3; gsub(/../, "0x& "); printf "%d.%d.%d.%d\n", $4, $3, $2, $1}')
    genmask=$(echo "$line" | awk '{$0=$8; gsub(/../, "0x& "); printf "%d.%d.%d.%d\n", $4, $3, $2, $1}')
    raw_flags="0x$(echo "$line" | awk '{print $4}')"
    flags=""
    if [ $(($raw_flags & 0x0001)) -ne 0 ]; then flags="${flags}U"; fi
    if [ $(($raw_flags & 0x0002)) -ne 0 ]; then flags="${flags}G"; fi
    if [ $(($raw_flags & 0x0004)) -ne 0 ]; then flags="${flags}H"; fi
    if [ $(($raw_flags & 0x0008)) -ne 0 ]; then flags="${flags}R"; fi
    if [ $(($raw_flags & 0x0010)) -ne 0 ]; then flags="${flags}D"; fi
    if [ $(($raw_flags & 0x0020)) -ne 0 ]; then flags="${flags}M"; fi
    if [ $(($raw_flags & 0x0200)) -ne 0 ]; then flags="${flags}!"; fi
    hops=$(echo "$line" | awk '{print $7}')
    echo "$($JO -a "$interface" "$destination" "$gateway" "$genmask" "$flags" "$hops"),"
done )

if [ "$body" ]; then
    header=$($JO -a "Interface" "Destination" "Gateway" "Genmask" "Flags" "Hops")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1