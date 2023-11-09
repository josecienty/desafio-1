## DESAFIO IDESA
#### Programador: José Argüello
<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

## Requerimientos
- Php 8.2
- Composer
- Maria DB

## Instalación

1- Instalar el proyecto con el comando
```bash
composer install
```
2- Crear una base de datos en MariaDB o MySql.

3- Hacer una copia del .env.example y renombrarla como .env

3- Modificar la variable de entorno agregar la base de datos con las credenciales.
```bash
DB_DATABASE=#DBNAME
DB_USERNAME=#DBUSERNAME
DB_PASSWORD=#DBPASSWORD
```
4- Ejecutar las migraciones
```bash
php artisan migrate:fresh --seed
```

5- Refrescar las rutas y limpiar cache
```bash
php artisan optimize:clear
```

5- Ejecutar el servidor
```bash
php artisan serve
```

## Documentación de la Api

Dentro de la url principal /api/documentation. Hecho con Swagger.
##### [http://localhost:8000/api/documentation](http://localhost:8000/api/documentation)

## Postman Json
[Idesa.collection.json](Idesa.collection.json)

[Variable de entorno](local.postman_environment.json)

## DB Dump
[idesa.sql](idesa.sql)

### Requiere Bearer Token
Loguearse con el usuario de prueba
 ```bash
email: admin@idesa.com.py
password: admin
```

Copiar el Token dentro de la variable token de postman (token) o dentro de el Boton de Autenticación de la [documentación](http://localhost:8000/api/documentation)

## Descripción
Api para cargador de propiedades basada en la web actual, utilizando ciertas estructuras básicas.

La api te hace registro de las claves foraneas de "Manzana y Caracteristicas", si no tienen las ids

```bash
{
    "nombre": "Test",
    "cuota_desde": 200000,
    "superficie": 1203,
    "latitud":-12.5034,
    "longitud": -59.000,
    "manzana":{
        "nombre": "Manzana 1",
        "ciudad_id": 5
    },
    "caracteristicas":[
        {
            "titulo": "Lugar Confortable"
        },
        {
            "titulo": "Vista Plena"
        }
    ],
    "propiedad_estado_id":1

}

```

O en caso de que las tenga puede usarlas sin inconvenientes

```bash
{
    "nombre": "Lomas de plata",
    "cuota_desde": 200000,
    "superficie": 1203,
    "latitud":-12.5034,
    "longitud": -59.000,
    "manzana_id": 1,
    "caracteristicas":[
        {
            "id": 1
        },
        {
            "id": 2
        }
    ],
    "propiedad_estado_id":1

}
```

o mezclar los valores, es decir que manzana tenga id's foraneas y caracteristicas nuevas o viceversa.


### Foreign Keys
- Caracteristicas
- Manzana (Cuadra)
- Ciudad
- Departamento

## License

Laravel es Open Source [MIT license](https://opensource.org/licenses/MIT).
