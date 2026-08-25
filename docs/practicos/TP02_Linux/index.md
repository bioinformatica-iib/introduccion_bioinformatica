---
title: Practico Dos
icon: octicons/terminal-16
tags: 
  - practicos
---
![Image](img/banner.jpg){ width="250", align="left" }

# **TP 2**. Conceptos avanzados de programación en Bash { markdown data-toc-label = 'TP 2' }

<!--
[:fontawesome-solid-download: Materiales](data/datos.zip){ .md-button .md-button--primary }
-->
<br>
<br>

## Objetivos
1. Familiarizarse con el uso de la terminal y sus comandos básicos para navegar, crear directorios y manipular archivos.

2. Obtener y procesar datos biológicos reales desde bases de datos públicas usando herramientas de línea de comandos.

3. Automatizar tareas utilizando scripts, para procesar múltiples archivos.

## Recapitulando el TP01

En este ejercicio vamos a trabajar con las secuencias para poder identificar las mutaciones en las posiciones 103 y 239. 

Lo que vamos a hacer:

1. Extraer el aminoácido en la posición 103 de cada paciente.
2. Extraer el aminoácido en la posición 239 de cada paciente.
3. Determinar qué pacientes tienen las mutaciones que confieren resistencia.

Por mesa, completar una secuencia de esta tabla: 

| Paciente | Pos103 | Pos239 |
| :--- | :--- | :--- |
| **Referencia (canónica)** |  **P** | **V** |
| **Resistente** |  **R** | **G** |
| Paciente_001 | | |
| Paciente_002 | | |
| Paciente_003 | | |
| Paciente_004 | | |
| Paciente_005 | | |

## Introducción a Scripts

!!! info "Scripts"

    Los *scripts* de Bash son básicamente una lista de muchos de los comandos que nosotros corrimos en la terminal, pero escritos dentro de un archivo. Al ejecutar ese archivo todos los comandos escritos en él serán corridos uno a uno de arriba a abajo.

    En esencia, es un **mini programa** que:

    - Automatiza tareas repetitivas (copias de seguridad, despliegues, etc.).
    - Agrupa múltiples comandos del sistema en uno solo.
    - Toma decisiones lógicas (`if`), itera (`for`, `while`) y maneja datos.
    - No necesita compilación: se ejecuta directamente llamando al intérprete.

### ✏️ Paso 1

1. Ingresa desde la interfaz gráfica a la carpeta de scripts del TP01
2. Generá un archivo de texto que se llame script.sh
3. Abrí el archivo usando el bloc de notas. Copiá el siguiente texto dentro del archivo script.sh

    ```bash
    #!/bin/bash
    # Este script lista a todos los archivos con terminación .fasta de la carpeta de datos
    cd ../data/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd
    ```

    ??? warning "¿Qué significa `#!/bin/bash`?"
        Esta línea se llama **shebang** (o *hashbang*). Le indica al sistema operativo qué **intérprete** debe usar para ejecutar el script.  


4. Guardá el archivo y cerrá el bloc de notas
5. Abrí la terminal de Linux. Navegá hasta la carpeta del TP01. 
6. Ingresá a la carpeta de scripts. Listá el contenido de la carpeta para asegurarte que el archivo script.sh se generó correctamente
7. Cambiá el permiso de ejecución

    ```bash
    chmod +x script.sh   # dar permisos de ejecución
    ```

8. Ejecutá el script

    ```bash
    bash script.sh          # ejecutar
    ```

9. Leer el resultado obtenido. ¿Fué el resultado esperado?

!!! info "Elementos que componen un script Bash"
    | Elemento | Descripción | Ejemplo práctico |
    | :--- | :--- | :--- |
    | **Shebang** | Línea obligatoria al inicio que indica qué intérprete usar. | `#!/bin/bash` |
    | **Comentarios** | Texto explicativo para humanos, ignorado por Bash. Empiezan con `#`. | `# Esta variable guarda la ruta de backup` |
    | **Comandos del sistema** | Instrucciones ejecutables (`ls`, `cp`, `grep`, etc.). | `cp "$ORIGEN" "$DESTINO"` |

!!! info "Importancia del orden secuencial de los pasos"

    En Bash, **el orden es crítico** porque los comandos se ejecutan **línea por línea, de arriba a abajo**, y el resultado de uno afecta a los siguientes.

    El script debe leerse como una receta de cocina: primero los ingredientes (variables), luego los preparativos (crear directorios), luego la cocción (comandos principales) y al final el emplatado (mensajes de salida).

