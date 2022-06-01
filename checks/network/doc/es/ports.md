# 🛰️ Active ports

## Valor devuelto
Se devuelve una tabla con los diferentes puertos abiertos del sistema.

*Campos*:
- **PROTOCOL**: Protocolo que usa el puerto.
- **LOCAL ADDRESS**: Dirección y puerto local.
- **FOREIGN ADDRESS**: Dirección y puerto remota.
- **STATE**: Estado del puerto (LISTEN siempre).
- **PID**: ID del proceso que corre en dicho puerto junto con el nombre del programa.

La información se obtiene del comando `netstat`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer los puertos abiertos. Pueden existir puertos abiertos únicamente de forma interna, no visibles al exterior, que puedan contener procesos vulnerables y de los cuales se pueda aprovechar el atacante.

## Ver también
- [Interfaces](interfaces)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)
- [Neighbours](neighbours)

## Referencias
- [Manual](https://linux.die.net/man/8/netstat)