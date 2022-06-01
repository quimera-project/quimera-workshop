# 🛰️ Interfaces

## Valor devuelto
Se devuelve una tabla con las diferentes rutas IP.

*Campos*:
- **INTERFACE**: Interfaz de red.
- **STATE**: Estado de la interfaz.
- **FLAGS**: Flags de la interfaz (UP, LOOPBACK, BROADCAST, POINTOPOINT, MULTICAST, PROMISC, ALLMULTI, NOARP, DYNAMIC, SLAVE). Mirar los links en referencias.
- **LINK**: Enlace correspondiente.
- **LINK ADDR**: Dirección del enlace.
- **LINK BRD**: Dirección de broadcast.
- **IPv4 ADDR**: Dirección IPv4.
- **IPv4 BRD**: Dirección de broadcast IPv4.
- **IPv6 ADDR**: Dirección IPv6.

La información se obtiene del comando `ip a list`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante tener una vista general de todas las interfaces. Pueden existir algunas que permitan pivotar a otras redes o descubrir nuevos hosts, ampliando de esta manera el rango de exposición y con ello, el de ataque.

## Ver también
- [Active ports](ports)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)
- [Neighbours](neighbours)

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man8/ip-address.8.html)
- [Output(1)](http://linux-ip.net/gl/ip-cref/ip-cref-node17.html)
- [Output(2)](http://linux-ip.net/gl/ip-cref/ip-cref-node34.html)
- [Pivoting](https://blog.raw.pm/en/state-of-the-art-of-network-pivoting-in-2019/)