??? "Buenas prácticas para escribir scripts"

    | Práctica | Explicación | Ejemplo |
    | :--- | :--- | :--- |
    | **Shebang portable** | Usar `#!/bin/bash` para mayor compatibilidad entre sistemas. | `#!/bin/bash` |
    | **Manejo de rutas absolutas** | No usar `cd` sin control; mejor usar rutas fijas. | `(cd /ruta && comando)` |
    | **Comentarios útiles** | Explicar el *por qué*, no el *qué* (el código ya dice el qué). | `# Forzamos el borrado porque el espacio es crítico` |

### ✏️ Paso 2

1. Abrí nuevamente el archivo script.sh
2. Incorporá las siguientes líneas al archivo como se muestra a continuación

    ```bash
    #!/bin/bash
    cd ../data/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos de tipo fasta"
    ls | grep ".fasta"
    ```

3. Guardar el archivo.
4. Ejecutar el script desde terminal.
5. Observar el resultado obtenido. ¿Qué hace la línea que incorporamos?

## Variables
Las variables son *palabras* que guardan dentro de ellas información como una **caja con una etiqueta**. 
- En esa caja (la variable) puedes guardar un dato.
- La etiqueta (el *nombre* de la variable) te permite recuperar ese dato cuando lo necesites.
- En Bash, guardamos principalmente **números** y **cadenas de texto** (*strings*), aunque también existen otros tipos como arreglos (listas).

!!! info "Variables"
    Para crear (o *declarar*) una variable, usamos el formato:

        nombre_de_la_variable="valor"

    ⚠️ **¡Atención! Esta es la regla más importante:** 
    **NO** debe haber espacios alrededor del signo `=`. 

    - ✅ Correcto: `nombre="Mercedes"` 

    - ❌ Incorrecto: `nombre = "Mercedes"` (Bash intentará ejecutar un comando llamado `nombre`).

!!! info "Convenciones de nombres (Buenas prácticas)"
    - Usa **minúsculas** para tus variables personales (las mayúsculas suelen reservarse para variables del sistema, como `PATH`).
    - Si el nombre es compuesto, usa **guión bajo** (`_`) para separar palabras: `mi_nombre`, `contador_archivos`.
    - No uses espacios, guiones (`-`) ni caracteres especiales (excepto `_`).

!!! info "Tipos de datos"
    Aunque Bash es un lenguaje de "tipado débil" (todo se trata como texto), podemos distinguir:

    | Tipo | Ejemplo | ¿Qué es? |
    | :--- | :--- | :--- |
    | **String** (texto) | `ciudad="Buenos Aires"` | Cadena de caracteres. |
    | **Número** (entero) | `edad=30` | Número (Bash lo trata como texto, pero puede operar matemáticamente). |
    | **Arreglo** (lista) | `colores=("rojo" "verde" "azul")` | Lista de elementos. |

!!! info "¿Cómo recupero el valor guardado?"
    Para usar el dato que guardaste dentro de una variable, debes anteponer el **símbolo `$`** al nombre. A esto se le llama *expandir* la variable.

    ``` bash
        nombre="mercedes" 
        echo "$nombre"
    ```

    Sin el `$`, Bash entendería que quieres imprimir la palabra literal `nombre`:
    ``` bash
        nombre="mercedes" 
        echo "nombre"    # Esto imprime: nombre (la palabra, no el contenido)
    ```

### ✏️ Paso 3
1. Abrí nuevamente el archivo script.sh
2. Incorporá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ``` bash
        #!/bin/bash
        # Este script lista a todos los archivos con la terminación deseada
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=".fasta" 
        ls | grep "$tipo_archivo"
        ```

    === "Código con comentarios"
        ``` bash
        #!/bin/bash

        # Las lineas que empiezan con # son comentarios, no afectan el código y sirven para aclarar que estas 
        # haciendo en tu programa o script

        # Este script lista a todos los archivos con la terminación deseada
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        # Al declarar una variable en Bash no se puede poner espacio entre la variable, el = y el valor
        # Las comillas se usan para indicar que lo de adentro es una cadena de caracteres, o *string*
        tipo_archivo=".fasta"

        # Cuando se usa la variable, se le agrega el prefijo $
        ls | grep "$tipo_archivo"
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal
5. Observar el resultado obtenido


!!! info "Parámetros"
    Una de las funcionalidades más potentes de los scripts es la capacidad de recibir **parámetros** desde la línea de comandos. En lugar de escribir valores fijos dentro del script, podemos pasarlos en el momento de la ejecución, haciendo que el script sea reutilizable y flexible.

    ¿Se acuerdan de los **parámetros** de los comandos de Bash? Al pasarle parámetros a un script de Bash estos se asignan automaticamente a variables llamadas `$1`, `$2`, etc.

### ✏️ Paso 4
1. Abrí nuevamente el archivo script.sh
2. Modificá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ``` bash
        #!/bin/bash
        # Este script lista a todos los archivos con la terminación deseada de la carpeta en la que es ejecutado
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"
        ```

    === "Código con comentarios"
        ``` bash
        #!/bin/bash

        # Las lineas que empiezan con # son comentarios, no afectan el código y sirven para aclarar que estas 
        # haciendo en tu programa o script
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        # Este script lista a todos los archivos con la terminación deseada
        echo "Buscando archivos con la terminación deseada"
        # Al declarar una variable en Bash no se puede poner espacio entre la variable, el = y el valor
        # Las comillas se usan para indicar que lo de adentro es una cadena de caracteres, o *string*
        tipo_archivo=$1

        # Cuando se usa la variable, se le agrega el prefijo $
        ls | grep "$tipo_archivo"
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal

    ```bash
        bash script.sh ".fasta"
    ```

