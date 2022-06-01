# 👥 Users with a console

## Valor devuelto
Se devuelve una tabla con los usuarios que contengan una shell.

*Campos*:
- **USERNAME**: Nombre del usuario.
- **PASSWORD**: Contraseña del usuario (no debería ser distinta de x ya que esta debe de estar en otro archivo).
- **UID**: ID del usuario.
- **GID**: ID del grupo del usuario.
- **FULLNAME**: Nombre completo del usuario.
- **HOME**: Directorio personal del usuario.
- **LOGIN SHELL**: Shell principal del usuario.

La información se obtiene del fichero `/etc/passwd`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante observar qué usuarios contienen una shell. Estos podrán contener información crítica que permita escalar privilegios. Pueden ser estos usuarios a quienes el ataque debe de ser dirigido.

## Ver también
- [All users](all)
- [Current logged users](current)
- [Last logged users](last)
- [Superusers](superusers)
- [Users last logon](last_logon)

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man5/passwd.5.html)