#### Comandos básicos:

# Descargar una imagen
docker pull nginx

# Listar imágenes
docker images

# Ejecutar un contenedor simple
docker run nginx

# Ejecutar en background con puerto y nombre
docker run -d -p 8080:80 --name mi-nginx nginx

# Listar contenedores activos
docker ps

# Listar todos los contenedores (incluso detenidos)
docker ps -a

# Ver logs de un contenedor
docker logs mi-nginx

# Seguir logs en tiempo real
docker logs -f mi-nginx

# Detener un contenedor
docker stop mi-nginx

# Iniciar un contenedor detenido
docker start mi-nginx

# Reiniciar un contenedor
docker restart mi-nginx

# Eliminar un contenedor
docker rm mi-nginx

# Forzar eliminación de contenedor activo
docker rm -f mi-nginx

# Eliminar una imagen
docker rmi nginx

# Eliminar todos los contenedores detenidos
docker container prune

# Eliminar todas las imágenes sin usar
docker image prune -a



#### Ejecutar comandos dentro de contenedores:

# Ejecutar comando en contenedor activo
docker exec mi-nginx ls /usr/share/nginx/html

# Acceder a shell interactivo (bash)
docker exec -it mi-nginx bash

# Acceder a shell interactivo (sh) - para imágenes alpine
docker exec -it mi-nginx sh

# Ejecutar comando como root
docker exec -u root mi-nginx whoami

# Ver procesos corriendo en el contenedor
docker top mi-nginx

# Ver estadísticas de recursos (CPU, RAM, etc.)
docker stats mi-nginx



#### Copiar archivos entre host y contenedor:

# Copiar archivo del host al contenedor
docker cp archivo.txt mi-nginx:/usr/share/nginx/html/

# Copiar directorio del host al contenedor
docker cp ./mi-carpeta mi-nginx:/app/

# Copiar archivo del contenedor al host
docker cp mi-nginx:/var/log/nginx/access.log ./logs/

# Copiar directorio del contenedor al host
docker cp mi-nginx:/etc/nginx ./config-backup/


#### Volúmenes - Persistencia de datos:
# Crear un volumen
docker volume create mi-volumen

# Listar volúmenes
docker volume ls

# Inspeccionar un volumen
docker volume inspect mi-volumen

# Ejecutar contenedor con volumen nombrado
docker run -d -v mi-volumen:/data --name app nginx

# Ejecutar con bind mount (vincular carpeta del host)
docker run -d -v /ruta/host:/ruta/contenedor --name app nginx
docker run -d -v $(pwd)/html:/usr/share/nginx/html --name web nginx

# Volumen de solo lectura
docker run -d -v mi-volumen:/data:ro --name app nginx

# Eliminar un volumen
docker volume rm mi-volumen

# Eliminar volúmenes no utilizados
docker volume prune

Tipos de volúmenes:

Named volumes: Gestionados por Docker, ideales para persistencia
Bind mounts: Vinculan directorio del host, ideales para desarrollo
tmpfs: En memoria, se pierden al detener el contenedor


#### Networks - Comunicación entre contenedores:
# Listar redes
docker network ls

# Crear una red
docker network create mi-red

# Crear red con subnet específica
docker network create --subnet=172.18.0.0/16 mi-red-custom

# Inspeccionar una red
docker network inspect mi-red

# Conectar contenedor a una red
docker run -d --network mi-red --name app1 nginx

# Conectar contenedor existente a una red
docker network connect mi-red app2

# Desconectar contenedor de una red
docker network disconnect mi-red app2

# Eliminar una red
docker network rm mi-red

# Eliminar redes no utilizadas
docker network prune

Tipos de redes:

bridge: Red por defecto, contenedores en el mismo host
host: Usa la red del host directamente
none: Sin conectividad de red
overlay: Para comunicación entre hosts (Docker Swarm)


#### Guardar y compartir imágenes (sin registry):

# Guardar imagen a archivo tar
docker save nginx:latest -o nginx.tar
docker save -o mi-app.tar mi-app:1.0

# Guardar múltiples imágenes
docker save -o imagenes.tar nginx:latest mysql:8.0 redis:alpine

# Comprimir la imagen (ahorra espacio)
docker save nginx:latest | gzip > nginx.tar.gz

# Cargar imagen desde archivo
docker load -i nginx.tar
docker load < nginx.tar

# Cargar imagen comprimida
gunzip -c nginx.tar.gz | docker load

# Exportar contenedor (filesystem completo)
docker export mi-contenedor -o contenedor.tar

# Importar como imagen
docker import contenedor.tar mi-imagen:nueva

Diferencia entre save/load y export/import:

save/load: Preserva capas e historial de la imagen
export/import: Solo el filesystem, pierde historial, crea una sola capa