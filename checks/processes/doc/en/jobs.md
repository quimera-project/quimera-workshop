# 📟 Scheduler jobs

## Return Value
A list with the contents of the files with scheduled tasks is returned.

## What use is this information to escalate privileges?
It is interesting to know the scheduled tasks in order to observe if any of them is vulnerable or if it reveals information that can extend the range of attack and exposure.

## See also
- [Task scheduler files](scheduler_files)
- [Task scheduler tools](schedulers)

## References
- [Cron jobs tutorial](https://www.hostinger.com/tutorials/cron-job)
- [Manual (Anacron)](https://www.man7.org/linux/man-pages/man8/anacron.8.html)
- [Manual (At)](https://linux.die.net/man/1/at)
- [Manual (Cron)](https://www.man7.org/linux/man-pages/man8/cron.8.html)
- [Manual (Crontab)](https://www.man7.org/linux/man-pages/man5/crontab.5.html)
- [Manual (Incron)](https://linux.die.net/man/5/incrontab)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-scheduled-tasks/)