# 💻 CPU information

## Return Value
A list with key-value pairs of different characteristics of the CPU is returned.

*Fields*:
- **Architecture**: Type of CPU architecture.
- **Byte order**: Order of the stored bytes (Little endian or Big endian).
- **CPU op-modes**: CPU execution modes.
- **Model name**: Name of the CPU model.
- **Sockets**: Number of sockets.
- **Cores per socket**: Number of cores per socket.
- **Threads per core**: Number of threads per socket.
- **Hypervisor vendor**: Owner of the hypervisor.
- **Virtualization type**: Type of virtualization.

The information is obtained from the `lscpu` command.

## What use is this information to escalate privileges?
It is useful to know details of the CPU architecture for different attacks.

## See also
- [Kernel exploits](kernel)
- [Not signed installed kernel modules](dmesg)
- [System information](info)
- [System protections](protections)

## References
- [Manual](https://www.man7.org/linux/man-pages/man1/lscpu.1.html)