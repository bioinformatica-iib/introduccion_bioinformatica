---
title: Practico Dos
icon: octicons/terminal-16
tags: 
  - practicos
---
![Image](img/banner.jpg){ width="250", align="left" }

# **TP 2**. Conceptos avanzados de programación en Bash { markdown data-toc-label = 'TP 2' }

[:fontawesome-solid-download: Materiales](data/datos.zip){ .md-button .md-button--primary }

## Objetivos
1. Familiarizarse con el uso de la terminal y sus comandos básicos para navegar, crear directorios y manipular archivos.

2. Obtener y procesar datos biológicos reales desde bases de datos públicas usando herramientas de línea de comandos.

3. Automatizar tareas utilizando  scripts, para procesar múltiples archivos.

## Parte 1: Scripts

Los *scripts* de Bash son básicamente una lista de muchos de los comandos que nosotros corrimos en la terminal, pero escritos dentro de un archivo. Al ejecutar ese archivo todos los comandos escritos en él serán corridos uno a uno de arriba a abajo.

En esencia, es un **mini programa** que:

- Automatiza tareas repetitivas (copias de seguridad, despliegues, etc.).
- Agrupa múltiples comandos del sistema en uno solo.
- Toma decisiones lógicas (`if`), itera (`for`, `while`) y maneja datos.
- No necesita compilación: se ejecuta directamente llamando al intérprete.


**Ejemplo mínimo:**
```bash
  #!/usr/bin/env bash
  # Este script lista a todos los archivos con termiación .fasta de la carpeta de datos
  cd ../datos/
  echo "Los archivos se encuentran en la siguiente ubicación"
  pwd

  echo "Buscando archivos de tipo fasta"
  ls | grep ".fasta"
```

Para ejecutarlo:

```bash
    chmod +x mi_script.sh   # dar permisos de ejecución
    bash mi_script.sh          # ejecutar
```

#### ✏️ Pregunta 1

1. Ingresa a la carpeta de scripts del TP1
2. Generá un archivo de texto que se llame script.sh
3. Copiá el texto del ejemplo mínimo dentro del archivo de texto
4. Cambiá el permiso de ejecución
5. Ejecutá el sccript
6. Leer el resultado obtenido. ¿Fué el resultado esperado?

#### Elementos que componen un script Bash

| Elemento | Descripción | Ejemplo práctico |
| :--- | :--- | :--- |
| **Shebang** | Línea obligatoria al inicio que indica qué intérprete usar. | `#!/usr/bin/env bash` |
| **Comentarios** | Texto explicativo para humanos, ignorado por Bash. Empiezan con `#`. | `# Esta variable guarda la ruta de backup` |
| **Variables** | Almacenan datos (texto, números, rutas). | `NOMBRE="Ana"` o `CONTADOR=5` |
| **Comandos del sistema** | Instrucciones ejecutables (`ls`, `cp`, `grep`, etc.). | `cp "$ORIGEN" "$DESTINO"` |
| **Estructuras de control** | Condicionales, bucles y casos para controlar el flujo. | `if [[ -f "$archivo" ]]; then ...` |

#### Importancia del orden secuencial de los pasos

En Bash, **el orden es crítico** porque los comandos se ejecutan **línea por línea, de arriba a abajo**, y el resultado de uno afecta a los siguientes.

#### Consecuencias del desorden:
- **Dependencias rotas:** Si creas un directorio después de intentar copiar archivos a él, el script falla.

```bash
    # MALO
    cp archivo.txt /tmp/backup/   # Falla si /tmp/backup no existe
    mkdir -p /tmp/backup
```

```bash
    # BUENO
    mkdir -p /tmp/backup
    cp archivo.txt /tmp/backup/
```

- **Variables no definidas:** Usar una variable antes de asignarle valor devuelve vacío o error.

```bash
    # MALO
    echo "$RUTA"    # RUTA aún no tiene valor
    RUTA="/home/user"
```

- **Cambios de directorio (`cd`):** Un `cd` al principio afecta a todo lo que viene después; si lo pones al final, no tendrá efecto sobre comandos anteriores.

- **Regla de oro:** El script debe leerse como una receta de cocina: primero los ingredientes (variables), luego los preparativos (crear directorios), luego la cocción (comandos principales) y al final el emplatado (mensajes de salida).

??? info "Buenas prácticas para escribir scripts profesionales"

    | Práctica | Explicación | Ejemplo |
    | :--- | :--- | :--- |
    | **Shebang portable** | Usar `#!/usr/bin/env bash` para mayor compatibilidad entre sistemas. | `#!/usr/bin/env bash` |
    | **Nombres de variables claros** | Mayúsculas para globales, minúsculas para locales. | `BACKUP_DIR` vs `contador` |
    | **Validación de argumentos** | Comprobar que el usuario pasa los parámetros necesarios y mostrar ayuda. | `if [[ $# -lt 1 ]]; then echo "Uso: ..."; exit 1; fi` |
    | **Manejo de rutas absolutas** | No usar `cd` sin control; mejor usar subshells o rutas fijas. | `(cd /ruta && comando)` |
    | **Comentarios útiles** | Explicar el *por qué*, no el *qué* (el código ya dice el qué). | `# Forzamos el borrado porque el espacio es crítico` |

