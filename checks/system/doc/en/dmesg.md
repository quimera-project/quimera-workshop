# 💻 Not signed installed kernel modules

## Return Value
A table of unsigned kernel modules is returned.

*Fields*:
- **DATE**: Date of the log.
- **MODULE**: Unsigned module.
- **INFO**: Module signature information.

The information is obtained from the `dmesg` command.

## What use is this information to escalate privileges?
It is interesting to know about the existence of unsigned kernel modules. An attacker could exploit such modules and gain privilege escalation.

## References
- [Manual](https://www.man7.org/linux/man-pages/man1/dmesg.1.html)