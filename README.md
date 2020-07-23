# Prueba de Desarrollo PHP
##### Servicio REST y Cliente web responsivo
Este es un ejemplo de la creacion de un servicio REST utilizando como base el framework Lumen, 
el cual es un sub-set de Laravel
##Instalación
Es necesario cargar la base de datos y crear un usuario/contraseña con privilegios de lectura/escritura.
El archivo SQL **base.sql** se encuentra en la raiz del repositorio.

Al ser Lumen un sub-set de Laravel (realmente es Laravel pero mas ligero) los pasos para su puesta en marcha
son iguales a los de un proyecto laravel:
- Cargar el contenido de la carpeta _lumen_ a la carpeta web donde se visualizara el sistema (sólo cargar el contenido de la carpeta)
- Modificar el archivo .env en la nueva raíz web para ingresar la información de la base de datos y de la 
URL del proyecto en caso de ser necesario
- Asegurarse que las carpetas storage y boostrap (en la raíz web) tengan permisos de escritura para la aplicación
- Desde consola, navegar al directorio raíz web (recordar que solo se instalaron los contenidos del folder _lumen_ y no el folder como tal) y ejecutar
el comando `composer install`
- Podra ser necesario generar una llave para la aplicación, esto se logra con el comando `php artisan key:generate`

Información mas detallada sobre la instalación de proyectos laravel se puede encontrar en la [documentación oficial de Laravel](https://laravel.com/docs/7.x/deployment)
 
 Es necesario cargar la información de la base de datos en en archivo .env antes mencionado y revisar que funcionen correctamente los servicios definidos más adelante
 
 De igual forma, la interface utilza un mapa de Google con una llave configurada para correr desde localhost únicamente, si se requiere modificar la llave por una con otros privilegios se debe actualizar el API_KEY en el archivo _resources/views/index.blade.php_ al final del éste se encuentra la llamada al SDK de google maps, reemplazar aquí el valor de **key=** en la URL
 
 Una vez instalado el proyecto, al navegar en la web a la raíz del mismo, se debe mostrar la interface gráfica del proyecto 
 ##Servicio
 Los distintos endpoints del servicio son:
 ###[GET] carburantes/update
 Se encarga de consultar el servicio web de sedeaplicaciones.minetur.gob.es y actualizar la información tanto de precios como de las entidades (Provincia, Municipio). Ya que no se utilizó un servicio o base separados para obtener la información postal se recorre toda 
 la información devuelta por el servicio y se generan los registros únicos de cada localidad y los precios de cada estación
 ###[POST] carburantes/estaciones/{ord}
 Lista todas las estaciones en la base de datos, como parámetro opcional puede recibir un ordenamiento por precios de los combustibles, el valor de este parámetro es [ASC|DESC]
 - parámetro [POST] **provincia** recibe un ID de una provincia, si se recibe se listan todas las estaciones de esa provincia
 - parámetro [POST] **municipio** recibe un ID de un municipio, si se recibe se listan todas las estaciones de este municipio. Si se reciben tanto **provincia** como **municipio**, municipio simpre tendrá prioridad, al ser un subconjunto de provincia.
 ###[GET] entidades/provincias
 Lista todas las provincias con su ID
 ###[GET] entidades/municipios/{pid}
 Lista todos los municipios con su ID, limitados por el parámetro {pid} el cual es obligatorio y recibe el ID de una provincia
 
 ###Notas
 Algunas estaciones no cuentan con coordenadas, se agregan al listado pero no intenta generar un marcador en el mapa.
 
 No todas las estaciones tienen todos los precios de gasolina, por lo que el ordenamiento de precios es entre distintas columnas (en la interface se aprecia de la columna izquiera a derecha)
 
 La interface tiene implementado un spinner para todas las peticiones AJAX, al correr en local el tiempo de respuesta puder ser muy rápido
 y es posible que se aprecie una especie de _destello_ negro en la pantalla, esto es normal ya que en realidad se coloca una cortinilla 
 oscura sobre la interface pero inmediatamente se retira al finalizar la petición AJAX que suele ser muy breve en local. Si se desea mirar la misma se puede emular una velocidad de conexión más lenta utilizando la opción de "throttling" en las herramientas de desarrollo
 del navegador
