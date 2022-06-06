# 🛰️ Interfaces

## Return Value
A table with the different IP interfaces is returned.

*Fields*:
- **INTERFACE**: Network interface.
- **STATE**: Interface state.
- **FLAGS**: Interface flags (UP, LOOPBACK, BROADCAST, POINTOPOINT, MULTICAST, PROMISC, ALLMULTI, NOARP, DYNAMIC, SLAVE). See the links in references.
- **LINK**: Corresponding link.
- **LINK ADDR**: Link address.
- **LINK BRD**: Broadcast address.
- **IPv4 ADDR**: IPv4 address.
- **IPv4 BRD**: IPv4 broadcast address.
- **IPv6 ADDR**: IPv6 address.

The information is obtained from the `ip a list` command.

## What use is this information to escalate privileges?
It is interesting to have an overview of all interfaces. There may be some that allow pivoting to other networks or discovering new hosts, thus expanding the range of exposure and with it, the range of attack.

## See also
- [Active ports](ports)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)
- [Neighbours](neighbors)

## References
- [Manual](https://www.man7.org/linux/man-pages/man8/ip-address.8.html)
- [Output(1)](http://linux-ip.net/gl/ip-cref/ip-cref-node17.html)
- [Output(2)](http://linux-ip.net/gl/ip-cref/ip-cref-node34.html)
- [Pivoting](https://blog.raw.pm/en/state-of-the-art-of-network-pivoting-in-2019/)