# 馃懃 脷ltimo inicio de sesi贸n de los usuarios

## Valor devuelto
Se devuelve una tabla con los 煤ltimos usuarios que han entrado al sistema.

*Campos*:
- **USER**: Nombre del usuario.
- **TTY**: Nombre de la terminal usada por el usuario.
- **IP**: IP desde la que se conect贸 el usuario.
- **DATE**: Fecha de la conexi贸n.

La informaci贸n se obtiene del comando `last`.

## 驴De qu茅 sirve esta informaci贸n para escalar privilegios?
Puede ser interesante observar qu茅 usuarios son los 煤ltimos que se han conectado de tal forma que se pueda buscar por aquellas modificaciones realicadas por estos (nuevos ficheros, carpetas, modificaciones, etc).


## Ver tambi茅n
- [All users](all)
- [Current logged users](current)
- [Superusers](superusers)
- [Users last logon](last_logon)
- [Users with a console](console)


## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/last.1.html)