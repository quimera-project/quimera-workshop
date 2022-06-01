# 🛰️ IPv6 hosts

## Valor devuelto
Se devuelve una tabla con las diferentes rutas IP.

*Campos*:
- **INTERFACE**: Interfaz a la que se enviarán los paquetes para esta ruta.
- **DESTINATION**: El host o dirección destino.
- **GATEWAY**: La puerta de enlace ('*' si no es ningúna).
- **GENMASK**: La máscara de red para la red destino ('255.255.255.255' para el destino de un host y '0.0.0.0' para la ruta por defecto)
- **FLAGS**: Diferentes opciones (U: la ruta está disponible; H: el destinatario es un host; G: usa la puerta de enlace; R: restablecer la ruta para el enrutamiento dinámico; D: instalado dinámicamente por demonio o redireccionamiento; M: modificado desde el demonio de enrutamiento o redireccionamiento; !: ruta rechazada).
- **HOPS**: La distancia en saltos hacia el destinatario.

La información se obtiene del comando `route`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante tener una vista general de todas las rutas existentes; a qué hosts se pueden acceder desde qué ruta.

## Ver también
- [Active ports](ports)
- [Interfaces](interfaces)
- [IPv4 hosts](ipv4)
- [IPv6 hosts](ipv6)

## Referencias
- [Manual](https://www.man7.org/linux/man-pages/man8/route.8.html)
- [Flags 1](https://github.com/giftnuss/net-tools/blob/master/lib/inet_gr.c)
- [Flags 2](https://github.com/giftnuss/net-tools/blob/master/lib/net-support.h)