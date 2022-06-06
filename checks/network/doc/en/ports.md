# 🛰️ Activate ports

## Return Value
A table with the different open ports of the system is returned.

*Fields*:
- **PROTOCOL**: Protocol used by the port.
- **LOCAL ADDRESS**: Local address and port.
- **FOREIGN ADDRESS**: Remote address and port.
- **STATE**: State of the port (LISTEN always).
- **PID**: ID of the process running on that port along with the name of the program.

The information is obtained from the `netstat` command.

## What use is this information to escalate privileges?
It is interesting to know the open ports. There may be ports open only internally, not visible to the outside, which may contain vulnerable processes and which the attacker can take advantage of.

## See also
- [Interfaces](interfaces)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)
- [Neighbours](neighbors)

## References
- [Manual](https://linux.die.net/man/8/netstat)