# 💻 Información del sistema

## Valor devuelto
Se devuelve una lista con pares clave-valor de diferentes características del sistema.

*Campos*:
- **Datetime**: Fecha actual del sistema.
- **Uptime**: Cantidad de tiempo que el sistema lleva encendido.
- **Distributor ID**: ID del distribuidor del sistema operativo.
- **Description**: Nombre completo del sistema operativo.
- **Release**: Versión del sistema operativo.
- **Codename**: Nombre de la versión del sistema operativo.
- **Kernel version**: Versión del kernel.
- **Sudo version**: Versión de sudo.

La información se obtiene del comando `lsb_release`.

## ¿De qué sirve esta información para escalar privilegios?
Ciertos campos aportan información contextual del sistema como Datetime y Uptime. Sin embargo, conocer sobre qué sistema operativo se está trabajando junto con su versión y las versiones del kernel y de sudo pueden desvelar sistemas no actualizados con versiones vulnerables a ciertos ataques dirigidos a estos puntos.

## Ver también
- [CPU information](cpu)
- [Kernel exploits](kernel)
- [Not signed installed kernel modules](dmesg)
- [System protections](protections)

## Referencias
- [Manual](https://linux.die.net/man/1/lsb_release)
- [SUDO - LiveOverflow](https://www.youtube.com/watch?v=TLa2VqcGGEQ&list=PLhixgUqwRTjy0gMuT4C3bmjeZjuNQyqdx)
