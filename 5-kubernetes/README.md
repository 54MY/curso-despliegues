# Despliegue en Minikube

Este documento describe el proceso para construir y desplegar las imágenes Docker en un cluster de Minikube.

## Requisitos previos

- Docker y Docker Compose instalados
- Minikube instalado y en ejecución
- kubectl configurado para trabajar con Minikube

## Proceso de despliegue

### 1. Construcción de imágenes Docker

Las imágenes Docker se construyen utilizando el archivo `docker-compose.yml` ubicado en la carpeta `3-dockerizar/` del proyecto.

Navegar a la carpeta correspondiente y ejecutar:
```bash
cd 3-dockerizar/
docker compose build
```

### 2. Carga de imágenes en Minikube

Minikube utiliza su propio daemon de Docker aislado del host. Por esta razón, las imágenes construidas localmente no son visibles automáticamente dentro del cluster.

Para cargar las imágenes en Minikube, utilizar el siguiente comando:
```bash
minikube image load <nombre-imagen>:<tag>
```

**Ejemplo:**
```bash
minikube image load backend:1.0.0
minikube image load frontend:1.0.0
minikube image load database:1.0.0
```

> **Nota:** Es necesario ejecutar este comando para cada imagen que se utilizará en el cluster.

### 3. Verificación de imágenes cargadas

Para confirmar que las imágenes se han cargado correctamente en Minikube:
```bash
minikube image ls | grep <nombre-imagen>
```

## Solución de problemas

- Si las imágenes no se cargan correctamente, verificar que Minikube esté en ejecución: `minikube status`
- Asegurarse de usar las mismas etiquetas (tags) en los manifiestos de Kubernetes que las utilizadas al construir las imágenes
- Para listar todas las imágenes disponibles en Minikube: `minikube image ls`

## Recursos adicionales

- [Documentación oficial de Minikube](https://minikube.sigs.k8s.io/docs/)
- [Uso de imágenes locales con Minikube](https://minikube.sigs.k8s.io/docs/handbook/pushing/)