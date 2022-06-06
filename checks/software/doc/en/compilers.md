# 🧪 Compilers and decompilers

## Return Value
A table is returned with the compilers and decompilers installed on the system.

*Fields*:
- **NAME**: Name of the compiler or decompiler.
- **VERSION**: Version of the compiler or decompiler.
- **ARCHITECTURE**: Architecture of the compiler or decompiler.
- **DESCRIPTION**: Description of the compiler or decompiler.

The information is obtained from the `dpkg` command.

## What use is this information to escalate privileges?
It is interesting to know what kind of compilers and decompilers are installed in the system in such a way that they allow certain programs of different programming languages to be compiled or decompiled.

## See also
- [Interesting software available](interesting)

## References
- [Manual](https://man7.org/linux/man-pages/man1/dpkg.1.html)