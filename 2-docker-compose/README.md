# Demo Project - Docker Compose

Aplicación con base de datos PostgreSQL y backend Java, orquestada con Docker Compose.

## Estructura del proyecto

```
.
├── docker-compose.yml
├── README.md
├── app/
│   ├── Dockerfile
│   ├── demo.jar
│   └── application.properties
└── postgres/
    ├── Dockerfile
    └── init.sql
```

## Requisitos

- Docker
- Docker Compose

## Servicios

### PostgreSQL
- **Puerto**: 5432
- **Imagen**: `custom/postgres:1.0.0-SNAPSHOT`
- **Volumen**: `postgres-data` (persistencia de datos)
- **Script de inicialización**: `postgres/init.sql`

### Aplicación (JAR)
- **Puerto**: 9091
- **Imagen**: `custom/app:1.0.0-SNAPSHOT`
- **Dependencia**: PostgreSQL

## Uso

### Iniciar todos los servicios

```bash
docker-compose up -d
```

### Construir y levantar (rebuild)

```bash
docker-compose up -d --build
```

### Ver logs

```bash
# Todos los servicios
docker-compose logs -f

# Solo PostgreSQL
docker-compose logs -f postgres

# Solo la aplicación
docker-compose logs -f app
```

### Detener servicios

```bash
docker-compose down
```

### Detener y eliminar volúmenes

```bash
docker-compose down -v
```

## Comandos útiles

### Acceder a la base de datos

```bash
docker-compose exec postgres psql -U user -d demo
```

### Reiniciar un servicio específico

```bash
docker-compose restart app
docker-compose restart postgres
```

### Ver estado de los servicios

```bash
docker-compose ps
```

### Reconstruir un servicio específico

```bash
docker-compose build app
docker-compose build postgres
```

## Red

Los servicios están conectados a través de la red `demo-net` (bridge), lo que permite la comunicación entre contenedores.

## Volúmenes

- `postgres-data`: Almacena los datos de PostgreSQL de forma persistente

## Configuración

### Archivo application.properties

Asegúrate de que la aplicación apunte a la base de datos usando el nombre del servicio:

```properties
spring.datasource.url=jdbc:postgresql://postgres:5432/demo
spring.datasource.username=user
spring.datasource.password=secret
```

### Script de inicialización (init.sql)

El archivo `postgres/init.sql` se ejecuta automáticamente al crear la base de datos por primera vez.

## Puertos expuestos

| Servicio   | Puerto interno | Puerto externo |
|------------|----------------|----------------|
| PostgreSQL | 5432           | 5432           |
| App        | 9091           | 9091           |

## Notas

- Los servicios se reinician automáticamente (`restart: always`)
- La aplicación espera a que PostgreSQL esté disponible (`depends_on`)
- Los datos de PostgreSQL persisten entre reinicios gracias al volumen

## Troubleshooting

### La aplicación no se conecta a PostgreSQL

Verifica que el servicio de PostgreSQL esté corriendo:
```bash
docker-compose ps
docker-compose logs postgres
```

### Limpiar y empezar de nuevo

```bash
docker-compose down -v
docker-compose up -d --build
```

## Licencia

[Especificar licencia]