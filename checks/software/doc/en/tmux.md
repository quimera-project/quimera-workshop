# 🧪 Tmux sessions

## Return Value
A list of key-value pairs with the different open sessions of tmux is returned.

The information is obtained from the `tmux` command.

## What use is this information to escalate privileges?
It is interesting to observe if there are open tmux sessions in such a way that another type of shell or other information can be obtained, thus expanding the range of attack and exposure.

## See also
- [Screen sessions](screen)

## References
- [Hacking Articles](https://www.hackingarticles.in/linux-for-pentester-tmux-privilege-escalation/)
- [Manual](https://www.man7.org/linux/man-pages/man1/tmux.1.html)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-exploiting-shell-sessions/)