5. Observar el resultado obtenido

??? info
    Más información sobre las variables en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/variables-en-bash/).

## Condicionales

Las variables son importantes, pero gran parte de la programación es controlar el "flujo" del programa, es decir, que un script haga algo más que simplemente ir de arriba a abajo ejecutando comandos. La primera herramienta que vamos a aprender para controlar el flujo del programa son los *condicionales* que permiten crear secciones de código que se van a ejecutar solo si se cumple (o no se cumple) una condición. 

!!! info "¿Qué es una condición?"

    Una **condición** es una expresión que Bash evalúa y que siempre da como resultado:

    - **Verdadero** (código de salida `0`)
    - **Falso** (código de salida distinto de `0`)

??? "Comparaciones numéricas"

    | Operador | Significado | Ejemplo (`[ $edad -gt 18 ]`) |
    | :--- | :--- | :--- |
    | `-eq` | igual a | `[ $a -eq $b ]` |
    | `-ne` | distinto de | `[ $a -ne $b ]` |
    | `-gt` | mayor que | `[ $a -gt $b ]` |
    | `-lt` | menor que | `[ $a -lt $b ]` |
    | `-ge` | mayor o igual que | `[ $a -ge $b ]` |
    | `-le` | menor o igual que | `[ $a -le $b ]` |

??? "Comparaciones con strings (texto)"

    | Operador | Significado | Ejemplo |
    | :--- | :--- | :--- |
    | `=` | igual (texto) | `[ "$nombre" = "Juan" ]` |
    | `!=` | distinto (texto) | `[ "$nombre" != "Juan" ]` |
    | `-z` | string vacío | `[ -z "$variable" ]` |
    | `-n` | string no vacío | `[ -n "$variable" ]` |

??? "Comparaciones con archivos"

    | Operador | Significado | Ejemplo |
    | :--- | :--- | :--- |
    | `-f` | existe y es un archivo regular | `[ -f "script.sh" ]` |
    | `-d` | existe y es un directorio | `[ -d "datos/" ]` |
    | `-e` | existe (archivo o directorio) | `[ -e "archivo.txt" ]` |
    | `-r` | existe y tiene permiso de lectura | `[ -r "archivo.txt" ]` |
    | `-x` | existe y tiene permiso de ejecución | `[ -x "script.sh" ]` |

!!! info "Sintaxis básica del `if`"

    La estructura más sencilla es:
    ``` bash
    if [ condición ]; then
        # Comandos a ejecutar si la condición es verdadera
    fi
    ```

??? "Ejemplo 1: Verificar si un número es mayor que 10"
    ``` bash
    #!/bin/bash
    numero=15

    if [ $numero -gt 10 ]; then
        echo "El número es mayor que 10"
    fi
    ```

    **Salida:** `El número es mayor que 10`

??? "Ejemplo 2: Verificar si un archivo existe"
    ``` bash
    #!/bin/bash
    archivo="script.sh"

    if [ -f "$archivo" ]; then
        echo "El archivo $archivo existe."
    fi
    ```

