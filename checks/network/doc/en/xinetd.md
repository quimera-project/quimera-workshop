# 🛰️ Xinetd configuration

## Return Value
The contents of the */etc/xinetd.conf* file are returned.

## What does this file contain?
This file contains various configuration parameters for the xinetd service. These parameters affect the configuration of the service once it is started. For them to take effect again, if they are modified, the service must be restarted.

## What is Xinetd?
It is a daemon that controls and configures access to different network services. If the network service is controlled by xinetd, any request to that service is handled by xinetd. The daemon checks whether the request is approved based on the settings specified in the files (*/etc/xinetd.conf* and those under the */etc/xined.d/* directory).

## What use is this information to escalate privileges?
It is interesting to know how the xinetd service is configured when accepting requests. It can be used to broaden the knowledge of the response of the machine and to discover unexposed services.

## See also
- [Inetd configuration](inetd)
- [Xinetd files](xinetds)

## References
- [Manual](https://linux.die.net/man/5/xinetd.conf)