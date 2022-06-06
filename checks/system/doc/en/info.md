# 💻 System information

## Return Value
A list with key-value pairs of different characteristics of the system is returned.

*Fields*:
- **Datetime**: Current system date.
- **Uptime**: Amount of time the system has been on.
- **Distributor ID**: ID of the operating system distributor.
- **Description**: Full name of the operating system.
- **Release**: Version of the operating system.
- **Codename**: Name of the operating system version.
- **Kernel version**: Kernel version.
- **sudo version**: Sudo version.

The information is obtained from the `lsb_release` command.

## What use is this information to escalate privileges?
Certain fields provide contextual information about the system such as Datetime and Uptime. However, knowing what operating system you are working on along with its version and kernel and sudo versions can reveal outdated systems with versions vulnerable to certain attacks targeting these points.

## See also
- [CPU information](cpu)
- [Kernel exploits](kernel)
- [Not signed installed kernel modules](dmesg)
- [System protections](protections)

## References
- [Manual](https://linux.die.net/man/1/lsb_release)
- [SUDO - LiveOverflow](https://www.youtube.com/watch?v=TLa2VqcGGEQ&list=PLhixgUqwRTjy0gMuT4C3bmjeZjuNQyqdx)