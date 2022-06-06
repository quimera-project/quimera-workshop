# 👥 Password policy

## Return Value
A list of different password policy key-value pairs is returned.

*Keys*:
- **PASS_MAX_DAYS**: The maximum number of days that passwords can be used.
- **PASS_MIN_DAYS**: The minimum number of days allowed to change the password.
- **PASS_WARN_AGE**: The number of days before the password is warned that it is too old.
- **ENCRYPT_METHOD**: Method by which passwords are encrypted.
- **FAKE_SHELL**: Fake shell that will be executed instead of the one determined by the /etc/passwd file.
- **FAIL_DELAY**: Seconds of delay to re-enter the password in case of failure.
- **LOGIN_RETRIES**: Maximum number of attempts to fail the password (can be overwritten by PAM).
- **LOG_UNKFAIL_ENAB**: Boolean value that determines whether the names of unknown users are logged in failed cases.

The information is obtained from the `/etc/login.defs` file.

## What use is this information to escalate privileges?
It is interesting to observe some of the exposed values.

The **PASS_WARN_AGE**, **PASS_MIN_DAYS**, and **PASS_MAX_DAYS** values ​​reveal information about users' passwords. Some may use some easy pattern to brute force.

**ENCRYPT_METHOD** can return an easy-to-crack cipher.

**FAIL_DELAY** together with **LOGIN_RETRIES** can be used when performing brute force to determine how often the attempts should be made.

**LOG_UNKFAIL_ENAB** can be useful since, if it corresponds to the "yes" value, there is the possibility that some logs include the user's clear password due to typing the password in the name by mistake.

## References
- [Manual](https://man7.org/linux/man-pages/man5/login.defs.5.html)