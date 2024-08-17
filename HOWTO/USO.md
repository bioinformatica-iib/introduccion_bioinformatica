# USO

Acá una breve guía de cómo usar este sitio. Para mas referencias sobre como usar tablas, incluir código, advertencias, diagramas, emojis, iconos, etc. ver 

 * Referencia Material for Mkdocs: https://squidfunk.github.io/mkdocs-material/reference/


## Como editar y actualizar el sitio

Brevemente:

 * Editar mkdocs.yml y customizar
 * Crear contenido:
    * llenar información general (acerca, cronograma, docentes, etc.)
    * seguir orden de carpetas y subcarpetas para distintos tipos de materiales
    * crear un archivo `index.md` en cada carpeta y escribir el contenido
    * poner imagenes (.svg, .png, .jpg) en las mismas carpetas para que sea mas facil linkearlas
    * poner papers (.pdf) y otros materiales linkeados desde las paginas en los mismos directorios donde está el `index.md` correspondiente, asi es mas facil linkearlos
    * el menu de navegación se genera en forma automática, pero algo de control hay para mostrar/ocultar links, eso lo manejamos en `mkdocs.yml` en la sección `nav`
 * Commit al repo: subir cambios al repo github
    * agrega un comentario descriptivo de todos los cambios hechos!
 * Actualizar la web

### Commit al repo 

Git maneja siempre dos repositorios, el local, que es donde trabajamos y el remoto (upstream), en GitHub en nuestro caso. Esta es una buena rutina de trabajo para subir cambios. Ejemplo con mensaje de commit corto: 

```
# siempre es una buena idea traer todos los cambios que haya upstream 
# antes de hacer o subir nuevos cambios
git pull 

# commit local changes to local repo
git commit -m "agrego material teorica 5"

# push local commits upstream to remote repo
git push 

```

Y acá un ejemplo con un mensaje de commit mas largo y descriptivo: 

```
# siempre es una buena idea traer todos los cambios que haya upstream 
# antes de hacer o subir nuevos cambios
git pull 

# describir cambios 
cat > cambios.txt << FIN
Actualizacion de paquetes y plugins
  * actualizo mkdocs a 9.5.31
  * remuevo plugins obsoletos
  * remuevo carga javascript (polyfill) desde sitios inseguros
 FIN

# commit local changes to local repo
git commit --file cambios

# veamos qué paso con git log
git log -n1


# push local commits upstream to remote repo
git push 

```

### Para actualizar la web
Una vez que se hacen cambios y se realiza un commit, para que esto aparezca en el sitio web hay que hacer el deployment corriendo en el mismo directorio:

```
mkdocs gh-deploy
```

Los cambios deberían aparecer en breve en la página web de la materia: https://bioinformatica-iib.github.io/introduccion_bioinformatica/