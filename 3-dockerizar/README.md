# 📋 Sistema de Gestión de Personas

Proyecto completo con Node.js, MySQL y Frontend, todo dockerizado.

## 🏗️ Arquitectura

El proyecto consta de 3 contenedores:

1. **MySQL Database** - Base de datos con tabla `persona`
2. **Backend Node.js** - API REST que consulta MySQL
3. **Frontend** - Interfaz web para visualizar los datos

## 📁 Estructura del Proyecto

```
proyecto-personas/
├── docker-compose.yml
├── db/
│   └── init.sql
├── backend/
│   ├── Dockerfile
│   ├── package.json
│   └── index.js
└── frontend/
    ├── Dockerfile
    ├── nginx.conf
    └── index.html
```

## 🚀 Instrucciones de Uso

### Requisitos Previos

- Docker instalado
- Docker Compose instalado

### Paso 1: Levantar los contenedores

```bash
cd proyecto-personas
docker-compose up -d
```

Este comando:
- Descarga las imágenes necesarias
- Construye los contenedores del backend y frontend
- Inicia MySQL con los datos precargados
- Inicia el backend en el puerto 3000
- Inicia el frontend en el puerto 8080

### Paso 2: Verificar que los servicios estén corriendo

```bash
docker-compose ps
```

Deberías ver 3 contenedores activos:
- `mysql-personas`
- `nodejs-backend`
- `frontend-personas`

### Paso 3: Acceder a la aplicación

- **Frontend**: http://localhost:8080
- **API Backend**: http://localhost:3000/api/personas
- **MySQL**: localhost:3306 (usuario: `usuario`, password: `password123`)

## 🔌 Endpoints de la API

### Obtener todas las personas
```
GET http://localhost:3000/api/personas
```

Respuesta:
```json
{
  "success": true,
  "total": 20,
  "data": [
    {
      "id": 1,
      "nombre": "Juan",
      "apellido": "Pérez",
      "edad": 28,
      "email": "juan.perez@email.com",
      "telefono": "+591-4-4123456",
      "ciudad": "Cochabamba",
      "pais": "Bolivia",
      "fecha_registro": "2026-01-30T12:00:00.000Z"
    },
    ...
  ]
}
```

### Obtener una persona por ID
```
GET http://localhost:3000/api/personas/:id
```

Ejemplo:
```
GET http://localhost:3000/api/personas/1
```

## 🛠️ Comandos Útiles

### Ver logs de los contenedores
```bash
# Todos los servicios
docker-compose logs -f

# Solo backend
docker-compose logs -f backend

# Solo base de datos
docker-compose logs -f db
```

### Detener los contenedores
```bash
docker-compose down
```

### Detener y eliminar volúmenes (borrar datos de la BD)
```bash
docker-compose down -v
```

### Reconstruir los contenedores
```bash
docker-compose up -d --build
```

### Acceder a la consola de MySQL
```bash
docker exec -it mysql-personas mysql -u usuario -ppassword123 personas_db
```

Dentro de MySQL puedes ejecutar:
```sql
SELECT * FROM persona;
```

## 📊 Base de Datos

### Tabla: persona

| Campo | Tipo | Descripción |
|-------|------|-------------|
| id | INT | ID autoincremental (Primary Key) |
| nombre | VARCHAR(100) | Nombre de la persona |
| apellido | VARCHAR(100) | Apellido de la persona |
| edad | INT | Edad |
| email | VARCHAR(150) | Correo electrónico |
| telefono | VARCHAR(20) | Número de teléfono |
| ciudad | VARCHAR(100) | Ciudad |
| pais | VARCHAR(100) | País |
| fecha_registro | TIMESTAMP | Fecha de registro |

La base de datos viene precargada con **20 personas** de ejemplo.

## 🔧 Configuración

### Variables de Entorno (Backend)

Definidas en `docker-compose.yml`:

```yaml
DB_HOST: db
DB_USER: usuario
DB_PASSWORD: password123
DB_NAME: personas_db
DB_PORT: 3306
```

## 🎨 Frontend

El frontend es una página HTML simple con:
- Diseño responsivo
- Tabla con datos de las personas
- Botón para recargar datos
- Manejo de errores
- Estilos modernos con gradientes

## 🐛 Solución de Problemas

### El backend no puede conectarse a MySQL
- Espera unos segundos, MySQL tarda en inicializarse
- El backend tiene un sistema de reintentos automático

### Error de CORS en el frontend
- Verifica que el backend esté corriendo
- El backend ya tiene CORS habilitado

### No se muestran los datos en el frontend
- Abre la consola del navegador (F12) para ver errores
- Verifica que todos los contenedores estén corriendo: `docker-compose ps`

## 📝 Notas

- Los datos de MySQL se persisten en un volumen Docker
- El backend espera a que MySQL esté listo antes de iniciar
- Sin autenticación (como solicitaste)
- Todos los servicios están en la misma red Docker

## 🤝 Contribuciones

Este es un proyecto de ejemplo educativo. Siéntete libre de modificarlo según tus necesidades.

## 📄 Licencia

MIT