??? warning "Errores comunes (y cómo solucionarlos)"

    | Error típico | ¿Por qué ocurre? | Solución |
    | :--- | :--- | :--- |
    | **Olvidar el shebang** | El sistema ejecuta el script con `/bin/sh`, no Bash, y fallan características avanzadas. | Poner `#!/usr/bin/env bash` siempre. |
    | **Espacios alrededor del `=`** | Bash interpreta `NOMBRE = "Juan"` como un comando y da error. | Escribir `NOMBRE="Juan"` sin espacios. |
    | **No poner comillas en variables** | Si `$archivo` contiene espacios, se parte en múltiples argumentos. | Usar `"$archivo"` siempre. |
    | **Comparar números con `>` o `<`** | Dentro de `[ ]`, esos operadores comparan strings, no números. | Usar `-gt`, `-lt`, o mejor `(( a > b ))`. |
    | **Usar `exit` sin código** | No se sabe si el script terminó bien o mal. | Usar `exit 0` (éxito) o `exit 1` (error). |
    | **No verificar el `cd`** | Si el directorio no existe, el script continúa en la ruta equivocada. | `cd /ruta || exit 1` |
    | **Ignorar Ctrl+C (señales)** | El usuario cancela y quedan archivos temporales sueltos. | Usar `trap 'limpiar' INT` para borrar temporales. |
    | **Confiar en rutas relativas** | El script se comporta distinto según dónde se ejecute. | Obtener la ruta base con `SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"` |

### Variables

Las variables son *palabras* que guardan dentro de ellas un número o un *string* (texto), entre otro tipo de valores posibles que veremos más adelante. Veamos un ejemplo de como usar variables (vean ambas pestañas):

=== "Código"

    ``` bash
    #!/usr/bin/env bash
    # Este script lista a todos los archivos con la termiación deseada
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=".fasta" 
    ls | grep "$tipo_archivo"
    ```

=== "Código con comentarios"

    ``` bash
    #!/usr/bin/env bash

    # Las lineas que empiezan con # son comentarios, no afectan el código y sirven para aclarar que estas 
    # haciendo en tu programa o script

    # Este script lista a todos los archivos con la termiación deseada
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    # Al declarar una variable en Bash no se puede poner espacio entre la variable, el = y el valor
    # Las comillas se usan para indicar que lo de adentro es una cadena de caracteres, o *string*
    tipo_archivo=".fasta"

    # Cuando se usa la variable, se le agrega el prefijo $
    ls | grep "$tipo_archivo"
    ```
#### ✏️ Pregunta 2
Agregá las nuevas líneas de código al script y ejecutalo

Una de las funcionalidades más potentes de los scripts es la capacidad de recibir **parámetros** desde la línea de comandos. En lugar de escribir valores fijos dentro del script, podemos pasarlos en el momento de la ejecución, haciendo que el script sea reutilizable y flexible.

¿Se acuerdan de los **parámetros** de los comandos de Bash? Al pasarle parámetros a un script de Bash estos se asignan automaticamente a variables llamadas `$1`, `$2`, etc. Editemos ahora nuestro código anterior:

=== "Código"

    ``` bash
    #!/usr/bin/env bash
    # Este script lista a todos los archivos con la termiación deseada de la carpeta en la que es ejecutado
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"
    ```

=== "Código con comentarios"

    ``` bash
    #!/usr/bin/env bash

    # Las lineas que empiezan con # son comentarios, no afectan el código y sirven para aclarar que estas 
    # haciendo en tu programa o script
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    # Este script lista a todos los archivos con la termiación deseada
    echo "Buscando archivos con la terminación deseada"
    # Al declarar una variable en Bash no se puede poner espacio entre la variable, el = y el valor
    # Las comillas se usan para indicar que lo de adentro es una cadena de caracteres, o *string*
    tipo_archivo=$1

    # Cuando se usa la variable, se le agrega el prefijo $
    ls | grep "$tipo_archivo"
    ```

Y ahora corran:

```bash
bash SCRIPT "variable"
```

#### ✏️ Pregunta 3

Agreguen las nuevas líenas de código y ejecuten el script usando los siguientes comandos

```bash
    bash script.sh ".fasta"
```

!!! info

    Técnicamente si estoy pasando solo una palabra las comillas no son necesarias, pero si el *string* que estoy pasando tiene un espacio tengo que ponerlas sí o sí.

