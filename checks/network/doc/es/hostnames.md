# 🛰️ Nombres de la máquina

## Valor devuelto
Se devuelve una lista con pares clave-valor con los nombres del host en la red.

*Campos*:
- **Hostname**: Nombre del equipo.
- **NIS/YP domain name**: Nombre del sistema de información de red.
- **DNS domain name**: Nombre del dominio DNS.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer qué nombres posee el equipo actual para poder relacionarlo correctamente en logs u otra información.

## Referencias
- [Manual](https://man7.org/linux/man-pages/man1/hostname.1.html)