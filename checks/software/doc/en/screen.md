# 🧪 Screen sessions

## Return Value
A list of key-value pairs with the different open sessions of screen is returned.

The information is obtained from the `screen` command.

## What use is this information to escalate privileges?
It is interesting to observe if there are open screen sessions in such a way that another type of shell or other information can be obtained, thus expanding the range of attack and exposure.

## See also
- [Tmux sessions](tmux)

## References
- [Manual](https://www.man7.org/linux/man-pages/man1/screen.1.html)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-exploiting-shell-sessions/)