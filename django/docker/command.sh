#!/bin/bash
cd ./config
source ./var.sh
cd ..

docker compose --project-name $project-$mode --env-file ./config/.env.$mode -f docker-compose.yaml -f docker-compose.$mode.yaml $1
