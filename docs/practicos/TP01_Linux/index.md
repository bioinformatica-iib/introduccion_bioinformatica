![Image](img/banner.jpg){ width="250", align="left" }

# **TP 1**. Introducción a Lubuntu, Bash y Programación { markdown data-toc-label = 'TP 1' }

<br>

[:fontawesome-solid-download: Materiales](https://drive.google.com/file/d/1O8PaR0AoIzyUgPwLl-nNUalnH-VLwoY3/view?usp=sharing){ .md-button .md-button--primary }
<!--
Este es el botón para decargar materiales, en (#) hay que agregar el link correspondiente
--->

### Slides mostrados en la clase

* :fontawesome-regular-file-pdf: [Introducción a la programación](https://drive.google.com/file/d/12HLvmzhoz4HToEn9280HIvPEC6NO2WPN/view?usp=sharing)
* :fontawesome-regular-file-pdf: [Cierre TP](https://drive.google.com/file/d/1O4924IOzLfZ1_y3epUKKOrvYNC0oomfj/view?usp=sharing)

### Videos de la clase grabada

* :octicons-video-16: [Presentacion de la Materia](https://youtu.be/zOnacQHwI-E)
* :octicons-video-16: [Introducción a la programación](https://youtu.be/d1P_6sJN1og)
* :octicons-video-16: [Cierre TP](https://youtu.be/pYXT8aejbWE)

<!--
### Software a usar
* Programa 1 [www.donde.lo.bajo.com](https://www.example.com)
* Programa 2 [www.donde.lo.bajo2.com](https://www.example.com)
--->

### Recursos Online
* [Command-line bootcamp](https://cli-boot.camp/)
* [Programando en Bash](https://atareao.es/tutorial/scripts-en-bash/)
* [Comando AWK](https://www.tutorialspoint.com/awk/index.htm)
* [Consola de Linux online](https://bellard.org/jslinux/vm.html?url=alpine-x86.cfg&mem=192) (y [otra](https://copy.sh/v86/?profile=linux26))
* [Compilador de Bash online](https://replit.com/languages/bash) (y [otro](https://www.onlinegdb.com/online_bash_shell))

### Objetivos

* Familiarizarse un poco con Lubuntu y su estructura de directorios
* Familiarizarse con el uso básico de los comandos de Bash
* Familiarizarse con los bloques lógicos básicos de la programación

## **Introducción al Tema**
En este trabajo práctico vamos a aprender a usar la **línea de comando** de Lubuntu (también referida como *terminal*, *consola* o *shell*). Para muchos de nosotros, que estamos acostumbrados a la interfaz gráfica de sistemas operativos como los de Windows o *GUI* (por las siglas en ingles: *Graphic User Interface*), la linea de comando puede parecer un desafío, pero con práctica y algo de paciencia descubrirán que puede resultar amena. Su uso tiene dos ventajas destacables para nuestro campo:

* Nos permitirá trabajar en entornos o programas sin interfaz gráfica (GUI)
* Mediante el uso de programas o *scripts*, nos permitirá automatizar procesos, acelerando el trabajo y minimizando la cantidad de errores que podemos cometer con tareas repetitivas

## **¿Unix? ¿Linux? ¿Ubuntu? ¿Lubuntu?** { markdown data-toc-label='¿Unix? ¿Linux? ¿Lubuntu?' }  

Dependiendo que tan familiares esten con Linux, todos estos nombres pueden resultar un poco confusos. Vamos por partes:

* **Unix** es un sistema operativo creado en 1969 por dos programadores estadounidenses que trabajaban para Bell Labs, una companía de investigación y desarrollo científico que en su momento era propiedad de AT&T (compañia estadounidense de teléfonos). Al ser un sistema operativo portable, multitarea y multiusuario se hizo rápidamente popular y se difundió por instituciones académicas y empresas

* Debido a su popularidad, otros programadores quisieron hacer sus propias versiones de sistemas operativos basados en Unix, pero como sus sistemas operativos tenían código original de Unix, AT&T los demandó, paralizando esta tendencía

* En 1983 se crea el proyecto **GNU** con el objetivo de crear un sistema operativo similar a Unix, pero gratis y de código abierto. GNU significa *"GNU's Not Unix"* (es un anagrama recursivo, los programadores se divierten barato). Hacia el fin de los 80s el proyecto ya tenía casi todos los programas que necesitaba, pero les faltaba conseguir un buen *kernel* (principal responsable de facilitar a los distintos programas acceso seguro al hardware de la computadora)

* En 1991, Linus Torvalds empieza a crear lo que terminaría siendo **Linux**, un sistema operativo con su propio *kernel* que usaba muchas de los programas del proyecto GNU. Esta versión se volvió rápidamente la más popular de todas las versiones de GNU, llevando a que en 1993 se creara el **Debian Project**, un proyecto comunal con el objetivo de mejorar una distrubución de Linux que denominaron **Debian GNU/Linux** (también llamada simplemente **Debian**).

* **Ubuntu** es una distribución de Linux creada en 2004 basada en Debian. Al día de la fecha es la distrubución más popular de Linux con más del 50% de los usuarios.

* **Lubuntu** es una distribución de Linux creada en 2009 basada Ubuntu. Es bastante similar a Ubuntu en todo lo que es consola, pero tiene una interfaz gráfica que consume menos recursos, haciendolo ideal para maquinas más viejas (o en nuestro caso, maquinas virtuales que pesen lo menos posible).

## **Estructura de directorios de Lubuntu** { markdown data-toc-label='Estructura de directorios' }  

La organización de archivos en Ubuntu y Lubuntu es bastante diferente a la de Windows. Si bien no vamos a detallar completamente toda la estructura y que es cada carpeta (porque el 95% no lo van a usar en esta materia), es importante tener una idea de lo básico:

* **/** :material-arrow-right: Carpeta raiz, o *root*. Contiene al resto de las carpetas
    * **/etc** :material-arrow-right: Configuraciones del sistema para todos los usuarios (mucho cuidado al tocar)
    * **/home** :material-arrow-right: Ubicación de los directorios de los diferentes usuarios (o en este caso el único usuario)
        * **/home/ibioinfo** :material-arrow-right: Directorio del usuario *ibioinfo*. Es el lugar donde van a trabajar la mayoría del tiempo (incluye tanto el Escritorio como Documentos) y donde se abre por defecto la terminal (más sobre esto en un ratito). Comunmente referida como *home directory* o *home* del usuario *ibioinfo*
    * **/media** :material-arrow-right: Si fuera una computadora normal (no VM) aca aparecerían los pendrives. En nuestro caso aca aparecen por defecto las carpetas compartidas con la PC host
    * **/tmp** :material-arrow-right: Ubicación de los archivos temporales de los programas
    * **/var** :material-arrow-right: Ubicación de los archivos variables de los programas, como logs, bases de datos, paginas webs, etc
        * **/var/log** :material-arrow-right: Probablemente la subcarpeta más usada de **/var**. Contiene los logs de los programas (que a veces es la única forma de saber porque algo no anduvo)

Esto es simplemente un vistazo rápido. Si quieren la lista completa de subdirectorios de Lubuntu la pueden encontrar en [esta página](https://help.ubuntu.com/community/LinuxFilesystemTreeOverview), pero tengan en cuenta que tocar cualquier cosa fuera de **/home** conlleva la posibilidad de arruinar la computadora. En esta materia vamos a usar principalmente **/home** y **/media**.

## **Línea de comando**

Como ya dijimos en la introducción la línea de comando tiene varios nombres, y en esta guia nos vamos a referir a ella como *terminal* o *consola*. Hay varias formas de abrir la terminal:

* Desde cualquier lado: ++ctrl+alt+t++
* Desde cualquier lado: **Inicio** *(menu de abajo a la izquierda)* :material-arrow-right: **Herramientas del sistema** :material-arrow-right: **LXterminal**
* Desde afuera de una carpeta: **Boton derecho en la carpeta** :material-arrow-right: **Abrir en el terminal**
* Desde adentro de una carpeta: **Herramientas** :material-arrow-right: **Abrir la carpeta actual en un terminal** (o apretar ++f4++)

La terminal funciona como un explorador de archivos que se mueve entre las carpetas. Los primeros dos métodos van a abrir la terminal en **/home/ibioinfo**, mientras que los últimos dos métodos van a abrir la terminal en la carpeta elegida. Si en algun momento les decimos que abran la terminal y no aclaramos otra cosa nos referimos a abrirla en **/home/ibioinfo**.

Abran la terminal en **/home/ibioinfo** y deberian ver algo así:


``` bash
ibioinfo@ibioinfo-VirtualBox:~$
```

Donde **ibioinfo** es el nombre del usuario actual e **ibioinfo-VirtualBox** el nombre de la computadora (que justo en este caso son similares, pero no es necesario). El **\~** después de los dos puntos (conocido como "virgulilla", "tílde" o "cosito de la ñ") parece ser parte de la terminal, pero en realidad está indicando la carpeta en la que se encuentra en este momento. Como cada usuario trabaja mas que nada en su carpeta, Lubuntu le asigna el símbolo **\~** a esa carpeta para simplificar los directorios que aparecen en la terminal. En nuestro caso **\~** equivale a **/home/ibioinfo** y puede ser que nos refiramos a esa carpeta como su *home directory* o simplemente su *home*.

!!! info

    Aclaraciones por si son fanáticos de los atajos de teclado:

    * Para copiar texto en la terminal hay que usar ++ctrl+shift+c++. En en resto de Lubuntu es normal (++ctrl+c++).
    * Para pegar texto en la terminal hay que usar ++ctrl+shift+v++. En en resto de Lubuntu es normal (++ctrl+v++).
    * De apretar ++ctrl+c++ en la terminal le estan diciendo que corte forzosamente el programa que está corriendo. Si bien hay que tener cuidado con no cortar un proceso importante a la mitad, este atajo del teclado es util si un programa se te quedó colgado o similar.

## **Bash: Ubicarse en la terminal**
La terminal acepta una variedad de comandos en lenguaje **Bash**, que es el lenguaje de la terminal de GNU. El formato general de los comandos es:

``` bash
comando -opciones parametro1 parametro2 etc
```

Donde **comando** es el nombre del programa a correr, **opciones** son comunmente una o más letras luego de un guión que indican alguna modificación a las opciones por defecto del programa, y los diferentes **parametros** son cosas que necesita el programa para correr, como puede ser un archivo que esta leyendo. Todo esto va a ir quedando más claro con los diferentes ejemplos.

### Usted está aquí

Al ser la terminal básicamente un explorador de archivos, es necesario saber en que carpeta estoy y que hay adentro de dicha carpeta. `pwd` es un comando que imprime el directorio actual en la terminal (**P**rint **W**orking **D**irectory). Pruebenlo a ver si **\~** era realmente **/home/ibioinfo**:

``` bash
pwd
```
Bien, ahora que ganamos su confianza, vean que hay adentro de esa carpeta usando `ls`:

``` bash
ls
```
Si bien por ahora todo lo que ven son carpetas azules, tengan en cuenta que `ls` va a colorear diferentes tipos de archivos (y de carpetas) de diferentes colores.

Este comando es una buena oportunidad de entender un poco mas sobre **opciones** y **parametros**. Por defecto `ls` lista los archivos de la carpeta actual, pero de darle un parámetro muestra los de dicha carpeta. Prueben correr lo siguiente:
``` bash
ls /etc/perl/Net
```
En este caso están viendo los contenidos de una carpeta diferente a donde estamos parados en la terminal. Si yo quisiera mas información sobre los archivos que se encuentran dentro de esta carpeta puedo hacer:

!!! tip

    El próximo comando es muy parecido al anterior. Pueden usar ++arrow-up++ y ++arrow-down++ en su terminal para navegar por los ultimos comandos utilizados y modificar lo necesario.

``` bash
ls -l /etc/perl/Net
```

Donde la opcion `-l` agrega información sobre los permisos del archivo (quien puede leerlo o modificarlo). Con un poco de suerte esta es la primera y ultima vez en toda la materia que vamos a hablar de los permisos de Lubuntu (y de como a veces dan dolores de cabeza).

!!! info

    La lista completa de las opciones para cada comando se puede ver con el comando `man` (de *manual*). En este caso sería `man ls`.

### Moverse entre las carpetas

Ahora que ya saben donde estan y que carpetas hay adentro es importante saber como moverse entre ellas. Esto se hace principalmente con el comando `cd`.

Asegurense que la terminal esta en su *home* y usen `ls` para ver nuevamente la lista de carpetas dentro. Primero vamos a la carpeta **Escritorio** y vemos que archivos hay adentro, para eso hacer:

!!! tip
    ++tab++ funciona como autocompletar en la consola. Al escribir el próximo comando prueben escribir solo **cd Es** y apretar ++tab++

``` bash
cd Escritorio
```

Ahora veran que la parte de la izquierda de la terminal cambio a:


``` bash
ibioinfo@ibioinfo-VirtualBox:~/Escritorio$
```

Indicando que estan en **/home/ibioinfo/Escritorio**. Usen el comando adecuado para ver que archivos hay adentro de esta carpeta.

Ahora quiero volver a su *home* y para eso escribo:

``` bash
cd ..
```

Vean ahora en que carpeta están. En todo lo que es Ubuntu y Lubuntu `..` significa "una carpeta para arriba".

¿Qué pasa entonces si estan en **/home/ibioinfo/Escritorio/TP01/Version3/Intento2/Edicion1** y quieren volver a su *home*? ¿Tienen que escribir `cd ..` 5 veces? Tecnicamente funciona, pero por defecto el comando `cd` te lleva a tu *home* si no le das ningun parámetro.

``` bash
cd
```

### Paths relativos y absolutos

Cuando corrimos `ls /etc/perl/Net` estaban ubicados en su *home* (**/home/ibioinfo**) y si vemos las carpetas dentro de *home* resulta que no existe ninguna llamada **/etc**.

* ¿Dónde está la carpeta **/etc** en relación a **/home/ibioinfo**? (ver **Estructura de directorio de Lubuntu** arriba si no se acuerdan)
* ¿Cómo pudimos acceder a **/etc/perl/Net** si la terminal estaba ubicada en una carpeta sin ninguna relación?

La respuesta a todo esto son los paths relativos y absolutos:

#### Paths absolutos

El path **/etc/perl/Net** es lo que se llama un **path absoluto**; no importa donde estén en la terminal en ese momento, **/etc/perl/Net** va a siempre apuntar al mismo lugar y el comando `ls /etc/perl/Net` va a siempre andar bien. Una forma fácil de identificar paths absolutos es que siempre empiezan en el *root* o **/**.

Recuerden que **\~** apunta a **/home/ibioinfo**, y por lo tanto el comando `cd ~/Escritorio` está usando un path absoluto, ya que sin importar de donde se use va a funcionar y va a ir a **/home/ibioinfo/Escritorio**.

#### Paths relativos

Ahora bien, cuando nosotros estabamos ubicados en *home* y corrimos `cd Escritorio` pudimos entrar a **/home/ibioinfo/Escritorio**, pero si volvieramos a correr `cd Escritorio` el comando no funcionaría, ya que no existe la carpeta **/home/ibioinfo/Escritorio/Escritorio**. Esto se debe a que en este caso **Escritorio** es un **path relativo** a la ubicación actual de la terminal. Otra forma de escribir paths relativos en Ubuntu es empezar con `.`, simbolo que indica "la carpeta actual". Volviendo al ejemplo anterior, es equivalente escribir `cd Escritorio` o `cd ./Escritorio`.

Otro caso de path relativo que ya vimos es `cd ..`, donde apunta a la "carpeta de arriba" de la posición actual de la terminal.

<br>

Ambos tipos de paths tienen sus ventajas y desventajas. Los paths absolutos tienen la ventaja de funcionar siempre, pero al usar toda la estructura toman más tiempo de escribir y son mas suceptibles a cambios de directorios (si muevo un archivo de lugar tengo que reescribir el comando). Por otro lado los paths relativos son mucho más rápidos de escribir y en muchos casos funcionan en diferentes ubicaciones (o computadoras), pero al depender de la ubicación de la terminal esto puede causar problemas si pienso que estoy en una carpeta pero estoy realmente en otra. En esta cursada vamos a usar ambos para diferentes casos.

## **Ejercicio 1. Ubicarse en la terminal** { markdown data-toc-label='Ejercicio 1' }  

1. Identifique cual o cuales de los siguientes comandos te llevarían desde cualquier carpeta al *home* del usuario **ibioinfo**.

    1. `cd ~`
    1. `cd home/ibioinfo`
    1. `cd home / ibioinfo`
    1. `cd / home / ibioinfo`
    1. `cd /home/ibioinfo`
    1. `cd /ibioinfo/home`
    1. `cd ././ibioinfo`
    1. `cd ./home/ibioinfo`

1. ¿Cambiarian la respuesta en algunos de los puntos anteriores si el usuario logueado actualmente en la computadora no es **ibioinfo**? ¿Por qué?

1. Identifique en la siguiente lista cuales paths son **paths relativos**:

    1. `/var/temp/tom_jerry`
    1. `var/temp/tom_jerry`
    1. `/home/tom/Documentos/catfood.png`
    1. `../../jerry/Documentos/cheese.png`
    1. `./Videos/Capitulos/`
    1. `~/Videos/Capitulos/`
    1. `./Descargas/tom_jerry_cap1.torrent`
    1. `/home/tom/Descargas/tom_jerry_cap1.torrent`

## **Bash: Crear y eliminar**

Todo lo que es crear, copiar, mover y eliminar archivos y directorios se puede hacer usando la interfaz gráfica como lo harían en cualquier otro sistema operativo, sin embargo hay situaciones (por ejemplo dentro de un *script*) donde es necesario hacerlo mediante la consola. Si bien por ahora les vamos a pedir que usen los siguientes comandos para prácticarlos, en el día a día hagan lo que les sea más cómodo.

### Crear y eliminar directorios

Los directorios se pueden crear con:

``` bash
mkdir FOLDER
``` 

!!! info
    
    En el resto de la guia van a aparecer ciertas palabras en mayúscula en los códigos, como por ejemplo **FOLDER**. Estas palabras son *variables* o *placeholders* que tienen que ser reemplazadas por lo que corresponda.

Donde **FOLDER** es un path absoluto o relativo con el nombre de la carpeta. Prueben ir en su terminal a **/home/ibioinfo/Documentos** y usar el comando:
``` bash
mkdir testfolder
``` 

Y vean si efectivamente apareció una carpeta nueva. Luego usen el comando de nuevo a ver que pasa.

Para eliminar directorios se puede usar:

``` bash
rmdir FOLDER
```

Por defecto este comando solo puede eliminar directorios vacios (lo cual puede no ser muy util, pero a la vez es seguro). Usen el comando anterior y borren la carpeta que acaban de crear (reemplacen **FOLDER** por lo que corresponda). Prueben correr el comando una vez más a ver que pasa.

!!! danger "Tip muy importante"

    Este es un buen momento para hablar de que nombres ponerles a las cosas que uno crea un Lubuntu. Si bien cualquier nombre funciona en un principio, por un tema de compatibilidad entre los diferentes programas que pueden llegar a usar se recomienda:

    * **Muy recomendado:** No usar comillas dobles, simples o apóstrofes
    * **Recomendado:** No usar espacios, paréntesis, Ñ, acentos, diéresis u otros diacríticos (el espacio comunmente se remplaza por un guión o guión bajo)

### Crear y eliminar archivos

Hay varias formas de crear archivos en Lubuntu y la mas simple es `touch ARCHIVO`, que crea un archivo de texto vacio donde **ARCHIVO** es el nombre del archivo (que puede incluir un path antes). Para entender lo que quiero decir vayan a su *home* y corran:

``` 
touch Documentos/testfile
```
Aca estoy usando un path relativo para crear el archivo. Se van a dar cuenta que el archivo no tiene extensión (por ejemplo **.txt**). En Lubuntu van a ver muchos archivos de texto sin extensión, pero se la pueden agregar sin problema si quieren. Entren a **Documentos** y vean si el archivo realmente existe.

Lo que le vamos a enseñar a continuación es probablemente uno de los comandos más peligrosos de Bash si se usa incorrectamente. `rm` es el comando usado para eliminar archivos (o carpetas, o discos enteros) y es la base de cientos de historias en internet de como alguien se quedó sin trabajo. El comando se usa:

```bash
rm ARCHIVO
```

Donde **ARCHIVO** es el archivo a eliminar. `rm` no les va a pedir confirmación y el archivo va a ser borrado permanentemente (si borran archivos desde la interfaz gráfica sí hay confirmación y sí van a la papelera). Entonces, con cuidado, asegurense que estan en **Documentos** y borren el archivo **testfile**.

!!! danger
    
    ¿Se entendió que hay que tener cuidado con `rm`? ¿Si? Buenisimo.

### Mover y copiar archivos y carpetas { markdown data-toc-label='Mover y copiar' }  

Adentro de **Documentos** creen una carpeta llamada **testfolder2** y dos archivos de texto vacio, uno llamado **testfile_mv** y otro **testfile_cp**. Nuestro objetivo va a ser mover **testfile_mv** a la carpeta **testfolder2** y copiar **testfile_cp** a la misma carpeta.

Los archivos se mueven con `mv` y se copian con `cp` y ambos tienen un formato similar que es

```bash
mv ARCHIVO_ORIGEN FOLDER_DESTINO
```

Donde en este caso **ARCHIVO_ORIGEN** es el archivo a mover y **FOLDER_DESTINO** el path a donde moverlo. Prueben entonces mover **testfile_mv** y copiar **testfile_cp** adentro de la carpeta **testfolder2**.

!!! tip

    Usando la opción `-i` al comando, les va a pedir confirmación si el archivo de destino ya existe. Recuerden que pueden usar `man mv` o `man cp` para ver mas opciones.

Estos dos comandos también pueden ser usados como:

```bash
mv ARCHIVO_ORIGEN ARCHIVO_DESTINO
```

En este caso **ARCHIVO_DESTINO** no es una carpeta, sino un archivo adentro del **FOLDER_DESTINO**, lo que permite renombrar el **ARCHIVO_ORIGEN** al copiarlo / moverlo. Para que se entienda mejor este uso, ubiquensé en **Documentos** y corran:

```bash
cp testfile_cp testfolder2/testfile_cp_nuevo
```

Con lo cual acabo de copiar **testfile_cp** de nuevo a la carpeta **testfolder2**, pero ahora con otro nombre. Interesantemente, usar `mv` de esta manera es la forma de Ubuntu de renombrar archivos desde la terminal. Prueben entrar a **testfolder2** y corran:

```bash
mv testfile_cp_nuevo testfile_cp_otroNombre
```
Y vean que pasó. Una vez que todo haya funcionado bien, usen `rm` para eliminar todos los **testfile** uno a uno y luego usen `rmdir` para eliminar **testfolder2**.

Ambos comandos funcionan también para copiar, mover y renombrar carpetas, en cuyo caso el formato es:

```bash
mv FOLDER_ORIGEN FOLDER_DESTINO
```

!!! danger
    
    Hay que ser cuidadosos al usar `mv` y `cp` ya que si el archivo de destino ya existe lo van a sobreescribir sin preguntar antes. A ambos comandos se le puede agregar la opción `-i` para que pregunte antes de sobreescribir de ya existir el archivo de destino.

## **Bash: Archivos de texto**

### Escribir archivos de texto

En Lubuntu hay varias formas de escribir en archivos de texto, pero una de las más útiles para nosotros va a ser el `>` quien redirige la salida de información de la consola. Se usa:

```bash
comando -opciones parametro1 parametro2 > ARCHIVO_DESTINO
```

Donde lo de la izquierda de `>` es el comando como lo correrías normalmente y **ARCHIVO_DESTINO** es un archivo donde va a ser guardada la salida de ese comando (lo que normalmente verían en la consola). Para entender un poco más, vayan a su *home* y corran:

```bash
ls -l > Documentos/output_de_ls
```

Verán que en un principio parece que no paso nada. Entren ahora a **Documentos** y van a ver que hay un nuevo archivo con el nombre **output_de_ls**.

Vamos a abir el archivo usando **Leafpad**, el editor de texto de la interfaz ǵráfica de Lubuntu. Asegurandose que estan **Documentos**, en la consola escriban:

```bash
leafpad output_de_ls
```

Van a ver que se abre el editor de texto de igual forma que si ubieran hecho doble click en el ícono en el explorador de archivos de la GUI. Puede ser que aparezca un *warning* o advertencia en la consola, pero la podemos ignorar.

!!! tip

    Por defecto **Leafpad** usa una fuente llamada **"Ubuntu"**, que si bien sirve para escribir cuentos, nos va a dar problemas al momento de ver ciertos archivos que vamos a usar en esta materia.

    En **Leafpad** vayan a **Opciones** :material-arrow-right: **Tipografía...**, seleccionen la fuente **"Ubuntu Mono"** y aprieten **Aceptar**.

    Las fuentes que tienen **Mono** en su nombre estan indicando que son monoespaciadas, o sea, que todos sus caracteres tienen el mismo ancho. Esto es ideal para cuando se quieren ver tablas o alineamientos con **Leafpad**, cosa que vamos a hacer bastante en esta materia.

**Leafpad** funciona como un editor de texto bastante normal. Agreguen una nueva linea abajo de todo (con cualquier texto) y guarden el archivo.

Al momento sabemos como guardar en un archivo de texto cualquier salida de un comando de Lubuntu, pero, ¿cómo hacemos para poner lo que nosotros queremos en un archivo de texto? Simple, ¡con otro comando de Lubuntu!

El comando `echo` hace lo que su nombre indica y devuelve por la terminal el texto que le pases. Prueben escribir `echo TEXTO`, donde **TEXTO** es cualquier oración, por ejemplo:

```bash
echo Probando, uno, dos, tres
```

Tal vez ya se dieron cuenta, pero combinando `echo` con `>` podemos escribir nuestros propios archivos de texto desde la terminal. Asegurandose que estan adentro de **Documentos**, corran:

```bash
echo Esta es la primera linea del documento > mi_documento
```

Confirmen que se escribió el archivo y que tiene el texto adentro. ¿Qué piensan que pasa si ahora corró el siguiente comando? Pruebenló:

```bash
echo Quiero agregar otra linea al documento > mi_documento
```

Usen **Leafpad** para leer el documento. Van a ver que la primera linea que agregamos desapareció. Esto es porque cada uso de `>` sobreescribe el archivo. Si queremos agregar otra linea a un documento que ya tiene información tenemos que usar el comando `>>` quien agrega el texto al archivo en una nueva linea al final sin modificar el contenido anterior. Así que ahora que sabemos esto podemos correr estos dos comandos:

```bash
echo Esta es la primera linea del documento > mi_documento
echo Esta es la segunda linea del documento >> mi_documento
```

Y vean con **Leafpad** si funcionó como queríamos.

!!! danger
    
    Hay que ser cuidadosos al usar `>` ya que si el archivo de destino ya existe lo va a sobreescribir sin preguntar antes.

### Leer archivos de texto

Qué comando usar al leer archivos de texto en la consola depende mucho de que tan largo es el archivo y que me interesa de él:

* ¿Tiene solo pocas lineas de texto?

    `cat` va a abrir el archivo y escribirlo todo en la terminal.

* ¿Tiene muchas lineas de texto y quiero ver las primeras páginas a ver de que se trata?

    `less` va a abrir el archivo y mostrar solo el texto que entra en la terminal. Aprentando ++space++ pasa a la próxima página y apretando ++q++ deja de leerlo.

* ¿Tiene muchas lineas de texto y quiero ver solo las primeras lineas?

    `head` te muestra las primeras 10 lineas del archivo. Se puede especificar la cantidad de lineas agregando una opción, por ejemplo, `head -3` muestra solo las primeras 3 líneas.

* ¿Tiene muchas lineas de texto y quiero ver solo las últimas lineas?

    `tail` te muestra las últimas 10 líneas del archivo. Este número se puede cambiar de la misma forma que para `head`.

* ¿No saben que tan largo es un archivo dado?

    Pueden averiguarlo con el comando `wc`, que devuelve el numero de lineas, palabras y letras (en ese orden) en el archivo. De pasarle la opción `-l`, el comando devuelve solo el número de lineas.

Todos estos funcionan de la forma:

```bash
comando ARCHIVO
```

Usando el archivo **martin_fierro** que se encuentra en los materiales del TP (boton al principio de todo), prueben los 5 comandos anteriores.

### Buscar palabras en archivos de texto { markdown data-toc-label='Buscar palabras' }  

Va a ser común cuando trabajemos con tablas que nos interese encontrar filas con cierto valor y una forma rápida de hacer eso es usar `grep`, comando al que le pasas una palabra o patrón y busca filas dentro de un archivo que contengan dicha palabra o patrón. En formato general el comando es:

```bash
grep PALABRA ARCHIVO
```

Usando el archivo **martin_fierro** con en que trabajamos en la sección anterior podemos correr:

```bash
grep cantar martin_fierro
```

Y vamos a ver todas las lineas del documento donde aparece la palabra "cantar". Hay mucho para hablar sobre `grep`, pero por ahora lo que nos va a importar es:

* La opción `-v` devuelve las líneas que **no** contienen **PALABRA**
* La opción `-c` devuelve el número de líneas que contienen **PALABRA**
* Es posible pasarle varias opciones a un programa. De hacer `grep -v -c` voy a estar contando el número de líneas que **no** contengan **PALABRA** (el orden de las opciones no afecta el comportamiento)

!!! info

    Mencioné antes que `grep` también funciona con patrones, quienes son conocidos como Expresiones Regulares, o **RegEx**. Como este es un tema complejo y ya tenemos bastante que procesar no vamos a profundizar mas sobre ellos en este momento, pero explicaremos cualquier patrón que usemos en la materia cuando aparezca.

### Combinar comandos

En Bash es posible combinar comandos, lo que quiere decir pasarle la salida de un comando directamente como entrada a otro comando. Esto se hace dividiendo los diferentes comandos con **|** (o *pipe*).

Para entender un poco mejor veamos un ejemplo. Digamos que quiero ver las cuales de las primeras 10 lineas del archivo **martin_fierro** contienen la palabra "cantar". Para esto tengo que hacer:

```bash
head -10 martin_fierro | grep cantar
```

Fijensé que en este caso parecería que a `grep` no le estoy pasando ningun **ARCHIVO**, pero lo que pasa es que va usar como entrada la salida de `head`. De esta forma se puede concatenar cualquier cantidad de comandos que seran ejecutados de izquierda a derecha.

## **Ejercicio 2. Archivos de texto** { markdown data-toc-label='Ejercicio 2' }  

Para este ejercicio vamos a seguir usando el archivo **martin_fierro**. 

1. ¿Cuántas líneas tiene el archivo?

1. ¿Cuántas líneas contienen la palabra "cantar"?

1. ¿Cuántas líneas **no** contienen la palabra "guitarra"?

1. Cree otro archivo de texto llamado **martin_fierro_sinA** con las líneas del archivo **martin_fierro** que no tengan la letra "a".

1. Sin borrar el contenido y usando la consola, agregue una línea al final de **martin_fierro_sinA** que indique el autor del Martin Fierro (José Hernández).

1. Volviendo al archivo original, ¿cuántas líneas **no** contienen la letra "o" y **sí** contienen la letra "i"? (Tip: use `|` para encadenar comandos)

## **Bash: Programación y Scripts**

!!! info

    A continuación vamos a ver una pequeña introducción a la programación usando Bash como lenguaje. El objetivo de lo que sigue no es aprenderse de memoria las estructuras y si hay que poner una llave aca o dejar un espacio allá, sino entender la lógica detrás de la programación y como se pueden usar variables, condicionales y ciclos para obtener el resultado deseado.

### Scripts

Los *scripts* de Bash son básicamente una lista de muchos de los comandos que nosotros corrimos en la terminal, pero escritos dentro de un archivo. Al ejecutar ese archivo todos los comandos dentro de él serán corridos uno a uno de arriba a abajo.

Para simplificar un poco la tarea y enfocarnos en lo que importa en esta sección, vamos a utilizar la interfaz gráfica de Lubuntu. Vayan a **Documentos** y creen un archivo llamado **primer_programa.sh** (Boton derecho :material-arrow-right: Crear nuevo... :material-arrow-right: Archivo vacío). Luego abran el archivo en **Leafpad** (doble click) y escriban lo siguiente:

```bash
echo "----------------"
echo "| Hello world! |"
echo "----------------"
```

Ahora salven el archivo, abran la terminal en esa carpeta (++f4++) y vamos a ejecutar el script con:

```bash
bash primer_programa.sh
```

¡Felicidades, ya pueden decir que son programadores!

Como pudieron observar, los scripts de Bash se corren con el comando `bash SCRIPT` y al hacerlo se ejecutaron los 3 comandos `echo` en el orden que estaban dentro del script. Este tipo de scripts son útiles si quiero dejar evidencia de los comandos que corrí en Bash, ya sea para volver a hacerlo otro día o para pasarselos a alguién más y que los corra en su propia computadora; sin embargo, para realmente programar necesitamos más herramientas.

### Variables

Las variables son *palabras* que guardan dentro de ellas un número o un *string* (texto), entre otro tipo de valores posibles que veremos más adelante. Veamos un ejemplo de como usar variables (vean ambas pestañas):

=== "Código"

    ``` bash
    nombre="Unsamer" 

    echo "Hola $nombre, ¿todo bien?"
    ```

=== "Código con comentarios"

    ``` bash
    # Las lineas que empiezan con # son comentarios, no afectan el código y sirven para aclarar que estas 
    # haciendo en tu programa o script

    # Al declarar una variable en Bash no se puede poner espacio entre la variable, el = y el valor
    # Las comillas se usan para indicar que lo de adentro es una cadena de caracteres, o *string*
    nombre="Unsamer" 

    # Cuando se usa la variable, se le agrega el prefijo $
    echo "Hola $nombre, ¿todo bien?"
    ```

¿Qué piensan que va a pasar de correr este código en un script? Pruebenló.

!!! info

    Desgraciadamente Bash es muy estricto al momento de programar y perdona bastante poco (como por ejemplo el tema de tener un espacio más o menos). Más adelante vamos a usar el lenguaje **R** que va a ser una de nuestras principales herramientas al momento de analizar y plotear datos y es mucho más amigable.

En este momento pueden estar pensando que hubiera sido mucho más fácil poner solo `echo "Hola Unsamer, ¿todo bien?"` y ahorrarme el tema de la variable. Tienen razón. Por ahora.

¿Se acuerdan de los **parametros** de los comandos de Bash? Al pasarle parámetros a un script de Bash estos se asignan automaticamente a variables llamadas `$1`, `$2`, etc. Editemos ahora nuestro código anterior:

=== "Código"

    ``` bash
    nombre=$1

    echo "Hola $nombre, ¿todo bien?"
    ```

=== "Código con comentarios"

    ``` bash
    # $1 es el primer parametro que se le pasa al script de Bash
    # Le estoy asignando el valor de una variable a otra variable. $1 sigue existiendo, pero no la uso más
    nombre=$1

    # Podría usar $1 directamente aca, pero así se entiende mucho más lo que hace el código al leerlo
    # (y para programas muy complicados esto es muy importante)
    echo "Hola $nombre, ¿todo bien?"
    ```

Y ahora corran:

```bash
bash SCRIPT "NOMBRE"
```

Por si la versión genérica no queda claro, si el script se llamara **saludo.sh** y quiero conseguir el mismo resultado que antes habría que correr:

```bash
bash saludo.sh "Unsamer"
```

!!! info

    Tecnicamente si estoy pasando solo una palabra las comillas no son necesarias, pero si el *string* que estoy pasando tiene un espacio tengo que ponerlas si o si.

Hay bastante más para hablar de las *variables*. Existen muchos tipos más de variables, como *booleanos* (variable que es verdadera o falsa), *arreglos* (o vectores) y listas. Otros lenguajes de programación hasta tienen variables más complejas que pueden almacenar tablas enteras. Sin embargo, lo que acabamos de aprender es la base y va a ser suficiente por ahora. Más información sobre las variables en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/variables-en-bash/).

### Condicionales

Las variables son importantes, pero gran parte de la programación es controlar el "flujo" del programa, es decir, que un script haga algo más que simplemente ir de arriba a abajo ejecutando comandos. La primera herramienta que vamos a aprender para controlar el flujo del programa son los *condicionales* que permiten crear secciones de código que se van a ejecutar solo si se cumple (o no se cumple) una condición. Por ejemplo:

=== "Código"

    ``` bash
    numero=$1

    echo "$numero es un numero"

    if (($numero > 10))
    then
        echo "$numero es mayor a 10"
    fi
    ```

=== "Código con comentarios"

    ``` bash
    # Igual que antes estoy agarrando un parámetro al correr el script
    numero=$1

    echo "$numero es un numero"

    # *if* es la estructura más usada para condicionales.
    # Adentro de los dobles paréntesis va la condición.
    # > es el comparador, o sea, estamos preguntando si $numero es mayor que 10
    if (($numero > 10))
    then
        # El codigo entre *then* y *fi* solo si ejecuta si la condición es verdad, de otra forma se saltea
        # Este codigo esta más a la derecha, o *indentado*. Esto se hace con tab y en la mayoría de los lenguajes
        # es solo para entender más fácil el código
        echo "$numero es mayor a 10"
    fi
    # *fi* indica donde termina el condicional
    ```

Copien este código a un script y prueben pasarle números menores y mayores a 10 a ver que pasa.

!!! info

    Es importante remarcar que la condición del *if* (lo que en este caso se encuentra entre los corchetes) es básicamente una pregunta que puede tener solo una de dos respuestas posibles: **Sí** (llamada en programación **Verdadero** o **True**) ó **No** (llamada en programación **Falso** o **False**)

Como dije antes a un condicional se le puede poner también que pase algo cuando no es verdad, por ejemplo:

=== "Código"

    ``` bash
    numero=$1

    echo "$numero es un numero"

    if (($numero > 10))
    then
        echo "$numero es mayor a 10"
    else
        echo "$numero es menor o igual a 10"
    fi
    ```

=== "Código con comentarios"

    ``` bash
    numero=$1

    echo "$numero es un numero"

    if (($numero > 10))
    then
        # Ahora si la condición es verdad se va a ejecutar el código entre *then* y *else* y luego va a 
        # seguir a partir de *fi*
        echo "$numero es mayor a 10"
    else
        # El código entre *else* y *fi* se ejecuta solo cuando la condición no es verdad
        echo "$numero es menor o igual a 10"
    fi
    ```

Hay bastante más para hablar de los *ifs*. Hay muchos más comparadores y son diferentes si estoy comparando números o *strings*. Hay formas de poner más de una condición por *if* y hay otras estructuras como son los *case* que cumplen una función similar. Sin embargo, lo que acabamos de aprender es la base y va a ser suficiente por ahora. Más información sobre los condicionales en Bash, incluyendo una lista más detallada de los comparadores, se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/condicionales-en-bash/) y en [esta página](https://tldp.org/LDP/abs/html/comparison-ops.html) (en Bash las condiciones pueden estar rodeadas por paréntesis o corchetes y en cada caso los comparadores se comportan diferente, ojo con esto).

### Ciclos

Digamos que por alguna extraña razón quieren imprimir los numeros del 1 al 10 en la consola, tendrían que hacer `echo 1`, `echo 2`, etc, hasta llegar a `echo 10`. ¿Qué pasa si ahora les pido del 1 al 100, o al 1000?. Por suerte existen los *ciclos*, que son estructuras que nos permiten repetir algo varias veces y al usar variables podemos hacer que cada vez sea ligeramente diferente a la anterior.

=== "Código"

    ``` bash
    for ((i=1;i<=1000;i++))
    do
        echo $i
    done
    ```

=== "Código con comentarios"

    ``` bash
    # *for* es una de las estructuras más usadas para hacer ciclos
    # *i* es el nombre de la variable que va a cambiar de valor en cada ciclo. Se le podria poner cualquier nombre a 
    # ésta variable, por ejemplo *numero* en nuestro caso, pero es costumbre ponele *i*
    # i=1 indica que el primer valor de $i es 1
    # i<=1000 indica que el ciclo se va a repetir mientras $i sea menor o igual a 1000
    # i++ indica que al final de cada ciclo el valor de $i va a subir en 1
    for ((i=1;i<=1000;i++))
    do
        # El código entre *do* y *done* se va a ejecutar una vez para cada posible $i en el rango
        echo $i
    done    
    ```

Hay otra versión del *for* que comunmente se denomina *for each*. En este caso `$i` no representa números que aumentan, sino diferentes elementos en una lista. Por ejemplo:

=== "Código"

    ``` bash
    for color in rojo amarillo verde
    do
        echo "Este es el color $color"
    done
    ```

=== "Código con comentarios"

    ``` bash
    # Como ahora la variable son elementos de una lista le pongo el nombre *color* para que se sepa que es, 
    # pero podría ser *i*
    # Esta es una forma bastante mala de usar listas de elementos, donde la estoy declarando en el mismo *for*;
    # comunmente las listas existen de antes en el programa o las obtengo de un archivo o comando de Lubuntu
    for color in rojo amarillo verde
    do
        echo "Este es el color $color"
    done
    ```

Hay bastante más para hablar de los *ciclos*. Se pueden hacer ciclos que aumenten de 2 en 2 o hacer ciclos que disminuyan. Hay otros dos tipos de ciclos comunmente denóminados *while* y *until* (tambien llamado *do*) y hay formas de forzar salir del ciclo o pasar a la próxima iteración con *break* y *continue* (tambien llamado *next*). Sin embargo, lo que acabamos de aprender es la base y va a ser suficiente por ahora. Más información sobre los ciclos en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/bucles-en-bash/).

## **Ejercicio 3. Programación en Bash** { markdown data-toc-label='Ejercicio 3' }

El objetivo de este ejercicio es hacer un script que:

* Use por lo menos un *for* y un *if*
* Recorra los números del 1 al 10
* Por cada uno de esos números cree un archivo llamado **archivo_NUMERO**, dónde hay que reemplazar **NUMERO** por el número correspondiente (de 1 a 10)
* En los primeros 5 archivos (**archivo_1** a **archivo_5**) escriba el texto:
    ```
    Primera parte. Este es el archivo NUMERO.
    ```
    Donde hay que reemplazar **NUMERO** por el número correspondiente (de 1 a 5)
* En los últimos 5 archivos (**archivo_6** a **archivo_10**) escriba el texto:
    ```
    Segunda parte.
    Este es el archivo NUMERO.
    ```
    Donde hay que reemplazar **NUMERO** por el número correspondiente (de 6 a 10). Noten que ambas oraciones están en lineas diferentes

Ahora que sabemos nuestro objetivo vayan a **Documentos** y creen una nueva carpeta donde vamos a trabajar llamada **TP01_EJ3**. Dentro de ella creen un archivo vacio llamado **crear_archivos.sh** que va a ser nuestro script.

Al momento de hacer programas complejos, especialmente en un lenguaje que recién aprenden, es recomendado ir por partes e ir probando en el medio. Unos posibles pasos a seguir son:

!!! info

    La idea de hacerlo así es ir probando de a poco si aparece algun error. ¡Prueben el script entre cada paso!

1. Modifiquen el script para que cree un archivo llamado **archivo_1** que adentro tenga el texto: 

    ```
    Primera parte. Este es el archivo 1.
    ```

1. Agreguen un *for* que vaya de 1 a 5 y cree los archivos **archivo_1** a **archivo_5** que adentro tengan el texto:


    ```
    Primera parte. Este es el archivo NUMERO.
    ```

    Donde hay que reemplazar **NUMERO** por el número correspondiente (de 1 a 5).

1. Expandan el *for* para que vaya de 1 a 10. Agreguen un *if* adentro del *for* que haga que los archivos se creen solo para los primeros 5 ciclos.

    !!! tip

        Aca les puede venir bien el comparador `<=`, que significa "menor o igual". Un ejemplo de `<=` seria:

        ``` bash
        if (($1 <= 7))
        ```

        Que en este caso es verdadero cuando el parámetro `$1` es menor o igual a 7.

1. Agreguen un *else* al *if*, recordando que los comandos adentro del *else* se van a ejecutar cuando la condición no sea verdadera. Asumiendo que usaron `<=` en la condición del *if*, modifiquen los comandos adentro del *else* para que en ese caso se creen los archivos **archivo_6** a **archivo_10** que adentro tengan el texto:

    ```
    Segunda parte.
    Este es el archivo NUMERO.
    ```

    Donde hay que reemplazar **NUMERO** por el número correspondiente (de 6 a 10).

¡Y listo, deberían tener su programa andando!

## **Bash: Tablas**

Lo ultimo que vamos a aprender hoy es un pequeño vistazo a como se pueden manipular tablas desde la consola de Lubuntu. Descarguen el archivo **mtcars** que se encuentra en los materiales del TP (boton al principio de todo) y ponganlo en **Documentos**. Esta tabla viene por defecto con el lenguaje de programación **R** y nos va a servir para aprender como manipular tablas en Bash. 

Abran el archivo con **Leafpad** (doble click). Podemos ver que es una tabla en formato texto, donde la primera línea es el encabezado o *header* de la tabla y en cada líńea las columnas están separadas entre ellas con un ++tab++ (a estos archivos se los conoce como **TSV** o "Tab-Separated Values"). Es bioinformática es muy común querer seleccionar columnas específicas en una tabla, o filtrar filas debido al valor de una de sus columnas; esto es lo que vamos a aprender a continuación.

??? info "Columnas de mtcars"

    **mtcars** es una tabla que viene por defecto con el lenguaje de programación **R**, sus columnas son:

    | Nombre { data-sort-method='none' } | Descripción { data-sort-method='none' } |
    | :--- | :--- |
    | car_name    | Name of the car |
    | mpg         | Miles/(US) gallon |
    | cyl         | Number of cylinders |
    | disp        | Displacement (cu.in.) |
    | hp          | Gross horsepower |
    | drat        | Rear axle ratio |
    | wt          | Weight (1000 lbs) |
    | qsec        | 1/4 mile time |
    | vs          | Engine (0 = V-shaped, 1 = straight) |
    | am          | Transmission (0 = automatic, 1 = manual) |
    | gear        | Number of forward gears |
    | carb        | Number of carburetors |

### AWK

El comando `awk`  (que recibe su nombre de las iniciales de los apellidos de las 3 personas que lo crearon) es uno de los comandos mas usados en Bash para manipular tablas por su gran flexibilidad, hasta el punto que es posible incorporar condicionales y ciclos dentro de él. La forma más simple del comando es:

``` bash
awk -opciones 'instrucciones' ARCHIVO_TABLA
```

Donde **ARCHIVO_TABLA** es el archivo que contiene a la tabla e **instrucciones** es que hacer con ese archivo una vez que se abra (las instrucciones siempre tienen que estar delimitadas por comillas simples, o `'`). Colocando a nuestra terminal en **Documentos** podemos correr:

``` bash
awk -F "\t" '{print}' mtcars
```

Donde `-F` es la opción que le dice a `awk` cual es el caracter que separa las diferentes columnas (en este caso es `\t`, que es el símbolo de ++tab++) y `{print}` es la instrucción que simplemente dice que imprima en pantalla la tabla.

Lo importante de `awk` es que nos permite trabajar con columnas individuales. Por ejemplo si ponemos:

``` bash
awk -F "\t" '{print $1}' mtcars
```

Vemos que `awk` imprime solo la primera columna, que en este caso es el nombre de los autos. Podemos asumir entonces que cada columna se puede referir con `$1`, `$2`, etc. Probemos imprimir muchas columnas corriendo:

``` bash
awk -F "\t" '{print $1 $3 $5}' mtcars
```

¿Qué ven que pasa aca?

Debido a como funciona `print`, las diferentes columnas se imprimeron una pegada a la otra sin dejar espacios. Si quisieramos imprimir las columnas separadas con ++tab++ como la tabla original tenemos que hacer:

``` bash
awk -F "\t" '{print $1 "\t" $3 "\t" $5}' mtcars
```

Ahora bien, una actividad normal cuando se tienen tablas con muchos datos es filtrar mis datos por alguna columna, o dicho de otra forma, usar condicionales. Un ejemplo de esto en `awk` seria:

``` bash
awk -F "\t" '{if ($3 == 6) {print}}' mtcars
```

¿Qué les parece que hace ese comando? Piensen que estan viendo una estructura de *if* que no vieron antes, pero aun así probablemente puedan inferir que va a hacer el comando pensando en como funcionaba el *if* de Bash que aprendimos arriba. Esto es super normal en la programación, donde la estructura exacta cambia, pero la lógica detrás se mantiene constante.

Entonces, aca le estan diciendo a `awk` que imprima en la pantalla todas las filas que tengan un valor de 6 en la columna 3 (que si se fijan es *cyl*, o el número de cilindros).

Como siempre hay mucho más para decir sobre `awk`, pero por hoy estamos bien. Sepan sin embargo que `awk` tiene su propio `grep` y su propio *for*, que se pueden declarar variables dentro de él y que tiene hasta una lista de comandos propios. Pueden ver mucha más información de `awk` en [esta página](https://www.tutorialspoint.com/awk/index.htm).

## **Ejercicio Adicional 1. Programación en Bash v2** { markdown data-toc-label='Ejercicio Adicional 1' }

!!! info

    Algunas guias van a tener ejercicios adicionales, que son ejercicios que pueden hacer si quieren practicar más el tema, pero no son obligatorios. Estos ejercicios pueden llegar a ser un poco más complicados que los ejercicios de la guía.

El objetivo de este Ejercicio va a ser hacer un script que:

* Reciba un número por consola (vamos a asumir que dicho número va a ser siempre un número entero entre 1 y 1000)
* Recorra todos los números entre 1 y el número que recibió por consola
* Para cada uno de esos números vea si es par
* Imprima los números pares por consola

Dos cosas que van a necesitar para hacer esto son:


``` bash
# El operador % calcula el resto entre 2 números
# En este caso $resto va a contener el resto de dividir 5 por 2 (que es 1)
# Una forma muy usada en programacíon para ver si un número es par es ver si su resto al dividirlo por 2 es 0
# Los paréntesis y signo $ bordeando a la operación son necesarios para que funcione bien en Bash
resto=$((5 % 2)) 

# == es el comparador para igualdad usado en los *ifs*
# Va a ser verdadero solo si lo de la izquierda es identico a lo de la derecha.
if (($1 == 2))
```

Para hacer este ejercicio pueden usar como base el código creado en el **Ejercicio 3** que ambos tienen una estructura general bastante similar.

<!--
Si quieren pueden intentar programar directamente, pero para hacer programas complejos, especialmente en un lenguaje que recién aprenden, es recomendado ir por partes e ir probando en el medio. Unos posibles pasos a seguir son:

!!! info

    La idea de hacerlo así es ir probando de a poco si aparece algun error. ¡Prueben el script entre cada paso!

1. Creen un script en el que se declare una variable llamada `$numero` y la imprima en la terminal.
1. Agreguen al script otra variable llamada `$resto`, que va a ser el resto de dividir a `$numero` por 2. Hagan que el script imprima tanto `$numero` como `$resto` (en 2 lineas diferentes).
1. Agreguen un condicional que vea si `$resto` es 0 (y por lo tanto si `$numero` es par). De ser verdadero, hagan que imprima "es par".
1. Agreguen un ciclo que vaya de 1 a `$numero` e imprima todos esos números.

En este momento tenemos todos los elementos necesarios andando, pero hay que borrar algunas lineas, reescribir pedazos de otras lineas y mover algunos bloques adentro de otros. Traten de pensar que hay que modificar para conseguir nuestro objetivo. No es trivial esto, asi que si ven que se les complica lean las instrucciones siguientes:

??? info "Spoilers"
    1. Borren la linea que imprime `$resto` y la linea que imprime `$numero` (no nos interesa esta salida)
    1. Muevan la declaración de `$resto` y el *if* adentro del *for* (ya que tengo que ver si cada uno de los números del for es par)
    1. Cambien la declaración de `$resto` para que calcule el resto de dividir `$i` por 2 y no `$numero`
    1. Muevan la linea que imprime `$i` adentro del *if* (que ahora está a su vez adentro del *for*) y borren la linea que imprime "es par" (porque yo quería los números)
    1. Cambien la declaración de `$numero` al principio de todo para que tome el primer parámetro pasado en la consola

¡Y listo, deberían tener su programa andando!
-->

## **Bibliografía**

<!--
### :material-bookshelf: Libros
* Libro 1 
* Libro 2
-->

<!--
### :material-web: Online
* Online 1 
* Online 2
-->

### :material-console-line: Consola
* Comando `man`
