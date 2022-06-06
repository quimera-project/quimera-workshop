# 🛰️ Hosts IPv6

## Valor devuelto
Se devuelve una tabla con las diferentes IPs versión 6 y sus correspondientes alias.

*Campos*:
- **IP**: IP destino.
- **ALIASES**: Diferentes alias para esa ip.

La información se obtiene del archivo `/etc/hosts`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante tener una vista general de las diferentes IPs redirigidas según qué alias. Un atacante podría aprovechar esta información para ampliar su rango de ataque y exposición.

## Ver también
- [Active ports](ports)
- [Interfaces](interfaces)
- [IPv4 hosts](ipv4)
- [Neighbours](neighbours)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man5/hosts.5.html)