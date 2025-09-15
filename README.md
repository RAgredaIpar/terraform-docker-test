# Ambiente de Desarrollo con Terraform y Docker

Este proyecto crea un entorno de desarrollo (DEV) usando [Terraform](https://www.terraform.io/) y [Docker](https://www.docker.com/).  
El objetivo es que, con un solo comando, se levanten todos los servicios necesarios para probar aplicaciones en un ambiente local.

---

## ¿Qué se crea con este proyecto?

Cuando lo ejecutes, tendrás funcionando lo siguiente:

- **3 aplicaciones web (Nginx)**  
  - app1 → [http://localhost:8081](http://localhost:8081)  
  - app2 → [http://localhost:8082](http://localhost:8082)  
  - app3 → [http://localhost:8083](http://localhost:8083)  

- **Base de datos PostgreSQL**  
  - Usuario: `admin_user`  
  - Contraseña: `admin_pass`  
  - Base de datos: `app_db`

- **Base de datos en memoria Redis** (para cache)

- **Grafana** para monitoreo → [http://localhost:3000](http://localhost:3000)  

- **Redes internas** para que los contenedores puedan comunicarse entre sí:
  - `app_net` → conecta las aplicaciones con Grafana  
  - `persistence_net` → conecta Redis y Postgres con las aplicaciones  
  - `monitor_net` → conecta Grafana con el resto  

- **Volúmenes persistentes** (los datos no se borran aunque elimines los contenedores):
  - `postgres_data` → guarda la información de la base de datos  
  - `redis_data` → guarda los datos de Redis  

---
## Requisitos

Antes de empezar asegúrate de tener instalado:

1. [Docker](https://docs.docker.com/get-docker/)  
   (necesario para ejecutar los contenedores)
2. [Terraform](https://developer.hashicorp.com/terraform/downloads)  
   (necesario para automatizar la creación de los contenedores)

---

## Cómo levantar el proyecto

1. Clona este repositorio en tu computadora:
   ```bash
   git clone https://github.com/RAgredaIpar/terraform-docker-test.git
2. Inicializa Terraform:
    ```bash
    terraform init
3. Revisa qué se va a crear:
    ```bash
    terraform plan
4. Aplica los cambios
    ```bash
    terraform apply
## Configuración

Si quieres cambiar el puerto de Grafana (por defecto 3000), edita el archivo terraform.tfvars:

```bash
    grafana_external_port = 3000
```

Por ejemplo, si quieres usar el puerto 4000:

```bash
    grafana_external_port = 4000
```


---
## Comprobar conexion entre contenedores

Para comprobar desde grafana
```bash
docker exec -it grafana sh
```
Una vez ingreses a la consola del contenedor de grafana ejecuta lo siguiente (En este comando puedes utilizar app1, app2 y app3):
```bash
curl http://app1
```

Para comprobar desde app1, app2, app3 la conexion con las bases de datos y grafana
```bash
docker exec -it app1 sh
```
- Para postgres, redis y grafana
  ```bash
  ping postgres
  ```
  ```bash
  ping redis
  ```
  ```bash
  ping grafana
  ```

Aparecerán los paquetes recibidos por parte de los servicios.