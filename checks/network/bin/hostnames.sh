#!/bin/sh
eval $IMPORTS

hostname=$(uname -n 2>/dev/null || hostname 2>/dev/null || nmcli general hostname 2>/dev/null || hostnamectl --static 2>/dev/null || cat /etc/hostname 2>/dev/null || cat /proc/sys/kernel/hostname 2>/dev/null)
hostname=$($JO type="pair" key="Hostname" value="$hostname")
if [ "$hostname" ]; then
    list="${list}${hostname},"
fi

domainname=$($JO type="pair" key="NIS/YP domain name" value="$(domainname 2>/dev/null)")
if [ "$domainname" ]; then
    list="${list}${domainname},"
fi

dnsdomainname=$($JO type="pair" key="DNS domain name" value="$(dnsdomainname 2>/dev/null)")
if [ "$dnsdomainname" ]; then
    list="${list}${dnsdomainname},"
fi

if [ "$list" ]; then
    echo "[${list%?}]"
    exit 0
fi

exit 1