# 馃捇 Cantidad de disco usada en el sistema

## Valor devuelto
Se devuelve una tabla con informaci贸n del espacio usado en el sistema.

*Campos*:
- **FILESYSTEM**: El sistema de ficheros.
- **SIZE**: El tama帽o del sistema de ficheros (en potencias de 1024).
- **USED**: La cantidad de espacio usado (en potencias de 1024).
- **AVAIL**: La cantidad de espacio disponible (en potencias de 1024).
- **USE%**: El porcentaje de espacio usado.
- **MOUNTED ON**: D贸nde est谩 montado el sistema de ficheros.

La informaci贸n se obtiene del comando `df`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Es interesante conocer la cantidad de espacio usado y disponible. Puede dar pistas de cuanta informaci贸n contiene el sistema.

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/df.1.html)