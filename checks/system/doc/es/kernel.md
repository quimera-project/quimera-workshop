# 💻 Kernel exploits

## Valor devuelto
Se devuelve una tabla con los exploits disponibles para el kernel actual.

*Campos*:
- **NAME**: Nombre del exploit.
- **CVE**: CVE de dicho exploit.
- **EXPLOIT**: Url del exploit.
- **USER**: Usuario a quien se atribuye el exploit.

La información se obtiene de la herramienta `linux exploit suggester 2`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer los exploits del kernel con el fin de poder explotarlos y conseguir escalar privilegios.

## Referencias
- [Linux Exploit Suggester 2](https://github.com/jondonas/linux-exploit-suggester-2)
