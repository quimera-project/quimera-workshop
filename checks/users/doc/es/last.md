# 👥 Último inicio de sesión de los usuarios

## Valor devuelto
Se devuelve una tabla con los últimos usuarios que han entrado al sistema.

*Campos*:
- **USER**: Nombre del usuario.
- **TTY**: Nombre de la terminal usada por el usuario.
- **IP**: IP desde la que se conectó el usuario.
- **DATE**: Fecha de la conexión.

La información se obtiene del comando `last`.

## ¿De qué sirve esta información para escalar privilegios?
Puede ser interesante observar qué usuarios son los últimos que se han conectado de tal forma que se pueda buscar por aquellas modificaciones realicadas por estos (nuevos ficheros, carpetas, modificaciones, etc).


## Ver también
- [All users](all)
- [Current logged users](current)
- [Superusers](superusers)
- [Users last logon](last_logon)
- [Users with a console](console)


## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/last.1.html)