# 👥 Superusuarios

## Valor devuelto
Se devuelve una tabla con los usuarios que contengan privilegios de root.

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
Es interesante observar qué usuarios contienen privilegios de root. Puede que existan diferentes usuarios distintos al propio usuario "root" que contengan estos privilegios. Es recomendable recolectar información de estos usuarios ya que pueden ser un buen objetivo para conseguir permisos de root.

## Ver también
- [All users](all)
- [Current logged users](current)
- [Last logged users](last)
- [Users last logon](last_logon)
- [Users with a console](console)


## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man5/passwd.5.html)