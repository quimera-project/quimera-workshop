# 💻 Información sobre la CPU

## Valor devuelto
Se devuelve una lista con pares clave-valor de diferentes características de la CPU.

*Campos*:
- **Architecture**: Tipo de arquitectura de la CPU.
- **Byte order**: Orden de los bytes almacenados (Little endian o Big endian).
- **CPU op-modes**: Modos de ejecución de la CPU.
- **Model name**: Nombre del modelo de la CPU.
- **Sockets**: Número de sockets.
- **Cores per socket**: Número de núcleos por cada socket.
- **Threads per core**: Número de hilos por cada socket.
- **Hypervisor vendor**: Propietario del hipervisor.
- **Virtualization type**: Tipo de virtualización.

La información se obtiene del comando `lscpu`.

## ¿De qué sirve esta información para escalar privilegios?
Es de utilidad conocer detalles de la arquitectura de la CPU para diferentes ataques.

## Ver también
- [Kernel exploits](kernel)
- [Not signed installed kernel modules](dmesg)
- [System information](info)
- [System protections](protections)

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/lscpu.1.html)