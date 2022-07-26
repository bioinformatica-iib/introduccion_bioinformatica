Página web de la materia: https://bioinformatica-iib.github.io/2022_introduccion_bioinformatica/

## Instalación 2022 en Ubuntu

Acabo de instalar esto siguiendo los pasos de abajo y estan bastante bien, pero lo pongo detallado por si ayuda:

* Clonar el repositorio en una carpeta de tu PC (nombre por defecto: `2022_introduccion_bioinformatica`)
* Instalar Poetry segun las instrucciones de su [página](https://python-poetry.org/docs/). En Linux el comando por defecto es:

```
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```
* En mi caso tuve que instalar *curl* antes siguiendo las instrucciones de la consola de Ubuntu y en el comando anterior tuve que reemplazar **python** por **python3**, que era la versión que tenía en la PC
```
#Estas dos lineas hay que correrlas solo si son necesarias. En un principio la de arriba deberia alcanzar
sudo apt install curl
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
```
* Poetry me pidió que corrá un comando para agregar poetry al *environment* asi que lo hice (esto hay que hacerlo cada vez que abris una consola nueva hasta que reinicias la compu, ahi ya es automático)
```
source $HOME/.poetry/env
```
* Una vez instalado Poetry, ir a la carpeta del repositorio de GIT (`2022_introduccion_bioinformatica`) y correr:
```
poetry install 
```
* Esto va a instalar todos los requisitos de nuestra página en el sistema
* Luego cada vez que se quiera probar el sitio localmente ir a la misma carpeta y correr:
```
poetry shell 
mkdocs serve
``` 
* La página web ahora está en http://127.0.0.1:8000 y se updatea en tiempo real si cambias cualquier archivo del GIT (sin tener que hacer nada).

## Template / Molde Mkdocs para cursos UNSAM

Este es un esqueleto más o menos organizado (casi listo) para armar y publicar
en la web un curso o materia. 

El material para las clases se escribe en markdown (texto plano), y se puede
editar directamente desde un repositorio (ej GitHub).

`cursos-unsam-mkdocs-template` usa [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). 
Consultar la documentación (que está buenísima!) en
[Setup](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/),
para ver como customizar las paginas de un curso (logo, colores, etc). 

Y consultar [Reference](https://squidfunk.github.io/mkdocs-material/reference/), 
para ver como incluir notas, botones, tablas, diagramas, iconos al escribir y
preparar el material del curso etc. 

## Brevemente

 * Editar mkdocs.yml y customizar
 * Crear contenido:
    * llenar información general (acerca, cronograma, docentes, etc.)
    * seguir orden de carpetas y subcarpetas para distintos tipos de materiales
    * poner imagenes (.svg, .png, .jpg) en las mismas carpetas para que sea mas facil linkearlas
    * 

## En mas detalle

`cursos-unsam-mkdocs-template` es un template, asi que hay que copiarlo o forkear. mkdocs es un
generador de sitios estáticos, y Material for Mkdocs es un conjunto de aditivos
para hacer que escribir y publicar contenido sea fácil divertido y los sitios
sean profesionales y se vean bien en cualquier dispositivo. 

Todas las dependencias (paquetes y adicionales) están manejadas por
[poetry](https://python-poetry.org) y el esqueleto ya tiene lo necesario para
ser generado y publicado en [netlify](https://www.netlify.com/). 

Poetry hace facil correr todo el sitio localmente si es que quieren editar e ir
viendo como queda. Para eso, **instalar poetry** (seguir instrucciones en la
página), y luego: 
```
cd cursos-unsam-mkdocs-fork
poetry install 
```

Asi que después de esto, si quieren correr el sitio localmente:
```
poetry shell 
mkdocs serve
``` 

Esto activa el entorno python con todas las dependencias y luego corre mkdocs
para generar el sitio. Pueden navegarlo en http://127.0.0.1:8000. 

Netlify usa `requirements.txt` y `netlify.toml` (además del resto) para poder
generar el sitio.

## Para actualizar la web
Una vez que se hace un cambio y se realiza un commit en la web hay que hacer el deploynment corriendo en el root:
`mkdocs gh-deploy`

