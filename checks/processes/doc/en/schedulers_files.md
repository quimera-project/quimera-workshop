# 📟 Task scheduler files

## Return Value
A table with the different scheduled task files is returned.

*Fields*:
- **FILE**: File of scheduled tasks.
- **PERMISSIONS**: File permissions.
- **LINKS**: Number of links in the file.
- **USER**: User to which the file belongs.
- **GROUP**: Group to which said file belongs.
- **SIZE**: File size.
- **DATE**: Date of the last modification of the file.

## What use is this information to escalate privileges?
It is interesting to know if any of these files contain write permissions. In this way an attacker could take advantage to write malicious actions executed on behalf of another user.

## See also
- [Scheduler jobs](jobs)
- [Task scheduler tools](schedulers)

## References
- [Cron jobs tutorial](https://www.hostinger.com/tutorials/cron-job)
- [Manual (Anacron)](https://www.man7.org/linux/man-pages/man8/anacron.8.html)
- [Manual (At)](https://linux.die.net/man/1/at)
- [Manual (Cron)](https://www.man7.org/linux/man-pages/man8/cron.8.html)
- [Manual (Crontab)](https://www.man7.org/linux/man-pages/man5/crontab.5.html)
- [Manual (Incron)](https://linux.die.net/man/5/incrontab)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-scheduled-tasks/)