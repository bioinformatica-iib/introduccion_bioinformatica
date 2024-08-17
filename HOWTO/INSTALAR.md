# INSTALAR

Como instalar todo el entorno (poetry + sitio + material-mkdocs + dependencias) para poder editar el sitio localmente y ver los cambios en tiempo real y hacer pruebas antes de subirlos. 

## Instalación en Ubuntu / Linux

Acabo de instalar esto siguiendo los pasos de abajo y estan bastante bien, pero lo pongo detallado por si ayuda:

* Clonar el repositorio en una carpeta de tu PC (nombre por defecto: `introduccion_bioinformatica`)
* Instalar Poetry segun las instrucciones de su [página](https://python-poetry.org/docs/). En Linux el comando por defecto es:

```
curl -sSL curl -sSL https://install.python-poetry.org | python3 -
```

* En mi caso tuve que instalar *curl* antes siguiendo las instrucciones de la consola de Ubuntu y en el comando anterior tuve que reemplazar **python** por **python3**, que era la versión que tenía en la PC

```
#Esto hay que correrlo solo si es necesario. En un principio la de arriba deberia alcanzar
sudo apt install curl
```

* Poetry me pidió que corra un comando para agregar poetry al *environment* asi que lo hice (esto hay que hacerlo cada vez que abris una consola nueva hasta que reinicias la compu, ahi ya es automático)

```
source $HOME/.poetry/env
```

* Una vez instalado Poetry, ir a la carpeta del repositorio de GIT (`introduccion_bioinformatica`) y correr:

```
poetry install 
```

* Esto va a instalar todos los requisitos de nuestra página en el sistema
* Luego cada vez que se quiera probar el sitio localmente ir a la misma carpeta y correr:

```
poetry shell 
mkdocs serve
``` 

* La página web ahora está en http://127.0.0.1:8000 y se updatea en tiempo real frente a cualquier cambio en los archivos del arbol (*.yml, *.md, etc.).




## Como actualizar paquetes, plugins, etc.

El sistema tiene todos los paquetes necesarios listados en el archivo
`pyproject.toml`. Además, `poetry` que es nuestro manejador de paquetes, se
encarga de escribir un lockfile (`poetry.lock`) con todas las versiones de los
paquetes que necesitamos, versiones específicas, checksums, etc. Y todas las
dependencias!!! Este archivo no hay que tocarlo, se actualiza solo. 

**PERO** justamente `poetry.lock` nos impide actualizar cosas. Esto es por
diseño, es para que todos los que corremos el sitio lo hagamos con las mismas
versiones de paquetes, plugins, etc. Esto es bueno! Pero si queremos actualizar
algo, necesitamos hacerlo en pasos. 

### 1 - Editar pyproject.toml 

Para actualizar algo (ej mkdocs-material, la nueva version es 9.5.31), o agregar
algun plugin nuevo (ej mkdocs-video 1.5.0) editamos `pyproject.toml`, y editamos
la linea correspondiente, o agregamos una nueva, siguiendo la sintaxis de
[Version
specifiers](https://packaging.python.org/en/latest/specifications/version-specifiers/#)
de Python. 

```
mkdocs-material = "^9.5.31"
mkdocs-video = "^1.5.0"
```

### 2 - Actualizar poetry.lock

Ahora tenemos que generar una nueva version de poetry.lock, esto lo hacemos asi: 

```
poetry lock --no-update
```

### 3 - Actualizar los paquetes 

Ahora corremos poetry install para instalar todo. 

```
poetry install 
```

### 4 - Probar que todo funcione OK

Correr el servidor mkdocs y ver si las paginas se generan bien, que no aparezcan warnings, fallas, etc. 

```
mkdocs serve
```

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
