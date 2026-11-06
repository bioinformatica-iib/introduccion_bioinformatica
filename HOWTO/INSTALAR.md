# INSTALAR

Cómo preparar el entorno para editar el sitio localmente, verlo en tiempo real
y probar cambios antes de publicarlos. El sitio se genera con
[Zensical](https://zensical.org) (sucesor de Material for MkDocs) y el entorno
lo maneja [uv](https://docs.astral.sh/uv/).

## Instalación (una sola vez)

1. Instalar uv (Linux / macOS / WSL; para Windows ver la
   [documentación de uv](https://docs.astral.sh/uv/getting-started/installation/)):

    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```

2. Clonar el repositorio y crear el entorno:

    ```bash
    git clone https://github.com/bioinformatica-iib/introduccion_bioinformatica.git
    cd introduccion_bioinformatica
    uv sync
    ```

`uv sync` crea la carpeta `.venv/` **dentro del repositorio** con las versiones
exactas que figuran en `uv.lock` (y descarga Python si hace falta). No instala
nada en el Python del sistema ni en otros entornos (no hace falta conda).
Borrar `.venv/` elimina todo.

## Previsualizar el sitio

```bash
cd introduccion_bioinformatica
uv run zensical serve
```

El sitio queda en http://localhost:8000 y se actualiza solo cada vez que se
guarda un archivo (`.md`, `mkdocs.yml`, etc.).

Alternativa: activar el entorno una vez por terminal y usar los comandos directamente:

```bash
source .venv/bin/activate
zensical serve
```

Si después de un `git pull` cambió `uv.lock`, `uv run` actualiza el entorno solo.

## Publicar

Hacer `git push` **no publica** el sitio: GitHub solamente verifica que se
genere sin errores (pestaña *Actions*, workflow `docs`). Para publicar:

* en GitHub: *Actions* → *docs* → *Run workflow* (rama `main`), o
* desde la terminal: `gh workflow run docs`

Los cambios aparecen en https://bioinformatica-iib.github.io/introduccion_bioinformatica/ en uno o dos minutos.

## Actualizar Zensical u otros paquetes

Los paquetes están en `pyproject.toml` (sección `dependencies`) y las versiones
exactas en `uv.lock`, que no se edita a mano.

```bash
# actualizar zensical a la última versión: editar la versión en pyproject.toml, y luego
uv lock --upgrade-package zensical
uv run zensical build --clean   # verificar que todo se genere sin errores
git add pyproject.toml uv.lock && git commit -m "actualizo zensical a X.Y.Z"
```

## Configuración

La configuración del sitio sigue en `mkdocs.yml` (Zensical lo lee directamente).
Documentación: [configuración](https://zensical.org/docs/setup/basics/) y
[cómo escribir contenido](https://zensical.org/docs/authoring/markdown/)
(notas, pestañas, tablas, íconos, fórmulas, etc.).
