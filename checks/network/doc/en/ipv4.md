# 🛰️ IPv4 hosts

## Return Value
A table is returned with the different version 4 IPs and their corresponding aliases.

*Fields*:
- **IP**: destination IP.
- **ALIASES**: Different aliases for that IP.

The information is obtained from the `/etc/hosts` file.

## What use is this information to escalate privileges?
It is interesting to have an overview of the different redirected IPs depending on which alias. An attacker could take advantage of this information to extend their attack range and exposure.

## See also
- [Active ports](ports)
- [Interfaces](interfaces)
- [IPv6 hosts](ipv6)
- [Neighbours](neighbors)

## References
- [Manual](https://man7.org/linux/man-pages/man5/hosts.5.html)