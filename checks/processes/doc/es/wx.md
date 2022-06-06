# 📟 Procesos con permisos de escritura y ejecución en algunas zonas de memoria

## Valor devuelto
Se devuelve una tabla con aquellos procesos en los que alguna dirección tiene permisos de escritura y ejecución a la vez.

*Campos*:
- **PID**: ID del proceso.
- **NAME**: Nombre del proceso.
- **LINE Nº**: Línea en el archivo maps donde se encuentra dicha dirección.
- **ADDRESS**: Dirección en concreto que permite escritura y ejecución a la vez.
- **PERMS**: Permisos de la dirección.
- **OFFSET**: El desplazamiento en el archivo.
- **DEV**: El dispositivo (mayor:menor).
- **INODE**: El inodo en el dispositivo.
- **PATHNAME**: Suele ser el archivo correspondiente a dicho proceso.

La información se obtiene del archivo `/proc/<process>/maps`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante analizar aquellos procesos que contengan direcciones con ambos permisos pues pueden permitir realizar ataques ROP. 

## Ver también
- [Processes which UIDs or GIDs are not the same](xid)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man5/proc.5.html)
