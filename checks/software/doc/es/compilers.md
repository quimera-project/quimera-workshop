# 馃И Compiladores y decompiladores

## Valor devuelto
Se devuelve una tabla con los compiladores y decompiladores instalados en el sistema.

*Campos*:
- **NAME**: Nombre del compilador o decompilador.
- **VERSION**: Versi贸n del compilador o decompilador.
- **ARCHITECTURE**: Arquitectura del compilador o decompilador.
- **DESCRIPTION**: Descripci贸n del compilador o decompilador.

La informaci贸n se obtiene del comando `dpkg`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Es interesante conocer qu茅 tipo de compiladores y decompiladores se encuentran instalados en el sistema de tal forma que permitan compilar o decompilar ciertos programas de distintos lenguajes de programaci贸n.

## Ver tambi茅n
- [Interesting software available](interesting)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man1/dpkg.1.html)