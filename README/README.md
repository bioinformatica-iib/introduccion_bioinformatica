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
