# Requerimientos

- docker >= 2.10.18
- docker-compose v2
- aws-cli v2

# Instalación Docker Engien

### Arch ([Documentación aquí](https://wiki.archlinux.org/title/docker))
Los pasos para instalar docker en arch linux son los siguientes
```
sudo pacman -Syu
Sudo pacman -S docker
	
sudo systemctl start docker.service
sudo systemctl enable docker.service

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
### Otras distribuciones disponibles:

Para revisar las distribuciones compatibles y su instalación se recomienda revisar la documentación oficial de docker, la cual encontraran en el siguiente hipervínculo: [Enlace de la documentación](https://docs.docker.com/engine/install/)

# Instalación Docker Desktop
### Distribuciones disponibles:

Para revisar las distribuciones compatibles y su instalación se recomienda revisar la documentación oficial de docker, la cual encontraran en el siguiente hipervínculo: [Enlace de la documentación](https://docs.docker.com/desktop/install/linux-install/)

### Windows 
Hay 2 variantes de instalación en windows, de la cual a criterio personal recomiendo la utilización de wsl2, ya que permite una integración correcta con las herramientas entregadas.
[Enlace de la documentación](https://docs.docker.com/desktop/install/windows-install/)

### Mac
[Enlace de la documentación](https://docs.docker.com/desktop/install/mac-install/)

# Instalación de docker-compose v2

### Arch ([Documentación aquí](https://wiki.archlinux.org/title/docker))
Los pasos para instalar docker-compose v2 en arch linux son los siguientes
```
sudo pacman -Syu
Sudo pacman -S docker-compose
```
puede comprobar que tenga docker-compose 2 realizando el siguiente comando
¨¨¨
docker compose --version
¨¨¨

### Docker-Desktop
Esta disponible inmediatamente después de la instalación de docker-desktop


# Instalación aws-cli v2

### Documentación:
Para este caso, se recomienda directamente revisar la (documentación)[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]


[Regresemos al Readme](../README.md)
