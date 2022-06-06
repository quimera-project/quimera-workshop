# 🛰️ Inetd configuration

## Return Value
A table with the inetd daemon configurations is returned.

*Fields*:
- **SERVICE**: Name of the service.
- **TYPE**: Type of socket associated with that service.
- **PROTOCOL**: Protocol that receives the socket.
- **WAIT**: Indicates whether the requests should be attended to in multithreaded (nowait) or unithreaded (wait) form.
- **USER**: Name of the user under which the program that attends the service will be executed.
- **PROGRAM**: Path of the program to execute.
- **PARAMS**: Parameters of the program to execute.

The information is obtained from the `/etc/inetd.conf` file.

## What does this file contain?
This file contains the configuration for the inetd service. This configuration will be in charge of choosing which programs to execute given the characteristics of the request received.

## What is Inetd?
Commonly known as the "network super server". It is a daemon in charge of choosing which services to offer when a connection is received with certain specific characteristics specified in the */etc/inetd.conf* file.

## What use is this information to escalate privileges?
It is interesting to know how the inetd daemon is configured when accepting requests according to which protocol, service and type of socket. It can be used to broaden the knowledge of the response of the machine and to discover unexposed services.

## See also
- [Xinetd configuration](xinetd)
- [Xinetd files](xinetds)

## References
- [Manual](https://nxmnpg.lemoda.net/5/inetd.conf)