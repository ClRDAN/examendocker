# examendocker
## Examen final M11-SAD UF4. Docker (alta disponibilidad)
Crear una imagen de Docker con un servidor de correo POP uw-imap y ejecutarla en una máquina de AWS. Comprobar el funcionamiento de la máquina.

Repositorio de las imágenes docker:  
https://hub.docker.com/r/agalilea/m11aitor

Ubicación del proyecto en GITHub:  
https://ClRDAN/examendocker

uw-imap es un servidor tipo xinetd, al instalarlo se crean los archivos de configuración pero tenemos que modificarlos para activar el servicio. Para ello creamos los archivos imap, ipop3 y pop3s, y configuramos la imagen para que sobreescriba estos archivos en /etc/xinetd.d/ al arrancar. También es necesario modificar PAM para permitir que los usuarios de correo se logueen, para ello automatizamos la copia del archivo pamimap en /etc/pam.d/imap al arrancar la imagen.
Para arrancar el container en la máquina de AWS:
`docker run --rm --name popserver --hostname popserver --network popnet -p 110:110 -p 995:995 -p -d agalilea/m11aitor:latest`
Previamente debemos haber creado la red popnet con 
`docker network create popnet`
Para que los clientes puedan acceder al servidor hace falta hacer dos cosas:
* redirigir los puertos 110 y 995 (pop3 y pop3s) entre el contenedor y la máquina en la que corre, por eso en el comando de arranque indicamos -p 110:110 y -p 995:995.
* abrir el firewall para que acepte conexiones a esos dos puertos. En AWS esto se hace en el menú "Security Groups", seleccionamos el "security group" al que pertenece nuestra máquina virtual y en el botón de "actions" elegimos "Edit inbound rules". Hay reglas predefinidas para POP3 y POP3s que abren el puerto correspondiente, las seleccionamos y nos aseguramos de que aceptan conexiones de todas partes poniendo como origen 0.0.0.0/0. Guardamos y salimos.

Ahora ya deberíamos tener un servidor de correo funcionando, 
