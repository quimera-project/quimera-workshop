# 💻 PATH

## Return Value
A table is returned with the different directories of the user's PATH.

*Fields*:
- **LOCATION**: Directory in the PATH.
- **PERMISSIONS**: Directory permissions.
- **USER**: User to which said directory belongs.
- **GROUP**: Group to which said directory belongs.

The information is obtained from the `PATH` variable.

## What use is this information to escalate privileges?
If any directory found in the PATH variable has write permissions, an attacker could take advantage of it to try to inject malicious libraries and/or binaries.

## References
- [HackingArticles](https://www.hackingarticles.in/linux-privilege-escalation-using-path-variable/)