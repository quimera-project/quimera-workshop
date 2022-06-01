#!/bin/sh
eval $IMPORTS

body=$(dpkg --list 2>/dev/null | grep "compiler" | while read line; do
    name=$(echo "$line" | awk '{print $2}')
    version=$(echo "$line" | awk '{print $3}')
    arch=$(echo "$line" | awk '{print $4}')
    description=$(echo "$line" | awk '{$1=$2=$3=$4="";$0=$0;$1=$1}1')
    row="[\"$name\",\"$version\",\"$arch\",\"$description\"]"
    echo "$row,"
done )

if [ "$body" ]; then
    header=$($JO -a "Name" "Version" "Architecture" "Description")
    $JO header="$header" body="[${body%?}]"
    exit 0
fi

exit 1