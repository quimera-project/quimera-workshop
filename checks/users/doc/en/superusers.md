# 👥 Last logged users

## Return Value
A table of users with root privileges is returned.

*Fields*:
- **USERNAME**: User name.
- **PASSWORD**: User password (should not be different from x since it must be in another file).
- **UID**: User ID.
- **GID**: User group ID.
- **FULLNAME**: Full name of the user.
- **HOME**: User's personal directory.
- **LOGIN SHELL**: User's main shell.

The information is obtained from the `/etc/passwd` file.

## What use is this information to escalate privileges?
It is interesting to note which users have root privileges. There may be different users other than the "root" user itself that have these privileges. It is advisable to collect information on these users as they can be a good target for root permissions.

## See also
- [All users](all)
- [Current logged users](current)
- [Last logged users](last)
- [Users last logon](last_logon)
- [Users with a console](console)


## References
- [Manual](https://www.man7.org/linux/man-pages/man5/passwd.5.html)