Hay bastante más para hablar de las *variables*. Existen muchos tipos más de variables, como:

* *booleanos* (variable que es verdadera o falsa),
* *arreglos* (o vectores)
* listas.

Otros lenguajes de programación hasta tienen variables más complejas que pueden almacenar tablas enteras. Sin embargo, lo que acabamos de aprender es la base y va a ser suficiente por ahora. Más información sobre las variables en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/variables-en-bash/).

### Condicionales

Las variables son importantes, pero gran parte de la programación es controlar el "flujo" del programa, es decir, que un script haga algo más que simplemente ir de arriba a abajo ejecutando comandos. La primera herramienta que vamos a aprender para controlar el flujo del programa son los *condicionales* que permiten crear secciones de código que se van a ejecutar solo si se cumple (o no se cumple) una condición. Por ejemplo:

=== "Código"


    ``` bash
    #!/usr/bin/env bash
    # Este script lista a todos los archivos con la termiación deseada de la carpeta en la que es ejecutado
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"

    if [[ "$tipo_archivo" == ".fasta" ]]; then
        echo "el archivo contiene los siguientes encabezados"
        grep "^>" ../datos/*.fasta 
    fi
    ```

=== "Código con comentarios"

    ``` bash
    #!/usr/bin/env bash
    cd ../datos/
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
        grep "^>" ../datos/*.fasta 
    fi
    # *fi* indica donde termina el condicional
    ```
#### ✏️ Pregunta 4

Copien este código a un script y prueben pasarle diferentes tipos de archivos.

!!! info

    Es importante remarcar que la condición del *if* (lo que en este caso se encuentra entre los corchetes) es básicamente una pregunta que puede tener sólo una de dos respuestas posibles: **Sí** (llamada en programación **Verdadero** o **True**) ó **No** (llamada en programación **Falso** o **False**)

Recuerden que a un condicional se le puede poner también que pase algo cuando **no es verdad**, por ejemplo:

=== "Código"

    ``` bash
    #!/usr/bin/env bash
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"

    if [[ "$tipo_archivo" == ".fasta" ]]; then
        echo "el archivo contiene los siguientes encabezados"
        grep "^>" ../datos/*.fasta 
    else
        echo "No hay archivos .fasta en la carpeta de datos"
    fi
    ```

=== "Código con comentarios"

    ``` bash
    #!/usr/bin/env bash
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"

    if [[ "$tipo_archivo" == ".fasta" ]]; then
        # Ahora si la condición es verdad se va a ejecutar el código entre *then* y *else* y luego va a 
        # seguir a partir de *fi*
        echo "el archivo contiene los siguientes encabezados"
        grep "^>" ../datos/*.fasta 
    else
        # El código entre *else* y *fi* se ejecuta solo cuando la condición no es verdad
        echo "No hay archivos .fasta en la carpeta de datos"
    fi
    ```

#### ✏️ Pregunta 5

Agreguen las nuevas líenas de código y ejecuten el script 

Hay muchos más *comparadores* para usar con los *condicionales if* y son diferentes si estoy comparando números o *strings*. Se puede poner más de una condición por *if* y hay otras estructuras, como los *case*, que cumplen una función similar. Sin embargo, la base que aprendieron hoy es suficiente por ahora.

