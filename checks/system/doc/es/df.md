# 💻 Cantidad de disco usada en el sistema

## Valor devuelto
Se devuelve una tabla con información del espacio usado en el sistema.

*Campos*:
- **FILESYSTEM**: El sistema de ficheros.
- **SIZE**: El tamaño del sistema de ficheros (en potencias de 1024).
- **USED**: La cantidad de espacio usado (en potencias de 1024).
- **AVAIL**: La cantidad de espacio disponible (en potencias de 1024).
- **USE%**: El porcentaje de espacio usado.
- **MOUNTED ON**: Dónde está montado el sistema de ficheros.

La información se obtiene del comando `df`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer la cantidad de espacio usado y disponible. Puede dar pistas de cuanta información contiene el sistema.

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/df.1.html)