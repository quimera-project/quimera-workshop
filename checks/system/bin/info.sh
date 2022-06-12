#!/bin/sh
eval $IMPORTS

# ⋘ Datetime ⋙
datetime=$($JO type="pair" key="Datetime" value="$(date 2>/dev/null || echo "{\"text\":\"Couldn't be retrieved\", \"level\":\"missing\"}")")

# ⋘ Uptime ⋙
uptime=$(uptime -p 2>/dev/null | sed s/up\ //)
if [ "$uptime" ]; then
    uptime=$($JO type="pair" key="Uptime" value="$uptime")
else 
    uptime=$($JO type="pair" key="Uptime" value="$($JO text="Couldn't be retrieved" level="missing")")
fi

# ⋘ Kernel version ⋙
kernel_version=$(uname -r 2>/dev/null || cat /proc/version 2>/dev/null | cut -d " " -f3)
if [ "$kernel_version" ]; then
    if [ $(echo $kernel_version | grep -E "$(cat "$SYSTEM" | $JQ -r '.kernels.high')") ]; then
        kernel_version=$($JO type=pair key="Kernel version" value="$($JO text="$kernel_version" level="high")")
    else
        if [ $(echo $kernel_version | grep -E "$(cat "$SYSTEM" | $JQ -r '.kernels.critical')") ]; then
            kernel_version=$($JO type=pair key="Kernel version" value="$($JO text="$kernel_version" level="critical")")
        else
            kernel_version=$($JO type=pair key="Kernel version" value="$kernel_version")
        fi
    fi
else
    kernel_version=$($JO type=pair key="Kernel version" value="$($JO text="Couldn't be retrieved" level="missing")")
fi

# ⋘ Sudo version ⋙
sudo_version=$(sudo -V 2>/dev/null | head -1 | awk '{print$3}')
if [ "$sudo_version" ]; then
    if [ $(echo $sudo_version | grep -E "$(cat "$SYSTEM" | $JQ -r '.sudo.high')") ]; then
        sudo_version=$($JO type=pair key="Sudo version" value="$($JO text="$sudo_version" level="high")")
    else
        sudo_version=$($JO type=pair key="Sudo version" value="$sudo_version")
    fi
else
    sudo_version=$($JO type=pair key="Sudo version" value="$($JO text="Couldn't be retrieved" level="missing")")
fi

# ⋘ Virtual environment ⋙
is_virtual_machine=$(grep flags /proc/cpuinfo 2>/dev/null | grep hypervisor)
if [ "$(command -v systemd-detect-virt 2>/dev/null)" ]; then
  if [ "$is_virtual_machine" ]; then
    virtualmachine=$($JO type="question" query="Is this a virtual machine?" answer="$($JO text="Yes ($(systemd-detect-virt))" level="high")")
  else
    virtualmachine=$($JO type="question" query="Is this a virtual machine?" answer="$($JO text="No" level="missing")")
  fi
else
  if [ "$is_virtual_machine" ]; then
    virtualmachine=$($JO type="question" query="Is this a virtual machine?" answer="$($JO text="Yes" level="high")")
  else
    virtualmachine=$($JO type="question" query="Is this a virtual machine?" answer="$($JO text="No" level="missing")")
  fi
fi

# ⋘ Printer ⋙
if [ "$(lpstat -a 2>/dev/null)" ]; then
  printer=$($JO type="question" query="Is there any printer?" answer="$($JO text="Yes" level="medium")")
else
  if [ "$(system_profiler SPPrintersDataType 2>/dev/null)" ]; then
    printer=$($JO type="question" query="Is there any printer?" answer="$($JO text="Yes" level="medium")")
  else
    printer=$($JO type="question" query="Is there any printer?" answer="$($JO text="Couldn't be found" level="missing")")
  fi
fi

# ⋘ Operative system ⋙
lsb_release=$(lsb_release -a 2>/dev/null)
if [ $? -eq 0 ]; then
    distributor=$($JO type="pair" key="Distributor ID" value="$(echo "$lsb_release" | grep "Distributor ID:" | awk '{ print substr( $0, 17 ) }')")
    description=$($JO type="pair" key="Description" value="$(echo "$lsb_release" | grep "Description:" | awk '{ print substr( $0, 14 ) }')")
    release=$($JO type="pair" key="Release" value="$(echo "$lsb_release" | grep "Release:" | awk '{ print substr( $0, 10 ) }')")
    codename=$($JO type="pair" key="Codename" value="$(echo "$lsb_release" | grep "Codename:" | awk '{ print substr( $0, 11 ) }')")
    $JO -a "$datetime" "$uptime" "$distributor" "$description" "$release" "$codename" "$kernel_version" "$sudo_version" "$($JO type="separator")" "$virtualmachine" "$printer"
else
    hostnamectl=$(hostnamectl 2>/dev/null)
    if [ $? -eq 0 ]; then
        operative_system=$($JO type="pair" key="Operative system" value="$(echo "$hostnamectl" | grep "Operating System:" | awk '{ print substr( $0, 21 ) }')")
    else
        operative_system=$($JO type="pair" key="Operative system" value="$($JO text="Couldn't be retrieved" level="missing")")
    fi
    $JO -a "$datetime" "$uptime" "$operative_system" "$kernel_version" "$sudo_version" "$($JO type="separator")" "$virtualmachine" "$printer"
fi

exit 0