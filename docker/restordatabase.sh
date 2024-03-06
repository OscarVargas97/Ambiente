#!/bin/bash
cd ./config
source ./var.sh
cd ..

if [ -z $pathdb ] 
then
    echo 'ingresar el path donde se encuentra la base de datos'
else 
    ./command.sh stop
    ./command.sh "rm -f -v $dbservices"
    docker volume rm ${project}-${mode}_$dbvolume
    ./command.sh "up -d $dbservices"
    sleep 8
    docker-compose --project-name $project-$mode exec -T $dbservices psql -U $dbuser $db < $pathdb
    ./command.sh stop
fi