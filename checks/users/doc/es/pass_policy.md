# 👥 Password policy

## Valor devuelto
Se devuelve una lista con diferentes pares clave-valor de política de contraseñas.

*Claves*:
- **PASS_MAX_DAYS**: El máximo número de días que se pueden usar las contraseñas.
- **PASS_MIN_DAYS**: El mínimo número de días permitidos para ir cambiando de contraseña.
- **PASS_WARN_AGE**: El número de días antes de que se advierte que la contraseña es demasiado antigua.
- **ENCRYPT_METHOD**: Método por el cual se encriptan las contraseñas.
- **FAKE_SHELL**: Shell falsa que se ejecutará en vez de la determinada por el archivo /etc/passwd.
- **FAIL_DELAY**: Segundos de retardo para volver a introducir la contraseña en caso de fallarse.
- **LOGIN_RETRIES**: Máximo número de intentos al fallar la contraseña (Puede ser sobrescrito por PAM).
- **LOG_UNKFAIL_ENAB**: Valor booleano que determina si se registran los nombres de los usuarios no conocidos en los casos fallidos.

La información se obtiene del fichero `/etc/login.defs`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante observar algunos de los valores expuestos.

Los valores **PASS_WARN_AGE**, **PASS_MIN_DAYS** y **PASS_MAX_DAYS** revelan información sobre las contraseñas de los usuarios. Puede que algunos usen algún patrón fácil sobre el que realizar fuerza bruta.

**ENCRYPT_METHOD** puede devolver un cifrado fácil de crackear.

**FAIL_DELAY** junto con **LOGIN_RETRIES** pueden servir a la hora de realizar fuerza bruta para determinar cada cúanto tiempo se deben de realizar los intentos.

**LOG_UNKFAIL_ENAB** puede ser de utilidad ya que, en caso de corresponder con el valor "yes", existe la posibilidad de que algunos logs incluyan la contraseña en claro del usuario al haberse equivocado escribiendo la contraseña en el nombre.

## Referencias
- [Manual](https://man7.org/linux/man-pages/man5/login.defs.5.html)