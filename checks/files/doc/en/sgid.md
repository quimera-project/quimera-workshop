# 🗂️ SGID Files

## Return Value
A table is returned with the different system files that contain the SGID permission.

*Fields*:
- **FILE**: File with SGID permission.
- **PERMISSIONS**: File permissions.
- **LINKS**: Number of links in the file.
- **USER**: User to which the file belongs.
- **GROUP**: Group to which said file belongs (and in this case, the group whose privileges would be obtained when executing the file).
- **SIZE**: File size.
- **DATE**: Date of the last modification of the file.
- **INFO**: Additional information about the file. Some will be vulnerable only on specific versions of certain operating systems, others will be common files, others will have no information, and some will be demonstrably vulnerable.

## What is SGID?
"Set Group ID" in English.

SGID permission, unlike SUID, affects both files and folders. When it comes to a file, it is equivalent to the SUID permission: if said file is executed, it will do so with the permissions equivalent to the corresponding group. However, if it is a folder, all the files created in that folder will be created with the group belonging to the SGID of the folder, regardless of the group of the user who creates said file.

## How is it specified?
To make a file executable by any group with its own permissions, use the `chmod g+s [file]` or `chmod 2755 [file]` command.

If such a file contains the SGID permission, it will be specified in the output of the `ls -l [file]` command.
```bash
# Example output of "ls -l /usr/bin/crontab" command
-rwxr-sr-x 1 root crontab 43568 Feb 22, 2021 /usr/bin/crontab
```

It is observed how said file contains the letter 's' in the execution permission of the group. Therefore, when said binary is executed, it will be executed with permissions of the group to which it belongs, in this case crontab.

It is interesting to differentiate between the 's' flag, which implies the SUID permission as well as the execute permission, and the 'S' flag, which indicates that only the SUID permission is activated and not the execute permission.

## How to find files with SGID?
Using the find command, there are two ways:
```bash
find / -perm -2000 2>/dev/null
find / -perm -g=s 2>/dev/null
```

## What are they interested in to escalate privileges?
You can take a look at the following list:
- [GFTOBINS](https://gtfobins.github.io/#+suid)

## View also
- [SUID Files](SUID)

## References
- [Hacking Articles](https://www.hackingarticles.in/linux-privilege-escalation-using-suid-binaries/)
- [Linux Handbook](https://linuxhandbook.com/suid-sgid-sticky-bit/)
- [Cyber ​​Sophia](https://cybersophia.net/training/special-permissions-in-linux)