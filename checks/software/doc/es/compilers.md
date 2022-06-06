# 🧪 Compiladores y decompiladores

## Valor devuelto
Se devuelve una tabla con los compiladores y decompiladores instalados en el sistema.

*Campos*:
- **NAME**: Nombre del compilador o decompilador.
- **VERSION**: Versión del compilador o decompilador.
- **ARCHITECTURE**: Arquitectura del compilador o decompilador.
- **DESCRIPTION**: Descripción del compilador o decompilador.

La información se obtiene del comando `dpkg`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer qué tipo de compiladores y decompiladores se encuentran instalados en el sistema de tal forma que permitan compilar o decompilar ciertos programas de distintos lenguajes de programación.

## Ver también
- [Interesting software available](interesting)

## Referencias
- [Manual](https://man7.org/linux/man-pages/man1/dpkg.1.html)