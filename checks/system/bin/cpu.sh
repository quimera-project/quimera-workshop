#!/bin/sh
eval $IMPORTS

cpu=$(lscpu 2>/dev/null)
if [ $? -eq 0 ]; then
    architecture=$($JO type="pair" key="Architecture" value="$(echo "$cpu" | grep "Architecture:" | cut -d ":" -f2 | xargs)")
    byte_order=$($JO type="pair" key="Byte order" value="$(echo "$cpu" | grep "Byte Order:" | cut -d ":" -f2 | xargs)")
    op_mode=$($JO type="pair" key="CPU op-modes" value="$(echo "$cpu" | grep "CPU op-mode(s):" | cut -d ":" -f2 | xargs)")
    model_name=$($JO type="pair" key="Model name" value="$(echo "$cpu" | grep "Model name:" | cut -d ":" -f2 | xargs)")
    sockets=$($JO type="pair" key="Sockets" value="$(echo "$cpu" | grep "Socket(s):" | cut -d ":" -f2 | xargs)")
    cores_per_socket=$($JO type="pair" key="Cores per socket" value="$(echo "$cpu" | grep "Core(s) per socket:" | cut -d ":" -f2 | xargs)")
    threads=$($JO type="pair" key="Threads per core" value="$(echo "$cpu" | grep "Thread(s) per core:" | cut -d ":" -f2 | xargs)")
    hypervisor=$($JO type="pair" key="Hypervisor vendor" value="$(echo "$cpu" | grep "Hypervisor vendor:" | cut -d ":" -f2 | xargs)")
    virtualization_type=$($JO type="pair" key="Virtualization type" value="$(echo "$cpu" | grep "Virtualization type:" | cut -d ":" -f2 | xargs)")
    echo "[$architecture,$byte_order,$op_mode,$model_name,$sockets,$cores_per_socket,$threads,$hypervisor,$virtualization_type]"
    exit 0
fi

exit 1