# Configurar Contexto docker-compose con credenciales aws
Para configurar el contexto de docker-compose debe tener instalado docker-compose v2 y aws-cli, ademas de haber configurado su perfil de aws-cli.
Los pasos a seguir

## Configuración de las credenciales aws
Ingresaremos el comando
```
aws configure
```
1- Nos solicitara ingresar el ID del usuario, ingresemos el valor y damos enter.
2- posteriormente nos solicitara ingresar la secret key a lo cual le volveremos a dar enter una vez ingresada la key.
3- ahora solicitara la region por defecto, ingresamos la region correspondiente al proyecto
4- para terminar no ingresaremos nada en Default output format.

Con esto tenemos ingresadas nuestras credenciales.

## Login aws
Las credenciales expiran cada 24 horas, por lo cual deberemos logearnos al menos 1 vez al dia, para esto podemos utilizar el siguiente comando:

```
aws ecr get-login-password --region ${remplazar por la region} | docker login --username AWS --password-stdin ${remplazar por el dominio a ingresar}
```

Dentro del archivo usercomm.sh (archivo que contiene comandos para facilitar el desarrollo) están establecidos todos los parametros requeridos para cada proyecto. Por lo cual si deseas utilizar esos comando se debe seguir los siguientes pasos:
Desde la carpeta raiz ejecutar el siguiente comando
```
source usercomm.sh

```
Esto nos registrara en la session actual de nuestra shell todos los comando programados en el archivo, a continuación correremos el comando para logearnos:
```
alogin
```
Listo!

## Configurar docker context con aws

```
docker context create ecs ${Nombre Contexto}
```

Es necesario remplazar ${Nombre contexto} por el nombre de contexto que desee, por ejemplo:
```
docker context create ecs confinanzas-go
```

A continuación deberás elegir entre dos opciones:

```
  AWS secret and token credentials
> AWS environment variables
```

Este tutorial seguirá la alternativa de AWS environment variables.
Como anteriormente ingresamos nuestras credenciales con aws config, este paso se encuentra listo!

[Regresemos al Readme](../README.md)