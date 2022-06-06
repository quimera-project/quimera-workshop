# 🗂️ SUID files

## Return Value
A table is returned with the different system files that contain the SUID permission.

*Fields*:
- **FILE**: File with SUID permission.
- **PERMISSIONS**: File permissions.
- **LINKS**: Number of links in the file.
- **USER**: User to which said file belongs (and in this case, the user whose privileges would be obtained when executing the file).
- **GROUP**: Group to which said file belongs.
- **SIZE**: File size.
- **DATE**: Date of the last modification of the file.
- **INFO**: Additional information about the file. Some will be vulnerable only in specific versions of certain operating systems, others will be common files, others will not have information and some will probably be vulnerable.

# What is SUID?
"Set User ID" in English.

It is nothing more than a type of permission which allows executing the file that contains it with the same privileges as the user to which it belongs (if said file contains execution permissions for the current user).

The clearest example is the file */bin/passwd*. This file, owned by the root user, always contains the SUID permission. This is necessary because any user who wants to change their password must store the new hash in the */etc/shadow* file. This file is only manageable by root. Thanks to the SUID permission, a random user can get root permissions only to run the /bin/passwd binary so that he can save his new password hash in */etc/shadow*.

Normally there are different binaries like the one mentioned above that usually contain this permission activated. Those that allow escalation of privileges should be found. An example is the */bin/cp* binary. If said binary allows it to be executed as root, the user will be able to copy whatever he wants with maximum privileges and thus be able to read any file and even manipulate existing files.

# How is it specified?
To make a file executable by any user with your own permissions, you must use the `chmod u+s [file]` or `chmod 4755 [file]` command.

If such a file contains the SUID permission, it will be specified in the output of the `ls -l [file]` command.
```bash
# Example output of "ls -l /bin/passwd" command
-rwsr-xr-x 1 root root 63960 Feb 7 2020 /bin/passwd
```

It can be seen how this file contains the 's' flag in the user's execution permission. Therefore, when said binary is executed, it will be executed with the permissions of the user it belongs to, in this case root.

It is interesting to differentiate the 's' flag, which implies the SUID permission as well as the execution permission, and the 'S' flag, which indicates that only the SUID permission is activated and not the execution permission.

# How do I find files with SUID?
Using the find command, there are two ways:
```bash
find / -type f -perm -4000 2>/dev/null
find / -type f -perm -u=s 2>/dev/null
```

# Which ones are of interest to escalate privileges?
You can take a look at the following list:
- [GFTOBINS](https://gtfobins.github.io/#+suid)

# See also
- [SGID files](SGID)

# References
- [Hacking Articles](https://www.hackingarticles.in/linux-privilege-escalation-using-suid-binaries/)
- [Linux Handbook](https://linuxhandbook.com/suid-sgid-sticky-bit/)