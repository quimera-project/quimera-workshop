# 馃捇 M贸dulos de kernel instalados sin firmar

## Valor devuelto
Se devuelve una tabla con los m贸dulos de kernel no firmados.

*Campos*:
- **DATE**: Fecha del log.
- **MODULE**: M贸dulo no firmado.
- **INFO**: Informaci贸n de la firma del m贸dulo.

La informaci贸n se obtiene del comando `dmesg`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Es interesante conocer la existencia de m贸dulos de kernel no firmados. Un atacante podr铆a explotar dichos m贸dulos y conseguir escalar privilegios.

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/dmesg.1.html)
