# 馃摕 Procesos con permisos de escritura y ejecuci贸n en algunas zonas de memoria

## Valor devuelto
Se devuelve una tabla con aquellos procesos en los que alguna direcci贸n tiene permisos de escritura y ejecuci贸n a la vez.

*Campos*:
- **PID**: ID del proceso.
- **NAME**: Nombre del proceso.
- **LINE N潞**: L铆nea en el archivo maps donde se encuentra dicha direcci贸n.
- **ADDRESS**: Direcci贸n en concreto que permite escritura y ejecuci贸n a la vez.
- **PERMS**: Permisos de la direcci贸n.
- **OFFSET**: El desplazamiento en el archivo.
- **DEV**: El dispositivo (mayor:menor).
- **INODE**: El inodo en el dispositivo.
- **PATHNAME**: Suele ser el archivo correspondiente a dicho proceso.

La informaci贸n se obtiene del archivo `/proc/<process>/maps`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Es interesante analizar aquellos procesos que contengan direcciones con ambos permisos pues pueden permitir realizar ataques ROP. 

## Ver tambi茅n
- [Processes which UIDs or GIDs are not the same](xid)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man5/proc.5.html)
