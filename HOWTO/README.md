Página web del curso: https://bioinformatica-iib.github.io/introduccion_bioinformatica/

## Instalación

Ver [INSTALAR.md](INSTALAR.md): instalar uv, `uv sync` y `uv run zensical serve`.
La página queda en http://localhost:8000 y se actualiza sola al guardar cambios.

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

* Esto solamente hace push a Github, no publica las paginas web (GitHub solo verifica que el sitio se genere bien). Esto está bueno para ir actualizando paginas sin que se hagan publicas. Si estamos listos para publicar: GitHub > Actions > docs > *Run workflow*, o desde la terminal

```
gh workflow run docs
```

## Template / Molde Mkdocs para cursos UNSAM

Este es un esqueleto más o menos organizado (casi listo) para armar y publicar
en la web un curso o materia. 

El material para las clases se escribe en markdown (texto plano), y se puede
editar directamente desde un repositorio (ej GitHub).

El sitio se genera con [Zensical](https://zensical.org) (sucesor de Material for MkDocs).
Consultar la documentación en
[Setup](https://zensical.org/docs/setup/basics/),
para ver como customizar las paginas de un curso (logo, colores, etc). 

Y consultar [Authoring](https://zensical.org/docs/authoring/markdown/), 
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

Cómo instalar el entorno (uv + Zensical), previsualizar el sitio localmente y
publicarlo: ver [INSTALAR.md](INSTALAR.md).

## Para actualizar la web
No alcanza con hacer push: hay que publicar con GitHub > Actions > docs > *Run workflow*, o `gh workflow run docs` (ver [INSTALAR.md](INSTALAR.md)).
