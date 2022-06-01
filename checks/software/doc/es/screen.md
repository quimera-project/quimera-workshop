# 🧪 Screen sessions

## Valor devuelto
Se devuelve una lista de pares clave-valor con las diferentes sesiones abiertas de screen.

La información se obtiene del comando `screen`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante observar si existen sesiones de screen abiertas de tal forma que se pueda conseguir otro tipo de shell u otra información, ampliando así el rango de ataque y exposición.

## Ver también
- [Tmux sessions](tmux)

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man1/screen.1.html)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-exploiting-shell-sessions/)