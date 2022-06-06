# 🛰️ Hostnames

## Return Value
A list of key-value pairs of host names on the network is returned.

*Fields*:
- **Hostname**: Computer name.
- **NIS/YP domain name**: Name of the network information system.
- **DNS domain name**: DNS domain name.

## What use is this information to escalate privileges?
It is interesting to know what names the current equipment has in order to be able to relate it correctly in logs or other information.

## References
- [Manual](https://man7.org/linux/man-pages/man1/hostname.1.html)