### ✏️ Paso 5
1. Abrí nuevamente el archivo script.sh
2. Modificá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ``` bash
        #!/bin/bash
        # Este script lista a todos los archivos con la terminación deseada de la carpeta en la que es ejecutado
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
        fi
        ```

    === "Código con comentarios"
        ``` bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        # *if* es la estructura más usada para condicionales.
        # Adentro de los dobles paréntesis va la condición.
        # > es el comparador, o sea, estamos preguntando si $numero es mayor que 10
        if [[ "$tipo_archivo" == ".fasta" ]]; then
            # El codigo entre *then* y *fi* solo si ejecuta si la condición es verdad, de otra forma se saltea
            # Este codigo esta más a la derecha, o *indentado*. Esto se hace con tab y en la mayoría de los lenguajes
            # es solo para entender más fácil el código
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
        fi
        # *fi* indica donde termina el condicional
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal

    ```bash
    bash script.sh ".fasta"
    ```

5. Observar el resultado obtenido

!!! info

    Es importante remarcar que la condición del *if* (lo que en este caso se encuentra entre los corchetes) es básicamente una pregunta que puede tener sólo una de dos respuestas posibles: **Sí** (llamada en programación **Verdadero** o **True**) ó **No** (llamada en programación **Falso** o **False**)


!!! info "¿Qué pasa cuando la condición NO se cumple?"

    Hasta ahora vimos que un `if` ejecuta un bloque de código **solo si la condición es verdadera**. Pero, ¿qué ocurre si la condición es falsa? Simplemente... no pasa nada. El script continúa con lo que sigue después del `fi`.

    Pero en la programación real, **queremos que nuestro script reaccione también cuando algo no es como esperamos**. Por ejemplo:

    - Si el archivo **no** existe, queremos crearlo o mostrar un error.
    - Si el usuario **no** es administrador, queremos denegar el acceso.
    - Si la nota **no** es suficiente, queremos mostrar un mensaje de desaprobado.

    Para eso existe el bloque `else`: lo que va dentro de `else` se ejecuta **cuando la condición es falsa**.

!!! info "Sintaxis básica con `else`"

    ```bash
    if [ condición ]; then
        # Comandos si la condición es VERDADERA
    else
        # Comandos si la condición es FALSA (NO se cumple)
    fi
    ```

### ✏️ Paso 6
1. Abrí nuevamente el archivo script.sh
2. Modificá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ``` bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
        else
            echo "No hay archivos .fasta en la carpeta de datos"
        fi
        ```

    === "Código con comentarios"
        ``` bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            # Ahora si la condición es verdad se va a ejecutar el código entre *then* y *else* y luego va a 
            # seguir a partir de *fi*
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
        else
            # El código entre *else* y *fi* se ejecuta solo cuando la condición no es verdad
            echo "No hay archivos .fasta en la carpeta de datos"
        fi
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal

    ```bash
    bash script.sh ".fasta"
    ```

5. Observar el resultado obtenido

