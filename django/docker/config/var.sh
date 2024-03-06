############### mode ############### 
# Warning !!!!!!!!!!
# No mover mode de linea
mode=dev #Valores validos= prod or local or unitest or dev or local
# Warning !!!!!!!!!!
# cualquier modificacion a este archivo porfavor, realizarlo despues de la linea 5
# de preferencia a partir de este comentario:

######  Escriba su codigo aqui  ######
############### depende del equipo ###############

pathdb=$PWD/ReplaceWithName.sql

############### depende del projecto ###############
# Super user campos
superuser=18895196
superpass=pass
# Depende de lo declarado en docker-compose.yaml
dbservices=database #Este es el nombre del servicio de base de datos
dbvolume=data-postgres #Este es el nombre del volumen de la base de datos

############### Static ###############
## Si desea modificar alguno de estos valores, debe ir a modificar las variables de entorno correspondientes
## En el .env correspondiente

# Configuraciones relacionadas al entorno en uso
if [ "$mode" == "" ]; then
    source .env.dev
else 
    source .env.$mode
fi
# Carga de variables que se utilizaran en archivos de bash
dbuser=$DATABASE_USER
db=$DATABASE_NAME
project=$PROJECT_NAME