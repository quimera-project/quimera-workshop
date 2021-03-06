# 馃捇 Informaci贸n del sistema

## Valor devuelto
Se devuelve una lista con pares clave-valor de diferentes caracter铆sticas del sistema.

*Campos*:
- **Datetime**: Fecha actual del sistema.
- **Uptime**: Cantidad de tiempo que el sistema lleva encendido.
- **Distributor ID**: ID del distribuidor del sistema operativo.
- **Description**: Nombre completo del sistema operativo.
- **Release**: Versi贸n del sistema operativo.
- **Codename**: Nombre de la versi贸n del sistema operativo.
- **Kernel version**: Versi贸n del kernel.
- **Sudo version**: Versi贸n de sudo.

La informaci贸n se obtiene del comando `lsb_release`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Ciertos campos aportan informaci贸n contextual del sistema como Datetime y Uptime. Sin embargo, conocer sobre qu茅 sistema operativo se est谩 trabajando junto con su versi贸n y las versiones del kernel y de sudo pueden desvelar sistemas no actualizados con versiones vulnerables a ciertos ataques dirigidos a estos puntos.

## Ver tambi茅n
- [CPU information](cpu)
- [Kernel exploits](kernel)
- [Not signed installed kernel modules](dmesg)
- [System protections](protections)

## Referencias
- [Manual](https://linux.die.net/man/1/lsb_release)
- [SUDO - LiveOverflow](https://www.youtube.com/watch?v=TLa2VqcGGEQ&list=PLhixgUqwRTjy0gMuT4C3bmjeZjuNQyqdx)