??? info "Más información sobre los condicionales en Bash"
    Pueden ingresar en [esta página](https://atareao.es/tutorial/scripts-en-bash/condicionales-en-bash/) y en [esta página](https://tldp.org/LDP/abs/html/comparison-ops.html)

## Ciclos
Hasta ahora, nuestros scripts ejecutaban cada línea **una sola vez** y en orden secuencial. Pero en la programación real, muchas veces necesitamos **repetir una acción varias veces**. 

Para eso existen los **ciclos** (también llamados **bucles**). Un ciclo es una estructura que repite un bloque de código **mientras** o **hasta que** se cumpla una condición.

??? info "Tipos de ciclos en Bash"

    Bash tiene tres tipos principales de ciclos:

    | Tipo | ¿Cuándo usarlo? |
    | :--- | :--- |
    | `for` | Cuando sabes cuántas veces quieres repetir (o cuando quieres iterar sobre una lista de elementos). |
    | `while` | Cuando quieres repetir **mientras** una condición sea verdadera. |
    | `until` | Cuando quieres repetir **hasta que** una condición se vuelva verdadera (es lo opuesto a `while`). |


!!! info "El ciclo `for`"

    El ciclo `for` es ideal para recorrer listas de elementos (archivos, números, palabras, etc.).

    Sintaxis básica:

    ```bash
    for variable in lista; do
        # Comandos que se repiten
    done
    ```

### ✏️ Paso 7
1. Abrí nuevamente el archivo script.sh
2. Modificá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ```bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
            echo "Paciente" > ../resultados/informe_final.tsv
            for nombre in $(grep "^>" ../data/*.fasta); do
                echo "${nombre}" >> ../resultados/informe_final.tsv
            done  
        else
            echo "No hay archivos .fasta en la carpeta de datos"
        fi

        echo "Procesamiento completado."  
        ```

    === "Código con comentarios"
        ``` bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta

            echo "Paciente" > ../resultados/informe_final.tsv 
            for nombre in $(grep "^>" ../data/*.fasta); do
                # Este bucle se ejecuta una vez por cada línea que empieza con ">".
                # La variable 'nombre' contiene la línea completa (ej: ">seq1").

                # Escribimos la línea en la tabla.
                # Usamos printf en lugar de echo -e (más portable y seguro).
                echo "${nombre}" >> ../resultados/informe_final.tsv
            done  
        else
            echo "No hay archivos .fasta en la carpeta de datos"
        fi
        
        # Mostramos un mensaje final con el total de encabezados procesados.
        echo "Procesamiento completado."  
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal

    ```bash
    bash script.sh ".fasta"
    ```
5. Observar el resultado obtenido

??? info "Más sobre ciclos"
    Más información sobre los ciclos en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/bucles-en-bash/).

### ✏️ Paso 8

1. Abrí nuevamente el archivo script.sh
2. Modificá las siguientes líneas al archivo como se muestra a continuación

    === "Código"
        ```bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 
            echo -e "Paciente\tPos103" > ../resultados/informe_final.tsv

            for nombre in $(grep "^>" ../data/*.fasta); do
                secuencia=$(grep -A1 "^$nombre" ../data/*.fasta | tail -n1)
                aa103=$(echo "$secuencia" | cut -c103)
                echo -e "${nombre}\t${aa103}" >> ../resultados/informe_final.tsv
            done  
        else
            echo "No hay archivos .fasta en la carpeta de datos"
        fi

        echo "Procesamiento completado."  
        ```

    === "Código con comentarios"
        ```bash
        #!/bin/bash
        cd ../data/
        echo "Los archivos se encuentran en la siguiente ubicación"
        pwd

        echo "Buscando archivos con la terminación deseada"
        tipo_archivo=$1
        ls | grep "$tipo_archivo"

        if [[ "$tipo_archivo" == ".fasta" ]]; then
            echo "el archivo contiene los siguientes encabezados"
            grep "^>" ../data/*.fasta 

            # Crea un archivo TSV (valores separados por tabuladores) con un encabezado de dos columnas.
            # -e permite interpretar \t como tabulación.
            # El redireccionamiento ">" sobrescribe el archivo si ya existe.
            # El encabezado indica que la primera columna es "Paciente" y la segunda "Pos103".
            echo -e "Paciente\tPos103" > ../resultados/informe_final.tsv

            for nombre in $(grep "^>" ../data/*.fasta); do
                # Busca la línea que comienza con el encabezado exacto (incluyendo ">") en los archivos de tipo fasta,
                # luego toma la línea siguiente (la secuencia) con -A1 y descarta el encabezado con tail -n1.
                secuencia=$(grep -A1 "^$nombre" ../data/*.fasta | tail -n1)

                # Extrae el carácter número 103 de la secuencia usando cut -c (por carácter, no por byte).
                aa103=$(echo "$secuencia" | cut -c103)

                # Agrega una línea al TSV con el nombre del paciente y el aminoácido en la posición 103,
                # separados por un tabulador. El ">>" agrega al final del archivo sin sobrescribir.
                echo -e "${nombre}\t${aa103}" >> ../resultados/informe_final.tsv
            done  
        else
            echo "No hay archivos .fasta en la carpeta de datos"
        fi

        echo "Procesamiento completado."  
        ```

3. Guardar el archivo
4. Ejecutar el script desde terminal

    ```bash
    bash script.sh ".fasta"
    ```
5. Observar el resultado obtenido

### ✏️ Paso 9

Falta identificar el aminoácido presente en la posición 239. Utilizando el ejemplo anterior, incorporá las líneas de código necesarias para obtener la columna de la posición 239 y que la misma se guarde en informe_final.tsv. 

## Análisis de los resultados

### ✏️ Paso 10

Abrí el resultado obtenido con el script y completá la siguiente tabla:

| Paciente | Pos103 | Pos239 |
| :--- | :--- | :--- |
| **Referencia (canónica)** |  **P** | **V** |
| **Resistente** |  **R** | **G** |
| Paciente_001 | | |
| Paciente_002 | | |
| Paciente_003 | | |
| Paciente_004 | | |
| Paciente_005 | | |

Compará los resultados con la búsqueda manual que hicimos al comienzo del TP

??? "Pista"
    Podés incorporar una columna con la longitud de la secuencia usando 
    ```bash
        longitud=${#secuencia}
    ```
    
### ✏️ Paso 11
    
¿Qué paciente/s está/n infectados con una cepa resistente?
