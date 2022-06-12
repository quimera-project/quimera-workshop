# 👥 All users

## Return Value
A table is returned with the different users of the system.

*Fields*:
- **USER**: User name.
- **UID**: User ID.
- **GID**: User group ID.
- **GROUPS**: Groups to which the user belongs.

The information is obtained from the `/etc/passwd` file and the `id` command.

## What use is this information to escalate privileges?
It is interesting to have a general view of all the users of the system, which are the groups of each one and how these groups are related. In turn, it may be relevant to note which groups are vulnerable to privilege escalation and which users hold root privileges.

# Which groups are of interest to escalate privileges?
You can take a look at the following link:
- [Interesting Groups](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe)

## See also
- [Current logged users](current)
- [Last logged users](last)
- [Superusers](superusers)
- [Users last logon](last_logon)
- [Users with a console](console)

## References
- [Manual (/etc/passwd)](https://www.man7.org/linux/man-pages/man5/passwd.5.html)
- [Manual (id)](https://www.man7.org/linux/man-pages/man1/id.1.html)