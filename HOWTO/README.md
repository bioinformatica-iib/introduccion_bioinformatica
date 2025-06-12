Página web del curso: https://bioinformatica-iib.github.io/quimioinformatica/

## Instalación 2025 en Ubuntu

Explicación detallada por si ayuda:

* Clonar el repositorio en una carpeta de tu PC (nombre por defecto: `quimioinformatica`)
* Instalar conda o miniconda o miniforge. [Instrucciones en el repo miniforge.](https://github.com/conda-forge/miniforge) 
* Crear un entorno conda (yo lo llamo `mkdocs`) siguiendo las dependencias que vienen en el archivo `conda-linux-64.lock` en el repo: `conda conda create -n mkdocs --file conda-linux-64.lock`. 
* Activar este entorno: `conda activate mkdocs`
* Correr `poetry install` para instalar todas las dependencias en sus respectivas versiones. 
* Esto va a instalar todos los requisitos de nuestra página en el sistema
* Luego cada vez que se quiera probar el sitio localmente ir a la misma carpeta y correr:

```
# cd <path-to-repo>, e.g. cd ~/git/quimioinformatica
conda activate mkdocs
mkdocs serve
``` 

* La página web ahora está en http://127.0.0.1:8000 y se actualiza en tiempo real si cambias cualquier archivo del arbol (sin tener que hacer nada).

* Después de probar todo localmente y ver que las páginas cargan y se ven bien se puede hacer `commit` al repo. Desde el módulo de control de versiones de VSCode, o en la terminal
```
# agregar TODOS los archivos modificados
git add
# o alternativamente agregar solo algunos, ej los que quieran que vayan en este commit particular
git add docs/cronograma.md
git add docs/contenidos.md

# despues
git commit -m "este commit agrega cambios en X, Y, Z"
git push 
```

* Esto solamente hace push a Github, no genera las paginas web. Esto está bueno para ir actualizando paginas sin que se hagan publicas. Si estamos listos para publicar, usamos mkdocs para hacer deploy a `github-pages`

```
mkdocs gh-deploy
```

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

