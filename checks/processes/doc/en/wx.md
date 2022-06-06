# 📟 Processes with write and execute permissions in some addresses

## Return Value
A table is returned with those processes in which some address has write and execute permissions at the same time.

*Fields*:
- **PID**: Process ID.
- **NAME**: Name of the process.
- **LINE Nº**: Line in the maps file where said address is found.
- **ADDRESS**: Specific address that allows writing and execution at the same time.
- **PERMS**: Management permissions.
- **OFFSET**: The offset in the file.
- **DEV**: The device (major:minor).
- **INODE**: The inode on the device.
- **PATHNAME**: It is usually the file corresponding to said process.

The information is obtained from the `/proc/<process>/maps` file.

## What use is this information to escalate privileges?
It is interesting to analyze those processes that contain addresses with both permissions as they can allow ROP attacks to be carried out.

## See also
- [Processes which UIDs or GIDs are not the same](xid)

## References
- [Manual](https://man7.org/linux/man-pages/man5/proc.5.html)