Más información sobre los condicionales en Bash, incluyendo una lista más detallada de los comparadores, se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/condicionales-en-bash/) y en [esta página](https://tldp.org/LDP/abs/html/comparison-ops.html) (en Bash las condiciones pueden estar rodeadas por paréntesis o corchetes y en cada caso los comparadores se comportan diferente, ojo con esto).

### Ciclos

Los *ciclos* son estructuras que nos permiten repetir algo varias veces y al usar variables podemos hacer que cada vez sea ligeramente diferente a la anterior.

=== "Código"

    ``` bash
    #!/usr/bin/env bash
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"

    if [[ "$tipo_archivo" == ".fasta" ]]; then
        echo "el archivo contiene los siguientes encabezados"
        grep "^>" ../datos/*.fasta 
    else
        echo "No hay archivos .fasta en la carpeta de datos"
    fi

    echo -e "Paciente\tMuestra" > ../resultados/detalle_pacientes.tsv
    contador=0
    for nombre in $(grep "^>" ../datos/*.fasta); do
      contador=$(( contador + 1 ))
      echo -e "${nombre}\t${contador}" >> ../resultados/detalle_pacientes.tsv
    done  
    echo "Procesamiento completado. Se encontraron $contador encabezados."  
    ```

=== "Código con comentarios"

    ``` bash
    #!/usr/bin/env bash
    cd ../datos/
    echo "Los archivos se encuentran en la siguiente ubicación"
    pwd

    echo "Buscando archivos con la terminación deseada"
    tipo_archivo=$1
    ls | grep "$tipo_archivo"

    if [[ "$tipo_archivo" == ".fasta" ]]; then
        echo "el archivo contiene los siguientes encabezados"
        grep "^>" ../datos/*.fasta 
    else
        echo "No hay archivos .fasta en la carpeta de datos"
    fi
    
    echo -e "Paciente\tMuestra" > ../resultados/detalle_pacientes.tsv
    contador=0

    for nombre in $(grep "^>" ../datos/*.fasta); do
        # Este bucle se ejecuta una vez por cada línea que empieza con ">".
        # La variable 'nombre' contiene la línea completa (ej: ">seq1").

        # Incrementamos el contador usando aritmética de Bash.
        # (contador++ es otra forma válida: (( contador++ )) )
        # El código entre *do* y *done* se va a ejecutar una vez para cada posible $i en el rango
        contador=$(( contador + 1 ))

        # Escribimos la línea en el TSV con tabulador y el número de orden.
        # Usamos printf en lugar de echo -e (más portable y seguro).
        echo -e "${nombre}\t${contador}" >> ../resultados/detalle_pacientes.tsv
    done  

    # Mostramos un mensaje final con el total de encabezados procesados.
    echo "Procesamiento completado. Se encontraron $contador encabezados."  
    ```

#### ✏️ Pregunta 6

1. Ejecutá el script y revisá la generación de la tabla "detalle_pacientes.tsv" 
2. Renombrar el archivo script.sh con un nombre más descriptivo

Hay otros dos tipos de ciclos comúnmente denominados *while* y *until* (también llamado *do*) y hay formas de forzar salir del ciclo o pasar a la próxima iteración con *break* y *continue* (tambien llamado *next*).

Nuevamente, la base aprendida será suficiente por ahora. Más información sobre los ciclos en Bash se puede ver en [esta página](https://atareao.es/tutorial/scripts-en-bash/bucles-en-bash/).

## Parte 2: Ejercicio

En este ejercicio vamos a trabajar con las secuencias de ADN del TP01a de los pacientes para convertirlas en proteínas y así poder identificar las mutaciones en las posiciones 103 y 239. 

Lo que vamos a hacer:

1. Extraer el aminoácido en la posición 103 de cada paciente.
2. Extraer el aminoácido en la posición 239 de cada paciente.
3. Determinar qué pacientes tienen las mutaciones que confieren resistencia.

#### ✏️ Pregunta 7

Abrí el archivo de las secuencias y completá la siguiente tabla:

| Paciente | Pos103 | Pos239 |
| :--- | :--- | :--- |
| **Referencia (canónica)** |  **P** | **V** |
| **Resistente** |  **R** | **G** |
| Paciente_001 | | |
| Paciente_002 | | |
| Paciente_003 | | |
| Paciente_004 | | |
| Paciente_005 | | |

#### ✏️ Pregunta 8

Generá un instructivo con los pasos que usaste para buscar las mutaciones relevantes para que pueda ser replicado por otra persona (o una computadora)

---
### Automatizar tareas

#### Paso 1: Descargar el script

El script ya está disponible en el repositorio del curso. Ingresá a la carpeta `scripts/` y ejecuta lo siguiente:

```bash
wget "https://bioinformatica-iib.github.io/introduccion_bioinformatica/practicos/TP01_Linux/data/script.sh"
```

#### ✏️ Pregunta 9
    
Abrir el archivo script.sh con el editor de texto e indicar qué hace cada línea del script

#### Paso 2: Dar permisos de ejecución al script

Para poder ejecutar el script, necesita permisos de ejecución. Usá el comando `chmod`:

```bash
chmod +x script.sh
```

**Verificación:** Ejecutá `ls -l script.sh` y verificá que los permisos incluyan `-rwxr-xr-x` (la `x` indica que es ejecutable).


#### Paso 3: Ejecutar el script

Ahora ejecutá el script desde la terminal:
```bash
bash script.sh
```

**Salida esperada:** El script va a guardar un informe en `resultados/informe_final.tsv`.

**Verificación:** Abrí el archivo generado para confirmar que se creó correctamente:
```bash
head ../resultados/informe_final.tsv
```

#### Paso 4: Completar la tabla 

Usando los datos que obtuvo el script, completá la siguiente tabla:

| Paciente | Longitud (aa) | Pos103 | Pos239 |
| :--- | :--- | :--- | :--- |
| **Referencia (canónica)** | **293** | **P** | **V** |
| **Resistente** | **293** | **R** | **G** |
| Paciente_001 | | | |
| Paciente_002 | | | |
| Paciente_003 | | | |
| Paciente_004 | | | |
| Paciente_005 | | | |

#### ✏️ Pregunta 10
    
¿Qué paciente/s está/n infectados con una cepa resistente?

#### ✏️ Pregunta 11
        
¿Obtuviste los mismos resultandos haciendo la búsqueda manual que con el script?

