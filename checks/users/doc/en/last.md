# 👥 Last logged users

## Return Value
A table is returned with the last users who have entered the system.

*Fields*:
- **USER**: User name.
- **TTY**: Name of the terminal used by the user.
- **IP**: IP from which the user connected.
- **DATE**: Date of the connection.

The information is obtained from the `last` command.

## What use is this information to escalate privileges?
It may be interesting to observe which users are the last to have connected in such a way that it can be searched for those modifications made by them (new files, folders, modifications, etc).


## See also
- [All users](all)
- [Current logged users](current)
- [Superusers](superusers)
- [Users last logon](last_logon)
- [Users with a console](console)


## References
- [Manual](https://www.man7.org/linux/man-pages/man1/last.1.html)