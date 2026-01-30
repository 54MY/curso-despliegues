## Correr ubuntu en docker
docker run -d --network demoqr-net -it ubuntu /bin/bash

## Correr un contenedor
docker run -d --network demoqr-net -p 8080:80 -v $(pwd)/html:/usr/share/nginx/html --name mi-nginx nginx:alpine

## network
docker network create demoqr-net

## BDD
docker run -d \
  --name postgres \
  --network demoqr-net \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=demoqr \
  -p 5432:5432 \
  -v postgres-demoqr-data:/var/lib/postgresql/data \
  postgres:15-alpine

## Empaquetar JAR
docker build -t mi-jar .
docker run -d -p 9091:9091 --network demoqr-net --name mi-jar mi-jar