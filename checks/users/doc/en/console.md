# 👥 Users with a console

## Return Value
A table with users containing a shell is returned.

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
It is interesting to note which users contain a shell. These may contain critical information that allows escalation of privileges. It may be these users to whom the attack should be directed.

## See also
- [All users](all)
- [Current logged users](current)
- [Last logged users](last)
- [Superusers](superusers)
- [Users last logon](last_logon)

## References
- [Manual](https://www.man7.org/linux/man-pages/man5/passwd.5.html)