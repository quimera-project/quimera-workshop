# 📟 Procesos cuyos UIDs o GIDs no son iguales

## Valor devuelto
Se devuelve una tabla con aquellos procesos en los que algunos de los siguientes IDs sea distinto:
- **ID real de usuario** (Real UID).
- **ID efectivo de usuario** (Effective UID).
- **ID del conjunto guardado de usuario** (Saved set UID).
- **ID del sistema de archivos de usuario** (Filesystem UID).
- **ID real de grupo** (Real GID).
- **ID efectivo de grupo** (Effective GID).
- **ID del conjunto guardado de grupo** (Saved set GID).
- **ID del sistema de archivos de grupo** (Filesystem GID).

*Campos*:
- **PID**: ID del proceso.
- **NAME**: Nombre del proceso.
- **STATE**: Estado del proceso.
- **TYPE OF ID**: Tipo de ID cambiado.
- **REAL ID**: ID real.
- **EFFECTIVE ID**: ID efectivo.
- **SAVED SET ID**: ID del conjunto guardado.
- **FILESYSTEM ID**: ID del sistema de archivos.

La información se obtiene del archivo `/proc/<process>/state`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante observar durante la vida de los procesos, cuales cambian de IDs. Esto puede implicar que el mismo proceso lanzado por un usuario, puede conseguir los permisos de otro.

## Ver también
- [Processes with write and execute permisions in some addresses](wx)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man5/proc.5.html)
