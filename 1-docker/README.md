# Demo  - Docker Setup

Configuración de contenedores Docker para el proyecto Demo .

## Requisitos

- Docker
- Docker Compose (opcional)

## Configuración

### 1. Crear red de Docker

```bash
docker network create demo-net
```

### 2. Base de datos PostgreSQL

```bash
docker run -d \
  --name postgres \
  --network demo-net \
  -e POSTGRES_USER=user \
  -e POSTGRES_PASSWORD=secret \
  -e POSTGRES_DB=demo \
  -p 5432:5432 \
  -v postgres-demo-data:/var/lib/postgresql/data \
  postgres:15-alpine
```

### 3. Servidor Nginx

```bash
docker run -d \
  --network demo-net \
  -p 8080:80 \
  -v $(pwd)/html:/usr/share/nginx/html \
  --name mi-nginx \
  nginx:alpine
```

### 4. Aplicación JAR

```bash
# Construir la imagen
docker build -t mi-jar .

# Ejecutar el contenedor
docker run -d \
  -p 9091:9091 \
  --network demo-net \
  --name mi-jar \
  mi-jar
```

## Comandos útiles

### Ejecutar contenedor Ubuntu

```bash
docker run -d --network demo-net -it ubuntu /bin/bash
```

### Gestión de contenedores

```bash
# Ver contenedores en ejecución
docker ps

# Ver logs de un contenedor
docker logs <nombre-contenedor>

# Detener todos los contenedores
docker stop postgres mi-nginx mi-jar

# Eliminar todos los contenedores
docker rm postgres mi-nginx mi-jar

# Eliminar la red
docker network rm demo-net
```

## Estructura del proyecto

```
.
├── html/              # Archivos estáticos para Nginx
├── Dockerfile         # Configuración para la aplicación JAR
└── README.md
```

## Puertos

| Servicio   | Puerto |
|------------|--------|
| PostgreSQL | 5432   |
| Nginx      | 8080   |
| JAR        | 9091   |

## Variables de entorno

### PostgreSQL

- `POSTGRES_USER`: user
- `POSTGRES_PASSWORD`: secret
- `POSTGRES_DB`: demo

## Licencia

[Especificar licencia]