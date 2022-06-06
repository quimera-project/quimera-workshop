# 💻 Kernel exploits

## Return Value
A table of exploits available for the current kernel is returned.

*Fields*:
- **NAME**: Name of the exploit.
- **CVE**: CVE of said exploit.
- **EXPLOIT**: Url of the exploit.
- **USER**: User to whom the exploit is attributed.

The information is obtained from the `linux exploit suggester 2` tool.

## What use is this information to escalate privileges?
It is interesting to know the kernel exploits in order to be able to exploit them and achieve escalation of privileges.

## References
- [Linux Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2)