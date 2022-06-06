# 🛰️ Neighbors

## Return Value
A table with the different IP routes is returned.

*Fields*:
- **INTERFACE**: Interface to which the packets for this route will be sent.
- **DESTINATION**: The host or destination address.
- **GATEWAY**: The gateway ('*' if none).
- **GENMASK**: The netmask for the destination network ('255.255.255.255' for a destination host and '0.0.0.0' for the default route)
- **FLAGS**: Different options (U: route is available; H: recipient is a host; G: use gateway; R: reset route for dynamic routing; D: installed dynamically by daemon or redirection; M: modified from the routing or redirection daemon; !: route rejected).
- **HOPS**: The distance in hops to the recipient.

The information is obtained from the `route` command.

## What use is this information to escalate privileges?
It is interesting to have an overview of all existing routes; which hosts can be reached from which route.

## See also
- [Active ports](ports)
- [Interfaces](interfaces)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)

## References
- [Manual](https://www.man7.org/linux/man-pages/man8/route.8.html)
- [Flags 1](https://github.com/giftnuss/net-tools/blob/master/lib/inet_gr.c)
- [Flags 2](https://github.com/giftnuss/net-tools/blob/master/lib/net-support.h)