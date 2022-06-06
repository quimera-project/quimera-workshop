# 📟 Processes which UIDs or GIDs are not the same

## Return Value
A table is returned with those processes in which some of the following IDs are different:
- **Real User ID** (Real UID).
- **Effective User ID** (Effective UID).
- **User Saved Set ID** (Saved UID Set).
- **ID of the user file system** (Filesystem UID).
- **Real group ID** (Real GID).
- **Effective Group ID** (Effective GID).
- **Group Save Set ID** (GID of the save set).
- **Group file system ID** (Filesystem GID).

*Countryside*:
- **PID**: Process ID.
- **NAME**: Name of the process.
- **STATUS**: Status of the process.
- **ID TYPE**: ID type changed.
- **REAL ID**: real ID.
- **EFFECTIVE DNI**: effective DNI.
- **SAVED SET ID**: ID of the saved set.
- **FILESYSTEM ID**: ID of the file system.

The information is obtained from the `/proc/<process>/state` file.

## What use is this information to escalate privileges?
It is interesting to observe during the life of the processes, which IDs change. This may imply that the same process launched by one user can obtain the permissions of another.

##View also
- [Processes with write and execute permissions at some addresses](wx)

## References
- [Manual](https://man7.org/linux/man-pages/man5/proc.5.html)