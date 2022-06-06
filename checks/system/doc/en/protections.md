# 💻 System Protections

## Return Value
A list with answers to questions about system protections is returned.

*Questions*:
**Is SELinux enabled?**: Returns whether the SELinux security module is enabled. It can return what mode it is enabled in.
**Is AppArmor enabled?**: Returns whether the AppArmor security module is enabled. Although not enabled, it can be returned if certain profiles have been found.
**Is ASLR enabled?**:
**Is Execshield enabled?**:
**Is Grsecurity present?**:
**Are PaX binaries present?**:

## What is SELinux?
SELinux is a Linux security module that performs the function of **MAC** (Mandatory Access Control System). This control system complements the traditional Linux **DAC** (Discretionary Access Control System) system. For each system call made, SELinux is in charge of deciding if the corresponding process is authorized to carry out said action. To make this decision, each process contains a security context. This context depends on the user who launches said process, his role and his domain. To find out the security context of a process, you can use the **z** flag of the **ps** command.

```bash
# Example output of "ps axZ | grep vstfpd" command
# The first field contains the identity, role, domain, and MCS level separated by a colon.
system_u:system_r:ftpd_t:s0 2094 ? ss 0:00 /usr/sbin/vsftpd
```

## What is AppArmor?
AppArmor is a Linux security module that performs the function of **MAC** (Mandatory Access Control System). This control system complements the traditional Linux **DAC** (Discretionary Access Control System) system. For each system call made, AppArmor is responsible for deciding whether the corresponding process is authorized to perform that action. To make this decision, each process will have a series of rules collected in a profile (MAC) applied by the kernel. Profile settings are located in the */etc/apparmor.d* folder.

## What is ASRL?
ASRL is a protection that allows to protect the system against certain **Buffer Overflow** attacks.

# References
- [AppArmor](https://apparmor.net/)
- [Debian Handbook AppArmor](https://debian-handbook.info/browse/stable/sect.apparmor.html)
- [Debian Handbook SELinux](https://debian-handbook.info/browse/stable/sect.selinux.html)
- [SELinux](https://selinuxproject.org/page/Main_Page)