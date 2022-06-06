# 💻 File system disk usage

## Return Value
A table is returned with information on the space used in the system.

*Fields*:
- **FILESYSTEM**: The file system.
- **SIZE**: The size of the file system (in powers of 1024).
- **USED**: The amount of space used (in powers of 1024).
- **AVAIL**: The amount of available space (in powers of 1024).
- **USE%**: The percentage of space used.
- **MOUNTED ON**: Where the file system is mounted.

The information is obtained from the `df` command.

## What use is this information to escalate privileges?
It is interesting to know the amount of space used and available. It can give clues as to how much information the system contains.

## References
- [Manual](https://www.man7.org/linux/man-pages/man1/df.1.html)