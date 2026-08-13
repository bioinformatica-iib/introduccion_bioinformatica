---
title: Practico Uno
icon: octicons/terminal-16
tags: 
  - practicos
---
![Image](img/banner.jpg){ width="250", align="left" }

# **TP 1**. Introducción a Ubuntu, Bash y Programación { markdown data-toc-label = 'TP 1' }

<br>

[:fontawesome-solid-download: Materiales](data/datos.zip){ .md-button .md-button--primary }

<!--
[:fontawesome-solid-file-powerpoint: Slides (Parte 1)](https://drive.google.com/file/d/1fRzQTHcYZH0VMC097lfyJiB7VqM5y5sF/view?usp=sharing){ .md-button .md-button--primary } 
[:fontawesome-solid-file-powerpoint: Slides (Parte 2)](https://drive.google.com/file/d/1kAgYljsaTRXuabzc149CQCi5hyjiM41t/view?usp=sharing){ .md-button .md-button--primary }
[:fontawesome-solid-file-powerpoint: Resolución Ejercicio 3](https://drive.google.com/file/d/1HYZKJGnIIynY2sn59Pmj7gaezNB7g70L/view?usp=sharing){ .md-button .md-button--primary }
-->

### Recursos Online
* [Programando en Bash](https://atareao.es/tutorial/scripts-en-bash/)
* [Comando AWK](https://www.tutorialspoint.com/awk/index.htm)
* [Consola de Linux online](https://bellard.org/jslinux/vm.html?url=alpine-x86.cfg&mem=192) (y [otra](https://copy.sh/v86/?profile=linux26))
* [Compilador de Bash online](https://replit.com/languages/bash) (y [otro](https://www.onlinegdb.com/online_bash_shell))

## Objetivos
1. Familiarizarse con el uso de la terminal y sus comandos básicos para navegar, crear directorios y manipular archivos.

2. Obtener y procesar datos biológicos reales usando herramientas de línea de comandos.

3. Automatizar tareas utilizando  scripts, para procesar múltiples archivos.

## **Introducción al Tema**
En este trabajo práctico vamos a aprender a usar la **línea de comando** de Ubuntu (también referida como *terminal*, *consola* o *shell*). Para muchos de nosotros, que estamos acostumbrados a la interfaz gráfica de sistemas operativos como los de Windows o *GUI* (por las siglas en ingles: *Graphic User Interface*), la línea de comando puede parecer un desafío, pero con práctica y algo de paciencia descubrirán que puede resultar amena. Su uso tiene dos ventajas destacables para nuestro campo:

* Nos permitirá trabajar en entornos o programas sin interfaz gráfica (*GUI*).
* Mediante el uso de programas o *scripts*, nos permitirá automatizar procesos, acelerando el trabajo y minimizando la cantidad de errores que podemos cometer con tareas repetitivas.

## Definición y perfil del bioinformático

El término "bioinformático" es amplio y no refiere a un único perfil. Un bioinformático posee, de manera combinada:

- Conocimiento de un dominio biológico específico (genómica, proteómica, metabolómica).
- Habilidades informáticas (programación, análisis estadístico).

La formación habitual incluye un título en ciencias o computación, más un posgrado en bioinformática o experiencia equivalente.

Las tareas que realizan incluyen:

- Colaboración con investigadores.
- Asesoramiento en recolección, gestión y visualización de datos.
- Asesoramiento en diseño experimental.
- Procesamiento de datos y análisis estadístico.
- Desarrollo de pipelines de análisis a medida.

## La bioinformática como ciencia experimental

El uso de cualquier método computacional (algoritmo, pipeline, herramienta) para responder una pregunta biológica constituye un experimento. Como todo experimento, requiere:

- **Controles positivos y negativos** adaptados al problema.
- **Registro de los parámetros** de ejecución.
- **Reproducibilidad**: tener en cuenta que las bases de datos y las versiones de los programas cambian, lo que puede impedir replicar exactamente un resultado.
- **Conocimiento de las limitaciones del método**, que se obtiene leyendo la documentación y los artículos originales.

**Ejemplos de controles aplicables a cualquier método:**

| Tipo de método | Control positivo | Control negativo |
| :--- | :--- | :--- |
| Comparación de secuencias | Usar secuencias que se sabe que están relacionadas evolutivamente; el algoritmo debe detectar la relación. | Usar secuencias sin relación (ej: secuencias aleatorias o de organismos muy distantes); el algoritmo no debe mostrar relación significativa. |
| Predicción de estructura | Usar una secuencia con estructura resuelta experimentalmente; la predicción debe aproximarse a esa estructura. | Usar una secuencia que se sabe que no tiene estructura estable (ej: región desordenada); la predicción debe reflejar incertidumbre o no dar una estructura confiable. |
| Clasificación o agrupamiento (clustering) | Usar un conjunto de datos con etiquetas conocidas; el algoritmo debe recuperar los grupos esperados. | Usar un conjunto de datos donde no hay grupos reales (ej: datos completamente aleatorios); el algoritmo no debe forzar grupos falsos. |

**Nota crítica:** la mayoría de los algoritmos devuelven un resultado aunque los datos de entrada no tengan sentido biológico. Por eso, el control negativo y el conocimiento de los límites del método son obligatorios antes de aceptar cualquier salida como válida.

## Tipos de experimentos en bioinformática

Los experimentos en bioinformática se clasifican en cuatro tipos según la operación principal que se realiza sobre los datos. Cada tipo requiere controles específicos y una comprensión clara de sus limitaciones.

| Tipo | Descripción |
| :--- | :--- |
| **Búsqueda** | Extraer registros de una BD sin modificarlos. |
| **Comparación** | Enfrentar conjuntos de datos para hallar similitudes o diferencias. |
| **Modelado** | Generar representaciones predictivas de sistemas biológicos. |
| **Integración** | Combinar múltiples fuentes de datos para responder preguntas complejas.  |

## ¿Necesito programar?

No es obligatorio. Existen plataformas web que permiten usar herramientas bioinformáticas sin escribir una línea de código.

Sin embargo, aprender a programar, aunque sea en un nivel elemental, se convierte en una habilidad muy poderosa. La línea de comandos (terminal) permite ejecutar tareas repetitivas y de procesamiento de datos con mucha más eficiencia que los entornos gráficos.

--- 
## Proyecto:  

*Klebsiella pneumoniae* es una bacteria que vive normalmente en el intestino de las personas sin causar problemas. Sin embargo, en pacientes internados en hospitales (sobre todo aquellos con sistemas inmunológicos debilitados o con dispositivos médicos como respiradores o catéteres), puede causar infecciones graves como neumonía, infecciones del tracto urinario, bacteriemia (infección en la sangre) y meningitis.

El principal problema con *K. pneumoniae* es su capacidad para volverse resistente a múltiples antibióticos. En las últimas décadas, han aparecido cepas que son resistentes a los **carbapenémicos**, un grupo de antibióticos que se consideran de "último recurso" porque son efectivos contra muchas bacterias multirresistentes.

El gen responsable de esta resistencia en muchas cepas se llama ***blaKPC***. Este gen codifica una enzima (llamada KPC) que destruye a los carbapenémicos, volviéndolos inútiles. El gen se encuentra generalmente en **plásmidos**, que son pequeñas moléculas de ADN que las bacterias pueden intercambiar entre sí, lo que permite que la resistencia se propague rápidamente entre distintas cepas e incluso entre diferentes especies bacterianas.

Los investigadores han identificado que ciertas mutaciones puntuales en el gen *blaKPC* pueden hacer que la enzima sea aún más eficiente, aumentando la capacidad de la enzima para destruir carbapenémicos y, además, puede hacer que sea más difícil de inhibir con nuevos fármacos.

**En este tutorial**, vamos a recibir los datos de secuenciación del gen *blaKPC* de 5 pacientes de un hospital. Nuestro objetivo será:

1. Analizar las secuencias del gen *blaKPC* de cada paciente.
2. Traducir esas secuencias a proteína.
3. Identificar qué pacientes contienen cepas con la mutación S179G.
4. Entregar un informe al hospital indicando qué pacientes están contagiados con cepas resistentes.

## Ejercicio 1: Conocer la proteína de referencia en UniProt

Antes de analizar las secuencias de los pacientes, es importante tener un punto de comparación. Vamos a buscar en UniProt la proteína KPC (codificada por el gen *blaKPC*).

---
### Pasos a seguir: 

1. Ingresá a [UniProt](https://www.uniprot.org/).
2. En el buscador, escribí **"KPC Klebsiella pneumoniae"** y presioná Enter.
3. Buscá la entrada "Q9F663" **que corresponda a la variante KPC-2**.
4. Hacé clic en la entrada para ver los detalles.
4. Tomá nota de la **longitud** de la proteína (aparece en la parte superior, justo debajo del nombre).
5. Andá a la sección **"Phenotypes & Variants"** y buscá la subsección **"Mutagenesis"**. Observá la tabla de mutagénesis.

#### ✏️ Preguntas guía:

1. ¿Cuántas mutaciones están documentadas en la tabla? ¿En qué posiciones de la proteína ocurren?

2. Identificá las **dos mutaciones** que, según la descripción, **aumentan la eficiencia catalítica de la enzima y generan resistencia a ceftazidima**. Anotá:

       - La posición de cada mutación.
       - El cambio de aminoácido que producen (ej: "P → R").
       - El efecto que tienen sobre la enzima (leé la descripción completa).

3. Según la tabla, ¿estas dos mutaciones actúan de forma independiente o **necesitan estar juntas** para generar el efecto? ¿Qué frase de la tabla te indica eso?


**Nota clave:** Prestá atención a la frase **"when associated with"** (cuando está asociada con). Esto indica que las mutaciones en las posiciones 103 y 239 **no actúan solas**: una cepa necesita tener **ambas mutaciones** para presentar el aumento de eficiencia contra ceftazidima que se describe en la tabla.

Hasta acá, descubrimos varias cosas importantes:

1. La proteína KPC-2 tiene una longitud de 293 aa.
2. En la tabla de mutagénesis de UniProt hay mutaciones documentadas en tres posiciones: 103, 178 y 239.
3. Las mutaciones en las posiciones **103** (cambio de P a R) y **239** (cambio de G a R, probablemente) **no generan resistencia por sí solas**. Para que la enzima aumente su eficiencia contra ceftazidima ~40 veces, **las dos mutaciones tienen que estar presentes al mismo tiempo** en la misma cepa.
4. Esto significa que, cuando analicemos las secuencias de los pacientes, no basta con buscar una sola mutación. Vamos a tener que verificar si cada paciente tiene **ambas mutaciones** para determinar si realmente presenta el fenotipo de alta resistencia.

## Ejercicio 2: Preparar el entorno de trabajo

### Introducción a Linux / Ubuntu

Linux es un sistema operativo de código abierto, estable y muy utilizado en entornos de investigación y servidores.  
Ubuntu es una de sus distribuciones más populares, conocida por su facilidad de uso y amplia comunidad de soporte.  

En bioinformática y análisis de datos, Linux ofrece ventajas importantes: permite manejar grandes volúmenes de información, automatizar tareas mediante *scripts*, instalar software científico fácilmente y ejecutar pipelines de análisis de manera reproducible.  

A través de la terminal, los usuarios pueden interactuar directamente con el sistema operativo, ejecutar programas, gestionar archivos y carpetas, y combinar herramientas de manera flexible.

### Introducción a Bash

Bash (Bourne Again SHell) es un intérprete de comandos que permite interactuar con el sistema operativo mediante texto.  

Usando Bash, los usuarios pueden navegar entre carpetas, gestionar archivos, ejecutar programas, combinar comandos y automatizar tareas repetitivas mediante *scripts*.  

En bioinformática, Bash es fundamental para procesar grandes volúmenes de datos, lanzar pipelines de análisis y manipular archivos de secuenciación de manera eficiente sin necesidad de interfaces gráficas.

### Introducción al uso de la terminal

La **terminal** (también llamada línea de comandos, consola o shell) es una herramienta fundamental en bioinformática. A diferencia de los programas con interfaces gráficas (ventanas y botones), la terminal funciona a través de **comandos de texto** que escribís directamente. Puede parecer intimidante al principio, pero es increíblemente poderosa: te permite ejecutar programas, manejar archivos, conectar a servidores remotos y automatizar tareas repetitivas con solo unas pocas líneas.

En bioinformática, la mayoría de las herramientas (como los alineadores de secuencias, los ensambladores de genomas o los scripts de análisis) se usan desde la terminal. Por eso, aprender a moverse con soltura en este entorno te ahorrará muchísimo tiempo y te dará un control total sobre tus datos.

## **Línea de comando**

Como ya dijimos en la introducción la línea de comando tiene varios nombres, y en esta guia nos vamos a referir a ella como *terminal* o *consola*. Hay varias formas de abrir la terminal:

* Desde cualquier lado: ++ctrl+alt+t++
* Desde cualquier lado: **Inicio** *(menu de abajo a la izquierda)* :material-arrow-right: **Herramientas del sistema** :material-arrow-right: **Terminal**
* Desde afuera de una carpeta: **Boton derecho en la carpeta** :material-arrow-right: **Abrir en el terminal**
* Desde adentro de una carpeta: **Herramientas** :material-arrow-right: **Abrir la carpeta actual en un terminal** (o apretar ++f4++)

La terminal funciona como un explorador de archivos que se mueve entre las carpetas. Los primeros dos métodos van a abrir la terminal en **/home/user**, mientras que los últimos dos métodos van a abrir la terminal en la carpeta elegida. Si en algun momento les decimos que abran la terminal y no aclaramos otra cosa nos referimos a abrirla en **/home/user**.

Abran la terminal en **/home/user** y deberian ver algo así:


``` bash
user@datos_de_la_computadora:~$
```

Donde **user** es el nombre del usuario actual e **datos_de_la_computadora** el nombre de la computadora. El **\~** después de los dos puntos (conocido como "virgulilla", "tilde" o "cosito de la ñ") parece ser parte de la terminal, pero en realidad está indicando la carpeta en la que se encuentra en este momento. Como cada usuario trabaja mas que nada en su carpeta, Ubuntu le asigna el símbolo **\~** a esa carpeta para simplificar los directorios que aparecen en la terminal. En nuestro caso **\~** equivale a **/home/user** y puede ser que nos refiramos a esa carpeta como su *home directory* o simplemente su *home*.

!!! info

    Aclaraciones por si son fanáticos de los atajos de teclado:

    * Para copiar texto en la terminal hay que usar ++ctrl+shift+c++. En en resto de Ubuntu es normal (++ctrl+c++).
    * Para pegar texto en la terminal hay que usar ++ctrl+shift+v++. En en resto de Ubuntu es normal (++ctrl+v++).
    * Al apretar ++ctrl+c++ en la terminal le están diciendo que corte forzosamente el programa que está corriendo. Si bien hay que tener cuidado con no cortar un proceso importante a la mitad, este atajo del teclado es útil si un programa se te quedó colgado o similar.


### ¿Qué es un comando?

**Conceptos básicos al escribir comandos**

Los comandos se escriben en **minúsculas** y respetando espacios entre palabras.  Suelen tener la siguiente estructura:  

```bash
comando [opciones] [argumentos]
```

- **comando:** lo que queremos ejecutar (por ejemplo `ls`, `cd`, `wc`).  
- **opciones:** modifican el comportamiento del comando (por ejemplo `-l` para listar en detalle).  
- **argumentos:** archivos o carpetas sobre los que actúa el comando.

A tener en cuenta:

- La terminal es **sensible a mayúsculas y minúsculas**, por lo que `File.txt` y `file.txt` son archivos distintos.  
- Se pueden usar **tabulaciones** para autocompletar nombres de archivos o carpetas, evitando errores de tipeo.  
- Los **comentarios** se escriben con `#` y la terminal los ignora, útil para documentar *scripts*.

#### Comandos básicos de Bash

A continuación hay una lista de los comandos más usados en Bash, vamos a ir viendo los más importantes para este curso en la siguiente sección:

| Comando | Qué hace | Ejemplo |
|---------|----------|---------|
| `pwd`   | Muestra la ruta del directorio actual | `pwd` → `/home/usuario/proyecto` |
| `ls`    | Lista los archivos y carpetas del directorio | `ls` → `archivo1.txt archivo2.txt` |
| `cd`    | Cambia de directorio | `cd datos/` → cambia al subdirectorio `datos` |
| `mkdir` | Crea un nuevo directorio | `mkdir resultados` → crea carpeta `resultados` |
| `rmdir` | Elimina directorios vacíos | `rmdir carpeta_vacia` → borra la carpeta |
| `rm`    | Elimina archivos | `rm archivo.txt` → borra `archivo.txt` |
| `cp`    | Copia archivos | `cp archivo.txt backup/` → copia archivo a `backup/` |
| `mv`    | Mueve o renombra archivos | `mv archivo.txt archivo_old.txt` → renombra archivo |
| `head`  | Muestra las primeras líneas de un archivo | `head sample.fastq` → primeras 10 líneas |
| `tail`  | Muestra las últimas líneas de un archivo | `tail sample.fastq` → últimas 10 líneas |
| `wc`    | Cuenta líneas, palabras o caracteres | `wc -l sample.fastq` → número de líneas |
| `cat`   | Muestra el contenido de un archivo | `cat archivo.txt` → imprime el archivo en pantalla |
| `less`  | Permite ver un archivo página por página | `less archivo.txt` → navegación interactiva |
| `grep`  | Busca texto dentro de un archivo | `grep "ATG" sample.fasta` → muestra líneas con "ATG" |
| `chmod` | Cambia permisos de archivo o carpeta | `chmod 755 script.sh` → permisos de ejecución |
| `echo`  | Imprime texto en la terminal. | `echo "Hola mundo"` → imprime "Hola mundo" en la terminal |
| `wget`  | Descarga archivos desde una URL | `wget https://example.org/file.fasta` → descarga el archivo |
| `awk`   | Procesa texto y columnas de archivos | `awk '{print $1}' archivo.tsv` → imprime la primera columna |
| `gunzip` | Descomprime archivos `.gz` | `gunzip archivo.fasta.gz` → descomprime el archivo |
| `zcat`  | Muestra el contenido de un archivo `.gz` sin descomprimir | `zcat archivo.fasta.gz` → imprime el archivo en pantalla |
| `./`    | Ejecuta un script o programa en el directorio actual | `./script.sh` → ejecuta `script.sh` |
| `|`     | Pipe: envía la salida de un comando como entrada de otro | `cat archivo.txt | grep "gene"` → filtra líneas con "gene" |
| `*`     | Comodín que representa cualquier cadena de caracteres | `ls *.fastq` → lista todos los archivos que terminan en `.fastq` |
 

??? warning "Errores más comunes en Bash"

    | Tipo de error | Mensaje típico | Descripción |
    |--------------|---------------|-------------|
    | Comando no encontrado | `command not found` | El comando está mal escrito o no está instalado en el sistema. |
    | Archivo o directorio inexistente | `No such file or directory` | La ruta es incorrecta, el archivo no existe o no estás en el directorio adecuado. |
    | Permiso denegado | `Permission denied` | Se intenta acceder o ejecutar un recurso sin permisos suficientes. |
    | Error de sintaxis | `syntax error` | Uso incorrecto de paréntesis, comillas, corchetes u otros símbolos. |
    | Opción inválida | `invalid option` | Se usó una bandera que el comando no reconoce. |
    | Argumentos faltantes | — | El comando requiere argumentos adicionales para poder ejecutarse correctamente. |
    | Archivo en uso por otro proceso | — | El archivo está siendo utilizado por otro programa y no puede modificarse. |
    | Variables o rutas mal expandidas | — | Errores en el uso de variables (`$var`), `~` o comillas. |
    | Sobrescritura accidental o salida vacía | — | El comando se ejecuta sin error, pero produce un resultado incorrecto o vacío. |
    | Espacios en nombres de archivos | — | Rutas con espacios requieren comillas o escape con `\`. |
    | Entorno mal configurado | — | Problemas con `PATH`, entornos virtuales o módulos no cargados. |
    | Redirecciones o pipes incorrectos | — | Uso incorrecto de `|`, `>`, `<` o combinaciones inválidas. |
    | Bucles infinitos en scripts | — | Errores lógicos que impiden que el script termine. |
    | Caracteres especiales o codificación | — | Caracteres no visibles, tildes o emojis pueden romper comandos. |
    
### Navegación y cambio de directorio en Bash

En la terminal de Linux/Ubuntu, es fundamental saber **dónde estamos ubicados** y cómo movernos entre carpetas.  
Esto permite ejecutar comandos sobre los archivos correctos y organizar proyectos de manera eficiente.

**Comando para ver la ubicación actual**

```bash
pwd
```

- `pwd` (print working directory) muestra la ruta completa del directorio actual.  
- Saber en qué carpeta estamos evita errores al ejecutar comandos que modifican archivos.

#### ✏️ Pregunta 1
Abrir una terminal y ejecutar el comando para obtener la ubicación actual

```bash
pwd
```

### Estructura de directorios de Ubuntu

La organización de archivos en Ubuntu y Lubuntu es bastante diferente a la de Windows. Si bien no vamos a detallar completamente toda la estructura y que es cada carpeta (porque el 95% no lo van a usar en esta materia), es importante tener una idea de lo básico:

* **/** Carpeta raiz, o *root*. Contiene al resto de las carpetas.
    * **/etc**: Configuraciones del sistema para todos los usuarios (mucho cuidado al tocar).
    * **/home**: Ubicación de los directorios de los diferentes usuarios (o en este caso el único usuario).
        * **/home/user**: Directorio del usuario *user*. Es el lugar donde van a trabajar la mayoría del tiempo (incluye tanto el Escritorio como Documentos) y donde se abre por defecto la terminal (más sobre esto en un ratito). Comúnmente referida como *home directory* o *home* del usuario *user*.
    * **/media**: Si fuera una computadora normal (no VM) aca aparecerían los pendrives. En nuestro caso aca aparecen por defecto las carpetas compartidas con la PC host.
    * **/tmp**: Ubicación de los archivos temporales de los programas.
    * **/var**: Ubicación de los archivos variables de los programas, como logs, bases de datos, páginas webs, etc.
        * **/var/log**: Probablemente la subcarpeta más usada de **/var**. Contiene los logs de los programas (que a veces es la única forma de saber porqué algo no anduvo).

Esto es simplemente un vistazo rápido. Si quieren la lista completa de subdirectorios de Ubuntu la pueden encontrar en [esta página](https://help.ubuntu.com/community/LinuxFilesystemTreeOverview), pero tengan en cuenta que tocar cualquier cosa fuera de **/home** conlleva la posibilidad de arruinar la computadora. En esta materia vamos a usar principalmente **/home** y **/media**.

### Paths relativos y absolutos

En programación, un *path* (o ruta) es la cadena de caracteres que indica la ubicación de un archivo o directorio dentro del sistema de archivos.

#### Paths absolutos

Un **path absoluto** es aquel que especifica la ubicación completa y exacta de un archivo o directorio desde la raíz del sistema. Esto significa que no depende de dónde estés parado actualmente; siempre apunta al mismo lugar sin importar el directorio de trabajo. Por ejemplo, en Linux o macOS, un path absoluto comienza con una barra inclinada (/), como en `/home/usuario/documentos/informe.txt`. En Windows, comienza con la letra de la unidad, como en `C:\Users\Usuario\Documentos\informe.txt`. Los paths absolutos son útiles cuando necesitás referenciar un archivo desde cualquier parte del sistema sin ambigüedades.


#### Paths relativos


Un **path relativo**, en cambio, indica la ubicación de un archivo o carpeta en relación al directorio actual de trabajo (el lugar donde estás parado en la terminal o desde donde se ejecuta el programa). No parte desde la raíz, sino desde la posición actual. Por ejemplo, si estás en `/home/usuario` y querés acceder a `documentos/informe.txt`, el path relativo sería `documentos/informe.txt` (si la carpeta está dentro del directorio actual) o `../documentos/informe.txt` si está un nivel arriba. Los paths relativos son más cortos y flexibles, ya que permiten mover proyectos completos de una carpeta a otra sin tener que reescribir todas las rutas.

Ambos tipos de paths tienen sus ventajas y desventajas.

Los **paths absolutos** tienen la ventaja de funcionar siempre, pero al usar toda la estructura toman más tiempo de escribir y son más suceptibles a cambios de directorios (si muevo un archivo de lugar tengo que reescribir el comando).

Por otro lado, los **paths relativos** son mucho más rápidos de escribir y en muchos casos funcionan en diferentes ubicaciones (o computadoras), pero al depender de la ubicación de la terminal esto puede causar problemas si pienso que estoy en una carpeta pero estoy realmente en otra. En esta cursada vamos a usar ambos para diferentes casos.

Además de estos dos tipos, es importante conocer algunos símbolos especiales que se usan en los paths:

- El punto (.) representa el directorio actual.
- Los dos puntos (..) representan el directorio padre (un nivel arriba).
- La barra inclinada (/) se usa en Linux, macOS y sistemas Unix como separador de carpetas.
- La barra invertida ("\") se usa en Windows como separador (aunque muchas herramientas modernas aceptan también la barra inclinada).

Entender la diferencia entre paths absolutos y relativos es clave para evitar errores como "archivo no encontrado", especialmente cuando trabajás en proyectos que se mueven entre distintos equipos o sistemas operativos.

### Crear y eliminar carpetas

En el sistema de archivos de Linux, las carpetas (también llamadas directorios) son la forma principal de organizar archivos. Para trabajar de forma ordenada en bioinformática, es fundamental saber crear y eliminar carpetas desde la terminal.

Los comandos `mkdir` y `rmdir` son las herramientas básicas para gestionar directorios:

- `mkdir` → Crear nuevas carpetas.  
- `rmdir` → Eliminar carpetas vacías.

**Sintaxis general**

```bash
# Crear una carpeta
mkdir [opciones] carpeta

# Eliminar una carpeta vacía
rmdir [opciones] carpeta
```

- `carpeta` → nombre de la carpeta a crear o eliminar.  
- `[opciones]` → parámetros adicionales como `-p` para crear carpetas anidadas.

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **no los corran!** 
    El código que deben ejecutar está indicado en la sección de **Preguntas**.

    Crear una carpeta simple

    ```bash
    mkdir resultados
    ```

    Crear subcarpetas de manera recursiva

    ```bash
    mkdir -p datos/fastq
    ```

    Eliminar una carpeta vacía

    ```bash
    rmdir carpeta_vacia
    ```

    Eliminar una carpeta con contenido (¡cuidado!)

    ```bash
    rm -r carpeta_con_datos
    ```


#### ✏️ Pregunta 2
Ejecutar el comando para generar una carpeta de "TP01" 

```bash
mkdir TP01
```
 

---
### Cambiar de directorio

```bash
cd nombre_de_carpeta
```

- `cd` (change directory) cambia la ubicación actual a la carpeta indicada.  
- Se puede usar una **ruta relativa** (`cd subcarpeta`) o **ruta absoluta** (`cd /home/usuario/proyecto`).  
- Para subir un nivel en la jerarquía de carpetas se usa: `cd ..`  
- Para ir al directorio personal del usuario se usa: `cd ~`  

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, no los corran! 
    El código que deben ejecutar está indicado en la sección de **Preguntas**.

    ```bash
    cd datos/                 # va al subdirectorio "datos"
    cd ../                     # sube un nivel en la jerarquía de carpetas
    cd /home/usuario/proyecto  # va directamente a la ruta absoluta
    ```
    

??? warning "Errores más comunes en para `cd`"

    | Error | Ejemplo en terminal | Mensaje de error | Explicación / Solución |
    |------|--------------------|------------------|-----------------------|
    | Directorio no existe | `$ cd datos` | `bash: cd: datos: No such file or directory` | El nombre está mal escrito, el directorio no existe o no estás ubicado en la ruta correcta. |
    | Ruta mal escrita (mayúsculas/minúsculas) | `$ cd Documentos` | `bash: cd: Documentos: No such file or directory` | Linux distingue entre mayúsculas y minúsculas (`Documentos` ≠ `documentos`). |
    | Espacios en nombres de carpetas | `$ cd Mi Carpeta` | `bash: cd: Mi: No such file or directory` | Usar comillas o escapar el espacio: `cd "Mi Carpeta"` o `cd Mi\ Carpeta`. |
    | Permiso denegado | `$ cd /root` | `bash: cd: /root: Permission denied` | El usuario no tiene permisos para acceder a ese directorio. |
    | Ruta relativa inexistente | `$ cd ../datos` | `bash: cd: ../datos: No such file or directory` | La ruta relativa no existe desde la ubicación actual. |
    | Intentar entrar a un archivo | `$ cd archivo.txt` | `bash: cd: archivo.txt: Not a directory` | `cd` solo funciona con directorios, no con archivos. |
    

??? info "Buenas prácticas"

    1. Siempre verificar la ubicación actual con `pwd` antes de cambiar de carpeta.  
    2. Usar **tabulaciones** para autocompletar nombres de carpetas y evitar errores de tipeo.  
    3. Documentar scripts indicando rutas relativas o absolutas para que sean reproducibles.

#### ✏️ Pregunta 3
Ejecutar el comando para ingresar a la carpeta "TP01". 

```bash
cd TP01
``` 

!!! info "Estructura de trabajo recomendada"
 
    Es importante mantener una estructura clara de proyecto, por ejemplo:

    ```bash
    project/
    ├── data/
    ├── scripts/
    └── results/
    ```

    Y siempre usar nombres descriptivos para carpetas para facilitar la organización de los análisis.
    
#### ✏️ Pregunta 4

Dentro de la carpeta "TP01" generar las subcarpetas necesarias para obtener la siguiente estructura de datos:

```bash
    TP01/
    ├── data/
    ├── scripts/
    └── resultados/
```

### Listar contenido de carpetas

El comando `ls` es uno de los más utilizados en la terminal. Permite **listar el contenido de un directorio**, mostrando los archivos y subcarpetas que contiene. Es la herramienta fundamental para explorar el sistema de archivos y verificar qué hay en cada carpeta.

**Sintaxis general**

```bash
ls [opciones] [ruta]
```

- `ruta` → directorio a listar (si no se especifica, lista el directorio actual).
- `[opciones]` → modificadores que cambian el formato o la información que se muestra.

#### Opciones más comunes

| Opción | ¿Qué hace? |
| :--- | :--- |
| `-l` | Muestra información detallada (permisos, dueño, tamaño, fecha). |
| `-a` | Muestra **todos** los archivos, incluyendo los ocultos (los que empiezan con `.`). |
| `-h` | Muestra los tamaños en formato legible (KB, MB, GB) – debe usarse con `-l`. |
| `-lh` | Combina `-l` y `-h`: detalles con tamaños legibles. |
| `-R` | Lista de forma recursiva (todas las subcarpetas). |
| `-S` | Ordena por tamaño (más grande primero). |
| `-t` | Ordena por fecha de modificación (más reciente primero). |
 

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **¡no los corran!**  
    El código que deben ejecutar está indicado en la sección de **Preguntas**.

    Listar el contenido del directorio actual

    ```bash
    ls
    ```

    Listar con detalles y tamaños legibles

    ```bash
    ls -lh
    ```

    Listar **todos** los archivos (incluyendo ocultos) con detalles

    ```bash
    ls -la
    ```

    Listar una carpeta específica

    ```bash
    ls -lh /home/estudiante/documentos/
    ```

    Ordenar por tamaño

    ```bash
    ls -lS
    ```
 

??? warning "Errores comunes"

    - `ls carpeta_inexistente` → Si la carpeta no existe, aparece el error `cannot access 'carpeta_inexistente': No such file or directory`.
    - `ls -l archivo_inexistente` → Error similar: `cannot access 'archivo_inexistente': No such file or directory`.
    - Olvidar la opción `-a` y no ver archivos ocultos (como `.bashrc`, `.config`, etc.).
    

??? info "Buenas prácticas"

    - Usar `ls -lh` en lugar de solo `ls` para ver tamaños de archivos de forma clara.
    - Combinar `-l` y `-a` con `-h` para tener una visión completa del directorio: `ls -lah`.
    - Si estás explorando una carpeta con muchos archivos, podés usar `ls | head -n 10` (todavía no vimos `head`, pero lo usaremos más adelante) para ver solo los primeros 10 resultados.
    - No confiar en `ls` solo para ver si un archivo existe: combinarlo con `ls -l archivo_especifico` o usar `file` para ver el tipo de contenido.
    


#### ✏️ Pregunta 5
    
Dentro de la carpeta TP01 ejecutar `ls -lh` para verificar que contenga la estructura recomendada.

```bash
    TP01/
    ├── data/
    ├── scripts/
    └── resultados/
```
 

## Ejercicio 3: Descargar y explorar los datos

En este ejercicio vamos a trabajar con el archivo que contiene las secuencias de los pacientes. El hospital nos ha proporcionado un repositorio interno donde están almacenados los datos de secuenciación. Vamos a descargar el archivo desde ese repositorio, explorar su contenido para entender su estructura y extraer información clave.

### Paso 1: Descargar el archivo

`wget` es un comando que permite descargar archivos desde internet o desde servidores internos directamente desde la terminal. Es muy útil porque funciona en segundo plano, puede reanudar descargas interrumpidas y no necesita un navegador web.

**Sintaxis general**

```bash
wget [opciones] URL
```

- `URL` → dirección del archivo que queremos descargar.
- `[opciones]` → modificadores que cambian el comportamiento de la descarga.

#### Opciones más comunes

| Opción | ¿Qué hace? |
| :--- | :--- |
| `-O nombre` | Guarda el archivo con el nombre que le indiquemos (si no se usa, se guarda con el nombre original de la URL). |
| `-q` | Modo silencioso (no muestra mensajes en pantalla). |
| `-c` | Reanuda una descarga interrumpida. |
| `-i archivo` | Lee una lista de URLs desde un archivo y descarga todas. |
 

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **¡no los corran!** El código que deben ejecutar está indicado en la sección de **Preguntas**.

    Descargar un archivo y guardarlo con el nombre original:
    ```bash
        wget "https://ejemplo.com/archivo.txt"
    ```

    Descargar un archivo y guardarlo con otro nombre:
    ```bash
        wget -O nuevo_nombre.txt "https://ejemplo.com/archivo.txt"
    ```
    

??? warning "Errores comunes"

    - `wget: unable to resolve host address` → La URL está mal escrita o no hay conexión a internet.
    - `wget: HTTP error 404` → El archivo no existe en el servidor.
    - `wget: error de permiso` → No tenés permisos para escribir en la carpeta donde estás guardando.
    

??? info "Buenas prácticas"

    - Usar `-O` para tener control sobre el nombre del archivo y evitar confusiones.
    - Verificar la URL antes de ejecutar `wget` para evitar errores 404.
    - Si descargas archivos grandes, usar `-c` para poder reanudar la descarga si se corta.
    

#### ✏️ Pregunta 6
    
Dentro de la carpeta del TP01 ingresar a la carpeta `datos/`. Ejecutar el siguiente comando para obtener las secuencias:

```bash
wget "https://bioinformatica-iib.github.io/introduccion_bioinformatica/practicos/TP01_Linux/data/pacientes.fasta"
```

#### ✏️ Pregunta 7

Verificar que el archivo se haya descargado correctamente usando `ls`

```bash
ls
```

### Paso 2: Visualizar el archivo 

Los comandos `head` y `tail` permiten **ver partes de un archivo de texto** sin abrirlo completo, lo cual es útil para inspeccionar archivos grandes.

**Ver el comienzo de un archivo con `head`**

- Muestra las primeras líneas de un archivo.  
- Por defecto, muestra las **primeras 10 líneas**, pero se puede cambiar con la opción `-n`.

!!! Ejemplos
    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **no los corran!** 
    El código que deben ejecutar está indicado en la sección de **Preguntas**.

    ```bash
    # Ver las primeras 10 líneas de sample.fastq
    head sample.fastq

    # Ver las primeras 20 líneas
    head -n 20 sample.fastq
    ```

**Ver el final de un archivo con `tail`**

- Muestra las últimas líneas de un archivo.  
- También por defecto son 10 líneas, modificables con `-n`.

!!! Ejemplos
    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **no los corran!** 
    El código que deben ejecutar está indicado en la sección de **Preguntas**.

    ```bash
    # Ver las últimas 10 líneas de sample.fastq
    tail sample.fastq

    # Ver las últimas 15 líneas
    tail -n 15 sample.fastq
    ```
    
??? warning "Errores más comunes en para `head` y `tail`"

    | Error | Ejemplo en terminal | Mensaje típico | Explicación / Solución |
    |-------|--------------------|---------------|-----------------------|
    | Archivo no existe | `$ head datos.txt` | `No such file or directory` | El nombre del archivo está mal escrito, no existe o no estás en el directorio correcto. |
    | Opción inválida | `$ head -z archivo.txt` | `invalid option -- 'z'` | Se usó una opción que `head` o `tail` no reconoce. |
    | Valor no válido para `-n` | `$ head -n diez archivo.txt` | `invalid number of lines` | La opción `-n` solo acepta números enteros. |
    | Archivos muy grandes | `$ head archivo_muy_grande.fastq` | — | En archivos enormes la lectura directa desde disco puede ser lenta o parecer que el comando se cuelga. |
    | Falta de permisos de lectura | `$ tail /root/secret.log` | `Permission denied` | El usuario no tiene permisos para leer el archivo. |
    | Intentar leer un directorio | `$ head carpeta/` | `Is a directory` | `head` y `tail` funcionan sobre archivos, no directorios. |
    | Archivo comprimido | `$ head datos.csv.gz` | salida ilegible | El archivo está comprimido; usar `zcat`, `gzcat` o `zless`. |
    | Flag incompleto | `$ tail -n archivo.txt` | `option requires an argument` | Falta indicar el número de líneas luego de `-n`. |
    | Rutas con espacios | `$ head Mis Datos/datos.txt` | `No such file or directory` | Usar comillas (`"Mis Datos/datos.txt"`) o escapar espacios (`Mis\ Datos`). |
    

??? info "Buenas prácticas"

    1. Usar `head` para revisar rápidamente la estructura de archivos grandes.  
    2. Usar `tail` para monitorear archivos que se actualizan continuamente (como logs).  
    

#### ✏️ Pregunta 8

Visualiza el archivo ejecutando el siguiente comando:

```bash
head pacientes.fasta
```
 

---
### Paso 3: Buscar los nombres de los pacientes con `grep`
`grep` (Global Regular Expression Print) es un comando que busca líneas que coincidan con un patrón (expresión regular) dentro de uno o varios archivos. Es una de las herramientas más poderosas para filtrar y extraer información de archivos de texto.

**Sintaxis general**

    grep [opciones] "patrón" archivo(s)

- `"patrón"` → la expresión que queremos buscar.
- `archivo(s)` → el archivo o archivos donde buscar.
- `[opciones]` → modificadores que cambian el comportamiento.


#### Opciones más comunes

| Opción | ¿Qué hace? |
| :--- | :--- |
| `-i` | Ignora mayúsculas/minúsculas. |
| `-v` | Muestra las líneas que **no** coinciden con el patrón. |
| `-c` | Cuenta cuántas líneas coinciden (en lugar de mostrarlas). |
| `-l` | Muestra solo los nombres de los archivos que contienen el patrón. |
| `-n` | Muestra el número de línea de cada coincidencia. |
| `-w` | Busca la palabra exacta (no partes de palabras). |
| `-E` | Permite usar expresiones regulares extendidas (ej: `|` para OR). |
 

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **¡no los corran!** El código que deben ejecutar está indicado en la sección de **Preguntas**.

    Buscar líneas que contengan la palabra "Paciente" en un archivo:
    ```bash
        grep "Paciente" archivo.txt
    ```

    Buscar líneas que empiecen con el símbolo `>` en un archivo FASTA:
    ```bash
        grep "^>" secuencias.fasta
    ```

    Buscar líneas que **no** contengan la palabra "mutación":
    ```bash
        grep -v "mutación" archivo.txt
    ```

    Contar cuántas líneas tienen "ERR" en un archivo de log:
    ```bash
        grep -c "ERR" log.txt
    ```

    Buscar líneas que contengan "TP53" o "BRCA1":
    ```bash
        grep -E "TP53|BRCA1" genes.txt
    ```
 

??? warning "Errores comunes"

    - `grep: archivo: No such file or directory` → El archivo no existe o escribiste mal el nombre.
    - `grep: Unmatched ( or ` → Error en la expresión regular (falta cerrar un paréntesis, etc.).
    - El patrón no devuelve nada aunque sabés que debería → revisá mayúsculas/minúsculas (usá `-i`) o el símbolo de inicio/fin (`^` y `$`).
 

??? info "Buenas prácticas"

    - Usar `"^"` para buscar líneas que **empiecen** con algo.
    - Usar `"$"` para buscar líneas que **terminen** con algo.
    - Encerrar el patrón entre comillas para evitar que el shell interprete caracteres especiales.
    - Combinar `grep` con otros comandos mediante tuberías (`|`) para filtrados más complejos.
    - Siempre verificar que el archivo existe con `ls` antes de usar `grep`.
    

#### ✏️ Pregunta 9
    
Buscá todas las líneas que empiezan con `>` (el símbolo de cabecera en FASTA) en el archivo:

```bash
grep "^>" pacientes.fasta
```

### Paso 4: Guardar los nombres en una tabla

En la terminal, la mayoría de los comandos muestran su salida en la pantalla (stdout). El símbolo `>` permite **redirigir** esa salida a un archivo, en lugar de mostrarla en la terminal. Es útil para guardar resultados, generar archivos de registro o crear listados que vamos a usar más adelante.

**Sintaxis general**
```bash
comando > archivo_salida
```

- `comando` → cualquier comando que genere salida (ej: `grep`, `ls`, `head`).
- `archivo_salida` → el nombre del archivo donde queremos guardar la salida.


#### Opciones

| Símbolo | ¿Qué hace? |
| :--- | :--- |
| `>` | Redirige la salida a un archivo y **sobrescribe** el archivo si ya existe. |
| `>>` | Redirige la salida a un archivo y **agrega** al final (no sobrescribe). |
| `2>` | Redirige los mensajes de error (stderr) a un archivo. |
| `|` (tubería) | Redirige la salida de un comando a la entrada de otro (no guarda en archivo). |
 

!!! Ejemplos

    Los ejemplos que aparecen a continuación sirven solo para entender la sintaxis, **¡no los corran!** El código que deben ejecutar está indicado en la sección de **Preguntas**.

    Guardar la lista de archivos de una carpeta en un archivo:
    ```bash
        ls -l > lista_archivos.txt
    ```

    Guardar el resultado de una búsqueda con `grep` en un archivo:
    ```bash
        grep "Paciente" pacientes.fasta > pacientes_encontrados.txt
    ```

    Agregar más resultados al mismo archivo sin borrar lo anterior:
    ```bash
        grep "Paciente_00" pacientes.fasta >> pacientes_encontrados.txt
    ```

    Guardar los mensajes de error en un archivo separado:
    ```bash
        wget -O archivo.txt "URL_invalida" 2> errores.txt
    ```

??? warning "Errores comunes"

    - `archivo: Permission denied` → No tenés permiso para escribir en esa carpeta.
    - Olvidar que `>` sobrescribe, y perder información importante.
    - Usar `>` con un comando que no produce salida (el archivo queda vacío).
    
??? info "Buenas prácticas"

    - Usar `>>` cuando quieras agregar información a un archivo existente.
    - Verificar el contenido del archivo generado con `cat` o `head` para confirmar que la redirección funcionó.
    - Usar nombres de archivo descriptivos (ej: `pacientes_nombres.csv` en lugar de `salida.txt`).
    - Si vas a sobrescribir un archivo importante, considerá hacer una copia de seguridad primero.
    

#### ✏️ Pregunta 10

Guardá la lista de nombres de los pacientes (las líneas que comienzan con `>`) en un archivo dentro de la carpeta `resultados/`:

```bash
grep "^>" pacientes.fasta > ../resultados/pacientes_nombres.csv
```
 

#### ✏️ Pregunta 11

Revisa que el archivo `pacientes_nombres.csv` se haya generado correctamente. 

 
