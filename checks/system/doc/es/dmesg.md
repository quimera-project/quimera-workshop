# 💻 Not signed installed kernel modules

## Valor devuelto
Se devuelve una tabla con los módulos de kernel no firmados.

*Campos*:
- **DATE**: Fecha del log.
- **MODULE**: Módulo no firmado.
- **INFO**: Información de la firma del módulo.

La información se obtiene del comando `dmesg`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer la existencia de módulos de kernel no firmados. Un atacante podría explotar dichos módulos y conseguir escalar privilegios.

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/dmesg.1.html)
