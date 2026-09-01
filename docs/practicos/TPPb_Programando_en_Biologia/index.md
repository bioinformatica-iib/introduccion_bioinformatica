---
title: Practico Programación en Python
icon: octicons/code-16
tags: 
  - practicos
---

![Image](img/banner_python.png){ width="250", align="left" }

# **TPP**. Python - Programando en biología - Parte 2 { markdown data-toc-label = 'TPP' }

<br>
<br>
<br>
<br>
<br>
<br>
<br>
 
<!--
[:fontawesome-solid-download: Materiales](https://drive.google.com/file/d/1Da0QnUdFtibScCXHi-Ts2kQXa8xudSrJ/view?usp=drive_link){ .md-button .md-button--primary }

[:fontawesome-solid-file-powerpoint: Slides](https://docs.google.com/presentation/d/1h6C-Z0_iWO0Ln8zTZd4QsNqEN5_hih_hM1pbxsoaQBU/edit?usp=sharing){ .md-button .md-button--primary } 
-->

!!! abstract "Atención: Este TP NO tiene informe."

<!--
Este es el botón para descargar materiales, en (#) hay que agregar el link correspondiente

### Slides mostrados en clase
* :fontawesome-regular-file-pdf: [Slides TP](https://drive.google.com/file/d/1_0sLD3ICSRE7ZC5IiyIDMEtt7RXsgHRz/view?usp=sharing)

### Codigo completo
* :fontawesome-regular-file-code: [Archivo .R visto en el cierre](https://drive.google.com/file/d/1N1vXsJFuGojUooAEG5SgcyE2bMqW0B9C/view?usp=sharing)

### Video de la clase grabada
* :octicons-video-16: [Cierre de tp](https://youtu.be/yrtMNj23f9U)
-->

### Software a usar
* Python (Google Colab)

### Recursos Online
* [Google Colab - Guía de inicio](https://colab.research.google.com/notebooks/intro.ipynb#scrollTo=GJBs_flRovLc)
* [Python Tutorial (Documentación oficial)](https://docs.python.org/3/tutorial/)
* [Pandas - User Guide](https://pandas.pydata.org/docs/user_guide/index.html)
* [Pandas Cheat Sheet](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf)
* [Curso Kaggle Learn - Python](https://www.kaggle.com/learn/python)
* [Curso Kaggle Learn - Pandas](https://www.kaggle.com/learn/pandas)


### Objetivos

* Familiarizarse en el lenguaje de programación **Python**.
* Ver como los mismos conceptos de programación se transladan de un lenguaje a otro.
* Utilizar herramientas de programación para resolver problemas biológicos.


## **Python: Funciones**

Como ya mencionamos cuando hablamos de los ciclos, es común en programación querer realizar una tarea muchas veces con datos ligeramente diferentes. Para evitar repetir código existen las **funciones**, que además de formar parte de **Python** y de las distintas librerías, también pueden ser creadas por nosotros.

Supongamos que queremos calcular la temperatura de melting de un primer. Podemos definir una función de la siguiente forma:

```python
def temperatura_melting(primer):
    A = primer.count("A")
    T = primer.count("T")
    G = primer.count("G")
    C = primer.count("C")

    tm = 2 * (A + T) + 4 * (G + C)

    return tm


primer1 = "ATGCGTACGATCG"
primer2 = "GCGTACGCGGATCGCTAGCTACGATG"

tm1 = temperatura_melting(primer1)
tm2 = temperatura_melting(primer2)

print(tm1)
print(tm2)
```
En este ejemplo:

* `def` indica que estamos definiendo una función.
* `temperatura_melting` es el nombre de la función.
* `primer` es el parámetro de entrada y contiene la secuencia del primer.
* `return` indica cuál será el valor que devolverá la función.

Las funciones permiten reutilizar código y evitar escribir varias veces las mismas instrucciones. Imaginen que el cálculo ocupara 20 o 30 líneas de código: con una función solo habría que escribirlo una vez.

También es posible definir funciones con más de un parámetro. Incluso algunos parámetros pueden tener un **valor por defecto**, que será utilizado si no indicamos otro valor.

```python
def peso_proteina(secuencia, peso_promedio_aminoacido=110):
    peso = len(secuencia) * peso_promedio_aminoacido

    return peso


proteina1 = "MKTLLVAGCGTALAVASAPVAAEAKKAGVEAKKAAEAGVEAAGVEAKKAGVEVVV"

peso1 = peso_proteina(proteina1)
peso2 = peso_proteina(proteina1, peso_promedio_aminoacido=115)

print(peso1)
print(peso2)
```
Como pueden ver, si no especificamos el parámetro peso_promedio_aminoacido, Python utiliza automáticamente su valor por defecto (110 Da). Sin embargo, podemos modificarlo cuando llamamos a la función. Esto permite utilizar la misma función con diferentes valores sin necesidad de modificar el código que se encuentra dentro de ella.

## **Librerías**

Hasta ahora trabajamos únicamente con funciones y estructuras que forman parte de **Python**. Sin embargo, una de las mayores fortalezas del lenguaje es la enorme cantidad de **librerías** desarrolladas por la comunidad.

Una **librería** es un conjunto de funciones y herramientas escritas por otras personas que podemos reutilizar en nuestros programas. En lugar de escribir todo desde cero, simplemente cargamos la librería y utilizamos sus funciones.

Por ejemplo:

* **pandas** permite trabajar con tablas de datos.
* **numpy** agrega herramientas para realizar cálculos numéricos de forma eficiente.
* **matplotlib** permite crear gráficos.
* **scikit-learn** proporciona algoritmos y herramientas para *Machine Learning*.
* **BioPython** incluye funciones específicas para bioinformática.

### Instalar librerías

Las librerías pueden instalarse utilizando el gestor de paquetes **pip**. Por ejemplo, para instalar **pandas** desde una terminal se utiliza:

```bash
pip install pandas
```

Esta instalación solo es necesaria una vez por computadora.

!!! tip "Google Colab"

    Google Colab ya incluye instaladas muchas de las librerías más utilizadas para ciencia de datos y bioinformática, entre ellas **pandas**, **numpy**, **matplotlib** y **scikit-learn**. Por lo tanto, en este curso normalmente no será necesario instalarlas.

### Importar librerías

Aunque una librería ya esté instalada, es necesario **importarla** en cada notebook donde vayamos a utilizarla.

La forma más común de hacerlo es mediante la instrucción `import`. Por ejemplo:

```python
import pandas
```

A partir de ese momento podremos utilizar todas las funciones y herramientas de esa librería escribiendo su nombre seguido de un punto (`.`). Por ejemplo:

```python
pandas.DataFrame(...)
```

Como escribir el nombre completo de la librería muchas veces puede resultar incómodo, **Python** permite asignarle un **alias**, es decir, un nombre más corto que utilizaremos durante el resto del programa.

Esto se hace con la palabra `as`:

```python
import pandas as pd
```

En este ejemplo, `pd` es simplemente un alias de `pandas`. Por lo tanto, las siguientes instrucciones son equivalentes:

```python
pandas.DataFrame(...)
```

```python
pd.DataFrame(...)
```

El uso de alias es muy común en **Python** y facilita la escritura del código. Algunas convenciones ampliamente utilizadas son:

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
```

## **NumPy: Arrays**

Hasta ahora trabajamos con **listas**, que son una de las estructuras de datos más utilizadas en **Python**. Sin embargo, cuando queremos realizar cálculos numéricos sobre grandes cantidades de datos (como suele ocurrir en bioinformática), las listas no son la herramienta más eficiente.

Para este tipo de tareas existe la librería **NumPy**, que proporciona un tipo de dato llamado **array**. Un array es similar a una lista, pero está optimizado para almacenar grandes cantidades de datos del mismo tipo y realizar operaciones matemáticas de forma muy eficiente.

### Crear arrays

Los arrays pueden crearse de distintas maneras. Una de las más comunes es utilizando la función `array()`.

```python
import numpy as np

array = np.array([1, 2, 3, 4, 5])

print(array)
```

También podemos crear secuencias de números utilizando `arange()`:

```python
array = np.arange(1, 11)

print(array)
```

```text
[ 1  2  3  4  5  6  7  8  9 10]
```

Los arrays pueden contener distintos tipos de datos, incluyendo strings. Por ejemplo, podemos utilizarlos para almacenar secuencias de ADN.

```python
import numpy as np

secuencias = np.array(["ATGCGT", "GGCCTA", "TACGGA", "CCATGC"])

print(secuencias)
```
### Acceder a elementos de un array
Al igual que en las listas de Python, podemos acceder a los elementos de un array utilizando índices. Recordemos que el primer elemento ocupa la posición 0.

```python
concentraciones = np.array([10, 20, 30, 40, 50])

print(concentraciones[0])
print(concentraciones[2])
```

```text
10
30
```

### Operaciones matemáticas

Una de las principales ventajas de los arrays es que las operaciones matemáticas se realizan **elemento a elemento**. Este comportamiento es muy similar al de los vectores de **R**.

```python
concentraciones = np.array([10, 20, 30, 40])

print(concentraciones + 2)

print(concentraciones * 3)

print(concentraciones ** 2)
```

```text
[12 22 32 42]
[ 30  60  90 120]
[ 100  400  900 1600]
```

#### ✏️ Ejercicio 1
Para observar la diferencia entre las operaciones realizadas sobre arrays de NumPy y sobre listas de Python, ejecuten el siguiente código:
```python
import numpy as np

concentraciones_array = np.array([10, 20, 30, 40])

print(concentraciones_array * 2)


concentraciones_lista = [10, 20, 30, 40]

print(concentraciones_lista * 2)
```
**¿Cómo les dio cada resultado? ¿Qué diferencia observan entre las operaciones realizadas sobre el array y sobre la lista?**

### Funciones sobre arrays

NumPy también incluye muchas funciones matemáticas que trabajan directamente sobre arrays.

```python
print(np.mean(concentraciones))

print(np.max(concentraciones))

print(np.min(concentraciones))
```

```text
25.0
40
10
```

Muchas funciones de **NumPy** aceptan arrays como entrada y devuelven otro array como resultado, lo que permite escribir programas muy compactos y eficientes.

!!! info "Listas vs Arrays"

    Las listas son estructuras generales de **Python** que pueden contener elementos de distintos tipos. Los arrays de **NumPy**, en cambio, están pensados para trabajar con datos numéricos y suelen ser mucho más rápidos al realizar cálculos matemáticos



## **Google Drive**

Hasta ahora trabajamos con archivos almacenados dentro de la sesión de **Google Colab**. Sin embargo, esa sesión es **temporal**: si la cerramos o se reinicia el entorno de ejecución, todos los archivos almacenados localmente se pierden.

Una forma de evitar esto es **montar Google Drive**, lo que permite acceder directamente a los archivos almacenados en nuestra cuenta de Google, de forma similar a si fueran una carpeta más de la computadora.

Entre otras cosas, esto nos permite:

* Mantener organizados los notebooks y los datos del trabajo práctico.
* Evitar subir los mismos archivos cada vez que abrimos Colab.
* Guardar automáticamente tablas, figuras y resultados para utilizarlos en el futuro.

### ✏️Ejercicio 2 - Montar Google Drive

Para conectar Google Drive con Colab ejecuten la siguiente celda:

```python
from google.colab import drive
drive.mount("/content/drive")
```

Al ejecutarla aparecerá un enlace para autorizar el acceso a su cuenta de Google.

1. Hagan clic sobre el enlace.
2. Inicien sesión (si fuera necesario).
3. Autoricen a Google Colab a acceder a su Drive.

Si todo salió correctamente verán un mensaje similar a:

```text
Mounted at /content/drive
```

### Acceder a los archivos

Una vez montado el Drive, todos sus archivos estarán disponibles dentro de la carpeta:

```text
/content/drive/MyDrive/
```

Por ejemplo, si tienen un archivo llamado **datos.tsv** dentro de la carpeta **Bioinformatica**, podrán leerlo usando:

```python
import pandas as pd

df = pd.read_csv("/content/drive/MyDrive/Bioinformatica/datos.tsv", sep="\t")
```

Del mismo modo, cualquier archivo que escriban dentro de esa carpeta quedará guardado permanentemente en su cuenta de Google Drive.

### Verificar que el Drive fue montado

Pueden comprobar que todo funciona ejecutando:

```python
import os

os.listdir("/content/drive/MyDrive")
```
Este comando mostrará el contenido de la carpeta principal de su Google Drive.

También lo podrían hacer desde la terminal de Bash en Google Colab con: 

```bash
ls /content/drive/MyDrive
```

!!! tip "Organización"

    Es recomendable crear una carpeta para la materia (por ejemplo, **Introducción_Bioinformática**) y guardar allí todos los notebooks, datos y resultados de los trabajos prácticos. Esto facilitará encontrar los archivos y reutilizarlos en futuras clases.

!!! warning "Sesiones temporales"

    El Drive debe montarse nuevamente cada vez que se inicia una nueva sesión de Google Colab. Sin embargo, **los archivos almacenados en Google Drive no se pierden**, por lo que no será necesario volver a subirlos.


## **Python: Tablas**

Hasta ahora vimos variables simples (como números y *strings*) y listas. Sin embargo, en bioinformática es muy común trabajar con **tablas**.

En **Python**, la librería más utilizada para trabajar con tablas es **pandas**. Las tablas de pandas reciben el nombre de **DataFrames**.

### Crear un DataFrame

```python
import pandas as pd

genes = ["ERT2", "TTR4", "REC1"]
esencial = [False, False, True]
expresion = [100, 1000, 10000]

df = pd.DataFrame({
    "gen": genes,
    "esencial": esencial,
    "expresion": expresion
})
```

Aca estamos creando un DataFrame llamado df que contiene 3 columnas, **gen**, **esencial** y **expresion**, cada una conteniendo una lista de valores. Es importante notar que todas las listas deben tener la misma longitud, ya que el primer elemento de cada una corresponde a la primera fila de la tabla, el segundo elemento a la segunda fila y así sucesivamente.

!!! tip "Tip"

    Observen que el contenido del `DataFrame()` está distribuido en varias líneas. En Python esto es completamente válido siempre que el código permanezca dentro de los paréntesis. Es una práctica muy recomendable cuando una función tiene muchos argumentos, ya que facilita la lectura del código.

Podemos visualizar el contenido del DataFrame escribiendo simplemente:

```python
print(df)
```

```python
   gen esencial expresion
0 ERT2    False       100
1 TTR4    False      1000
2 REC1     True     10000
```

### Acceder a columnas

Podemos acceder a una columna indicando su nombre entre corchetes:

```python
print(df["gen"])
```

```text
0    ERT2
1    TTR4
2    REC1
Name: gen, dtype: object
```
df["gen"] ya no es un DataFrame sino una Serie (Series), que representa una única columna de la tabla.

### Acceder a filas

Para acceder a una fila utilizaremos `iloc` (*integer location*). `iloc` permite acceder a las filas y columnas utilizando su **posición numérica**.

```python
print(df.iloc[0])
```

```text
gen            ERT2
esencial      False
expresion      100
Name: 0, dtype: object
```

Por ejemplo, `df.iloc[0]` devuelve la primera fila. Y `df.iloc[2]` devuelve la tercera fila del DataFrame.

!!! info "iloc y loc"

    En este TP utilizaremos `iloc`, que accede a las filas mediante su posición (0, 1, 2, ...).

    También existe `loc`, que permite acceder a las filas utilizando sus etiquetas, índices o booleanos.

### Acceder a elemento o celda
También podemos acceder a un elemento específico de la tabla, es decir, a una celda, indicando tanto la fila como la columna.

Una forma de hacerlo es utilizando iloc. Cuando utilizamos iloc, primero indicamos la fila y luego la columna:

```python
print(df.iloc[0, 2])
```
```text
100
```
En este caso, 0 indica la primera fila y 2 la tercera columna.

!!! info "con loc"
    También podemos acceder a una celda utilizando el nombre de la columna:
    ```python
    print(df.loc[0, "expresion"])
    ```
    ```text
    100
    ```
    De esta manera, loc permite indicar la etiqueta de la fila y el nombre de la columna.

### Filtrar con booleanos

Una de las operaciones más importantes al trabajar con tablas es filtrar las filas que cumplen una determinada condición.

Por ejemplo, podemos seleccionar solamente los genes cuya expresión sea mayor a 500:

```python
print(df[df["expresion"] > 500])
```
```text
    gen  esencial  expresion
1  TTR4     False       1000
2  REC1      True      10000
```
También podemos combinar condiciones. Por ejemplo, para seleccionar genes cuya expresión sea mayor a 500 y que sean esenciales:
```python
print(df[(df["expresion"] > 500) & (df["esencial"] == True)])
```
```text
    gen  esencial  expresion
2  REC1      True      10000
```
En este caso, & representa AND: ambas condiciones deben cumplirse.

!!! warning "Importante: combinar condiciones en pandas"

    Cuando filtramos un `DataFrame` utilizando condiciones sobre columnas,
    no utilizamos `and` y `or`. En su lugar, utilizamos:

    - `&` → **AND**
    - `|` → **OR**
    - `~` → **NOT**

    Además, cada condición debe estar entre paréntesis.

    Por ejemplo:

    ```python
    df[(df["expresion"] > 500) & (df["esencial"] == True)]
    ```

    Para un **OR**:

    ```python
    df[(df["expresion"] > 500) | (df["esencial"] == True)]
    ```

### Resumen de la tabla

Otra función muy útil es `info()`, que devuelve información general sobre la tabla:

```python
df.info()
```

Entre otras cosas, muestra:

* La cantidad de filas y columnas.
* El nombre de cada columna.
* El tipo de dato de cada columna.

También podemos utilizar `describe()`, que calcula distintos estadísticos para las columnas numéricas:

```python
df.describe()
```

Esta función devuelve información como el mínimo, máximo, promedio, desvío estándar y distintos percentiles.

### Escribir tablas

Para guardar un DataFrame utilizaremos la función `to_csv()`. Por ejemplo:

```python
df.to_csv("genes.tsv", sep="\t", index=False)
```

Los parámetros utilizados son:

* `df` es el DataFrame que queremos guardar.
* `"genes.tsv"` es el nombre del archivo de salida. Generalmente tendrá extensión **.tsv** si las columnas están separadas por tabulaciones o **.csv** si están separadas por comas.
* `sep="\t"` indica que las columnas estarán separadas por tabulaciones.
* `index=False` evita guardar la numeración de las filas como una columna adicional.

#### ✏️ Ejercicio 3
Guarden el DataFrame creado anteriormente con el nombre **genes_expresion.tsv**. Confirmen que el archivo fue creado correctamente desde la pestaña **Archivos** de Google Colab.

### Leer tablas

Para leer una tabla utilizaremos la función `read_csv()`. Por ejemplo:

```python
nuevo_df = pd.read_csv("genes.tsv", sep="\t")
```

Los parámetros utilizados son:

* `"genes.tsv"` es el nombre del archivo a leer. Si se trata de un *path* absoluto se leerá desde esa ubicación; si es un *path* relativo, será relativo al directorio actual.
* `sep="\t"` indica cuál es el separador utilizado entre las columnas del archivo.

#### ✏️ Ejercicio 4
Creen una variable llamada **nuevo_df** y carguen la tabla creada en el punto anterior. Utilicen `print()` para confirmar que el archivo se leyó correctamente.

### Datos faltantes: `NA`

En datos biológicos es frecuente encontrar **datos faltantes**. Por ejemplo, puede ocurrir que para una determinada muestra no se haya podido medir la expresión de un gen.

En un `DataFrame` de `pandas`, los datos faltantes suelen representarse como `NaN` (*Not a Number*):

```python
import pandas as pd

df = pd.DataFrame({
    "gen": ["TP53", "BRCA1", "MYC", "EGFR"],
    "expresion": [100, 250, None, 500]
})

print(df)
```

```text
     gen  expresion
0   TP53      100.0
1  BRCA1      250.0
2    MYC        NaN
3   EGFR      500.0
```
En este caso, el valor de expresión de MYC es desconocido o está ausente.

Cuando leemos una tabla desde un archivo, pandas reconoce automáticamente algunos valores como datos faltantes, como NA, NaN o celdas vacías.

Sin embargo, en algunos archivos los datos faltantes pueden estar representados utilizando una cadena específica. Por ejemplo, supongamos que nuestro archivo contiene:

```text
gen expresion
TP53    100
BRCA1   250
MYC ND
EGFR    500
```
En este caso, ND (Not Determined) indica que el valor no fue determinado.

Podemos indicarle a pandas que interprete "ND" como un dato faltante utilizando el parámetro na_values:
```python
import pandas as pd

df = pd.read_csv("genes.tsv", sep="\t", na_values="ND")
```
De esta manera, pandas convertirá automáticamente los valores "ND" en NaN.


## ✏️**Ejercicio 5 - Tablas** { markdown data-toc-label='✏️ Ejercicio 5 - Tablas' }

1. Creen una lista con los nombres de 5 genes (por ejemplo: "TP53", "BRCA1", "ACTB", "GAPDH", "MYC") y otra lista con sus niveles de expresión (pueden ser números entre 1 y 100).
2. Utilicen esas listas para crear un DataFrame con dos columnas llamadas gen y expresion.
    1. La columna **gen** deberá contener los nombres de los genes (*strings*).
    2. La columna **expresion** deberá contener los niveles de expresión (*numeros*).
3. Impriman por pantalla todos los valores de la columna **gen**.
4. Impriman por pantalla la tercera fila de la tabla.
5. Impriman por pantalla el valor de expresion correspondiente a la cuarta fila.
6. Impriman por pantalla todas las filas donde **expresion** sea menor o igual a 30.

<!-- 
Resolucion

```python
import pandas as pd

# 1. Crear las listas
genes = ["TP53", "BRCA1", "ACTB", "GAPDH", "MYC"]
expresion = [25, 80, 15, 45, 70]

# 2. Crear el DataFrame
df = pd.DataFrame({
    "gen": genes,
    "expresion": expresion
})

print(df)

# 3. Imprimir todos los valores de la columna "gen"
print(df["gen"])

# 4. Imprimir la tercera fila
print(df.iloc[2])

# 5. Imprimir el valor de expresion correspondiente a la cuarta fila
print(df.iloc[3]["expresion"])

# 6. Imprimir las filas donde expresion sea menor o igual a 30
print(df[df["expresion"] <= 30])
```
-->


## **Visualización de datos con matplotlib**

Una de las librerías más utilizadas para crear gráficos o plots en **Python** es **matplotlib**. En particular, utilizaremos el módulo `pyplot`, que suele importarse con el alias `plt`:

```python
import matplotlib.pyplot as plt
```

### Scatter plot

#### ✏️ Ejercicio 6
Escriban y ejecuten el siguiente código:

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(1, 101)
y = x ** 2

plt.scatter(x, y)
plt.show()
```

Si todo funcionó correctamente debería aparecer un gráfico donde cada punto representa un par de valores `(x, y)`. Este tipo de gráfico se conoce como **scatter plot** o **gráfico de dispersión**.

<figure markdown>
![DotPlot](img/python_plot_scatter.png)
</figure>

En este ejemplo:

* `plt.scatter()` crea el gráfico.
* `x` contiene los valores del eje horizontal.
* `y` contiene los valores del eje vertical.
* `plt.show()` muestra el gráfico en pantalla.

### Personalizar un gráfico

Podemos modificar distintos aspectos del gráfico utilizando otras funciones de `matplotlib`.

Por ejemplo:

```python
plt.scatter(x, y)

plt.title("x²")
plt.xlabel("x")
plt.ylabel("y")

plt.show()
```

También podemos cambiar el color de los puntos:

```python
plt.scatter(x, y, color="red")

plt.show()
```

### Guardar un gráfico

Una vez creado el gráfico, podemos guardarlo directamente desde el código utilizando:

```python
plt.savefig("grafico.png")
```

También es posible cambiar el formato del archivo:

```python
plt.savefig("grafico.svg")

plt.savefig("grafico.pdf")
```

!!! tip "Tip"

    Es recomendable llamar a `plt.savefig()` **antes** de `plt.show()`, ya que algunas versiones de **matplotlib** limpian la figura luego de mostrarla.

### Graficar datos de una tabla

Muchas veces los datos que queremos visualizar se encuentran en un **DataFrame**.

Por ejemplo:

```python
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv(
    "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
)

plt.scatter(
    df["sepal_length"],
    df["petal_length"]
)

plt.xlabel("Sepal Length")
plt.ylabel("Petal Length")
plt.title("Sepal vs Petal Length")

plt.show()
```

## ✏️**Ejercicio 7 - Integrador** { markdown data-toc-label='✏️ Ejercicio  7 - Integrador' }

En esta actividad vamos a integrar estos conocimientos en un problema de análisis de datos biológicos.

Imaginemos que somos un grupo de bioinformáticos que trabaja para un hospital. El equipo médico nos proporciona un conjunto de datos obtenido a partir de muestras de pacientes con lesiones mamarias y nos solicita realizar un análisis exploratorio de los datos.

Nuestro objetivo será analizar las características de las muestras, identificar posibles diferencias entre muestras benignas y malignas, explorar relaciones entre diferentes variables y generar visualizaciones que permitan comunicar los resultados.

Finalmente, prepararemos un informe individual para cada muestra, que podrá ser utilizado por el equipo médico como resumen de los datos analizados.

Se trata de un conjunto de datos construido a partir de imágenes celulares digitalizadas. Para cada muestra se calcularon diferentes características relacionadas con la morfología de los núcleos celulares presentes en las imágenes. Entre ellas se encuentran el radio, textura, perímetro, área, suavidad, compactación, concavidad, puntos cóncavos, simetría y dimensión fractal. Para cada característica se dispone de tres tipos de mediciones: el valor medio (mean), el error estándar (SE) y el valor denominado worst, que resume los valores más altos observados. En total, el conjunto contiene 30 variables numéricas, además de un identificador y la variable diagnosis.

La variable diagnosis indica si la muestra fue clasificada como:

B: benigna
M: maligna

El conjunto contiene 569 muestras, de las cuales 357 corresponden a muestras benignas y 212 a muestras malignas.

Por ejemplo, algunas de las variables que encontraremos son:

| Variable | Descripción |
|---|---|
| `radius_mean` | Radio medio de los núcleos celulares |
| `texture_mean` | Textura media |
| `perimeter_mean` | Perímetro medio |
| `area_mean` | Área media |
| `smoothness_mean` | Suavidad media |
| `compactness_mean` | Compactación media |
| `concavity_mean` | Concavidad media |
| `symmetry_mean` | Simetría media |
| `diagnosis` | Diagnóstico: benigno (`B`) o maligno (`M`) |


### ✏️Cargar los datos

Descarguen el archivo proporcionado para esta actividad y cárguenlo utilizando pandas.

```python
import pandas as pd
import matplotlib.pyplot as plt
import kagglehub

path = kagglehub.dataset_download(
    "yasserh/breast-cancer-dataset"
)

print("Path to dataset files:", path)

df = pd.read_csv(
    path + "/breast-cancer.csv"
)

print(df)
```


#### ✏️**1)** Exploración inicial
Antes de realizar cualquier análisis, queremos conocer el conjunto de datos.

* ¿Cuántas filas y columnas tiene el DataFrame?
* ¿Qué columnas contiene?
* ¿Qué tipo de dato tiene cada columna?
* ¿Existen datos faltantes?
* ¿Cuántas muestras corresponden a cada diagnóstico?
Para responder la última pregunta, pueden utilizar un filtro booleano

??? tip "Pista"

    `df.info()` puede ayudar a responder varias de las primeras preguntas.

    Para contar las muestras de cada diagnóstico, pueden comenzar creando dos subconjuntos:
    ```python
    df_benignas = df[df["diagnosis"] == "B"]

     df_malignas = @@EDITAR@@
    ```
    Luego pueden utilizar `len()` para conocer la cantidad de filas de cada subconjunto.


#### ✏️**2)** Comparación entre muestras benignas y malignas
Una de las preguntas que nos plantea el equipo médico es si existen diferencias en las características morfológicas de las células entre las muestras benignas y malignas.
¿Las muestras malignas presentan, en promedio, un mayor radius_mean que las muestras benignas?

Para responderla:

* Calculen el promedio de radius_mean para las muestras benignas.

* Calculen el promedio de radius_mean para las muestras malignas.

* Comparen ambos valores.

* Indiquen qué grupo presenta el mayor valor promedio.

Recuerden que primero pueden crear dos subconjuntos utilizando filtros booleanos.

* Pregunta de interpretación:¿La diferencia observada parece pequeña o grande en relación con los valores de la variable?

??? tip "Pista"

    Pueden separar primero las muestras benignas y malignas:

    ```python
    df_benignas = df[df["diagnosis"] == "B"]

    df_malignas = @@EDITAR@@
    ```

    Para calcular el promedio de `radius_mean`:

    ```python
    df_benignas["radius_mean"].mean()

    df_malignas[@@EDITAR@@]@@EDITAR@@.
    ```

#### ✏️**3)** Distribución de una variable
Ahora queremos conocer cómo se distribuyen los valores de una variable.

Realicen un histograma de radius_mean utilizando matplotlib.

El gráfico debe incluir: título; nombre del eje X; nombre del eje Y.

* ¿Cómo se distribuyen los valores de radius_mean?
* ¿La distribución parece aproximadamente simétrica?
* ¿Observan valores particularmente altos o bajos?

??? tip "Pista"

    La función `plt.hist()` permite construir un histograma.

    ```python
    plt.hist( ... )

    plt.xlabel( ... )
    plt.ylabel( ... )
    plt.title( ... )

    plt.show()
    ```

#### ✏️**4)** Comparar distribuciones 
Ahora queremos saber si la distribución de radius_mean es diferente entre las muestras benignas y malignas.

Realicen un gráfico que permita comparar ambas distribuciones.

Pueden utilizar dos histogramas superpuestos.

* ¿Qué diferencias observan entre ambos grupos?
* ¿Los valores de las muestras malignas tienden a concentrarse en un rango diferente?
* ¿Existe superposición entre ambos grupos?

??? tip "Pista"

    Ya crearon `df_benignas` y `df_malignas`.

    Pueden utilizar dos llamadas a `plt.hist()`, una para cada subconjunto.

    El parámetro `alpha` permite hacer transparentes los histogramas para visualizar mejor la superposición.

#### ✏️**5)** Relación entre dos variables
Ahora queremos investigar si existe una relación entre el tamaño de los núcleos celulares y su perímetro.

Realicen un gráfico de dispersión de:
radius_mean en el eje X.
perimeter_mean en el eje Y.

Diferencien las muestras según el diagnóstico. Agreguen una leyenda que permita identificar qué puntos corresponden a muestras benignas y cuáles a muestras malignas.

* ¿Existe una relación entre radius_mean y perimeter_mean?
* ¿La relación parece aproximadamente lineal?
* ¿Las muestras benignas y malignas ocupan regiones diferentes del gráfico?
* ¿Hay muestras que se encuentren dentro de la región predominante del otro grupo?

#### ✏️**6)** Identificación de muestras
Supongamos ahora que el equipo médico quiere identificar muestras con valores particularmente altos de algunas características.

Seleccionen todas las muestras que cumplan simultáneamente:
*  radius_mean > 20
*  area_mean > 1000

* ¿Cuántas muestras cumplen ambas condiciones?

*  ¿Qué diagnóstico presentan esas muestras?

#### ✏️**7)** Informe individual de cada muestras
Finalmente, el hospital nos solicita generar un informe individual para cada muestra.

El informe estará destinado al equipo médico, por lo que debe presentar los resultados de manera clara y resumida. No se trata de un informe dirigido al paciente. 
El informe debe describir los datos y los resultados del análisis. No debe presentar una conclusión clínica ni afirmar que una muestra es cancerosa o no cancerosa a partir de los análisis realizados en este ejercicio.

Para comenzar, trabajaremos solamente con las primeras 50 muestras del conjunto de datos. El mismo procedimiento podría aplicarse posteriormente a las 569 muestras.

Para cada muestra deberán generar un archivo de texto en una carpeta llamada Informes que contenga, como mínimo:

* ID de la muestra.
* Diagnóstico registrado en el dataset.
* radius_mean
* texture_mean
* perimeter_mean
* area_mean
* smoothness_mean
* compactness_mean
* concavity_mean
* symmetry_mean

Calculen, para cada muestra:
* diferencia respecto al promedio de las muestras benignas;
* diferencia respecto al promedio de las muestras malignas.

??? tip "Pista"

    Para comenzar, trabajen con una sola muestra. Una vez que logren generar correctamente un informe, podrán automatizar el proceso para las demás muestras.

    **1. Seleccionar una muestra**

    Pueden seleccionar, por ejemplo, la primera muestra:

    ```python
    muestra = df.iloc[0]
    ```

    Ahora pueden acceder a cada uno de sus valores utilizando el nombre de la columna:

    ```python
    muestra[@@EDITAR@@]
    muestra[@@EDITAR@@]

    ```

    **2. Calcular las diferencias respecto a los grupos**

    Primero calculen los valores promedio de `radius_mean` para las muestras benignas y malignas:

    ```python
    promedio_benignas = @@EDITAR@@
    promedio_malignas = @@EDITAR@@
    ```

    Luego pueden calcular cuánto se diferencia la muestra seleccionada de cada promedio:

    ```python
    diferencia_benigna = @@EDITAR@@
    diferencia_maligna = @@EDITAR@@
    ```

    **3. Crear el texto del informe**
    Pueden construir el contenido del informe utilizando una `string`. Para incorporar
    valores numéricos o valores almacenados en variables, pueden utilizar `str()`.
    Se puede utilizar \n para indicar un salto de línea.

    Por ejemplo:

    ```python
    informe = (
      "INFORME DE ANÁLISIS DE MUESTRA\n\n"
        + "ID: " + str(muestra["id"]) + "\n"
        + "Diagnóstico: " + str(muestra["diagnosis"]) + "\n\n"
     + "Características:\n\n"
        + "Radius mean: " + str(muestra["radius_mean"]) + "\n"
        + "Texture mean: " + str(muestra["texture_mean"]) + "\n"
        + "Perimeter mean: " + str(muestra["perimeter_mean"]) + "\n"
        + "Area mean: " + str(muestra["area_mean"]) + "\n\n"
        + "Diferencia respecto al promedio de muestras benignas: "
        + str(diferencia_benigna) + "\n"
        + "Diferencia respecto al promedio de muestras malignas: "
        + str(diferencia_maligna)
    )
    ```

    Python también ofrece una forma más sencilla de combinar texto con variables
    llamada **f-string** (*formatted string*).

    ```python
        informe = f"""
        INFORME DE ANÁLISIS DE MUESTRA

        ID: {muestra["id"]}
        Diagnóstico: {muestra["diagnosis"]}

        Características:

     Radius mean: {muestra["radius_mean"]}
     Texture mean: {muestra["texture_mean"]}
     Perimeter mean: {muestra["perimeter_mean"]}
     Area mean: {muestra["area_mean"]}

        Diferencia respecto al promedio de muestras benignas:
        {diferencia_benigna}

        Diferencia respecto al promedio de muestras malignas:
        {diferencia_maligna}
        """
    ```

    Pueden comprobar que el informe se construyó correctamente utilizando:

    ```python
    print(informe)
    ```

     **4. Guardar el informe**

    Para guardar el contenido en un archivo de texto pueden utilizar `open()`.

    Primero creen una carpeta llamada `Informes`:

    ```python
    import os

    os.makedirs("Informes", exist_ok=True)
    ```

    Luego pueden guardar el informe dentro de esa carpeta:

    ```python
    with open("Informes/informe.txt", "w") as archivo:
        archivo.write(informe)
    ```

    Comprueben que el archivo fue creado correctamente desde la pestaña
    **Archivos** de Google Colab.

    El archivo debería encontrarse dentro de:

    ```text
    Informes/
    └── informe.txt
    ```
       

<!-- Resolución Ej 7
import os

# Crear los subconjuntos de muestras benignas y malignas
df_benignas = df[df["diagnosis"] == "B"]
df_malignas = df[df["diagnosis"] == "M"]

# Seleccionar una muestra
muestra = df.iloc[0]

# Calcular los promedios de radius_mean
promedio_benignas = df_benignas["radius_mean"].mean()
promedio_malignas = df_malignas["radius_mean"].mean()

# Calcular las diferencias respecto a los promedios
diferencia_benigna = muestra["radius_mean"] - promedio_benignas
diferencia_maligna = muestra["radius_mean"] - promedio_malignas

# Crear el texto del informe
informe = (
    "INFORME DE ANÁLISIS DE MUESTRA\n\n"
    + "ID: " + str(muestra["id"]) + "\n"
    + "Diagnóstico: " + str(muestra["diagnosis"]) + "\n\n"
    + "Características:\n\n"
    + "Radius mean: " + str(muestra["radius_mean"]) + "\n"
    + "Texture mean: " + str(muestra["texture_mean"]) + "\n"
    + "Perimeter mean: " + str(muestra["perimeter_mean"]) + "\n"
    + "Area mean: " + str(muestra["area_mean"]) + "\n"
    + "Smoothness mean: " + str(muestra["smoothness_mean"]) + "\n"
    + "Compactness mean: " + str(muestra["compactness_mean"]) + "\n"
    + "Concavity mean: " + str(muestra["concavity_mean"]) + "\n"
    + "Symmetry mean: " + str(muestra["symmetry_mean"]) + "\n\n"
    + "Diferencia respecto al promedio de muestras benignas: "
    + str(diferencia_benigna) + "\n"
    + "Diferencia respecto al promedio de muestras malignas: "
    + str(diferencia_maligna)
)

# Crear la carpeta Informes
os.makedirs("Informes", exist_ok=True)

# Guardar el informe
with open("Informes/informe.txt", "w") as archivo:
    archivo.write(informe)

print("Informe generado correctamente.")
-->

#### ✏️**8)** Automatizar la generación de informes
La generación manual de 50 informes sería una tarea muy poco eficiente.

Utilicen un ciclo para recorrer las primeras 50 muestras y generar automáticamente un txt para cada una.

El objetivo es que el programa:

Seleccione una muestra.
Extraiga sus datos.
Genere las visualizaciones correspondientes.
Cree el informe.
Guarde el txt con un nombre que permita identificar la muestra.
Pase automáticamente a la siguiente muestra.

Por ejemplo:

```text
reportes/
├── muestra_842302.pdf
├── muestra_842517.pdf
├── muestra_843009.pdf
├── ...
└── muestra_...
```

El código debería poder modificarse fácilmente para generar posteriormente los informes de todas las muestras del conjunto de datos, simplemente cambiando el número de muestras a procesar.

??? tip "Pista"

    En el ejercicio anterior generaron el informe para una única muestra.
    Ahora queremos repetir automáticamente ese procedimiento para las primeras
    50 muestras.

    **1. Recorrer las muestras**

    Pueden utilizar un ciclo `for` junto con `range()` para recorrer las primeras
    50 filas del `DataFrame`:

    ```python
    for i in range(@@EDITAR@@):

        muestra = df.iloc[i]

        ...
    ```

    Dentro del ciclo deberán colocar las instrucciones necesarias para generar
    el informe correspondiente a cada muestra.

    **2. Repetir el procedimiento del ejercicio anterior**

    Para cada muestra deberán:

    - acceder a sus datos;
    - calcular la diferencia de `radius_mean` respecto a los promedios;
    - construir el texto del informe;
    - guardar el informe en un archivo.

    Es decir, pueden reutilizar gran parte del código que desarrollaron en el
    ejercicio anterior.

    **3. Darle un nombre diferente a cada archivo**

    No pueden utilizar siempre:

    ```python
    "Informes/informe.txt"
    ```

    porque cada nuevo informe reemplazaría al anterior.

    Pueden construir el nombre del archivo utilizando el identificador de la
    muestra:

    ```python
    nombre_archivo = "Informes/muestra_" + str(muestra["id"]) + ".txt"
    ```

    Luego pueden utilizar `nombre_archivo` para guardar el informe:

    ```python
    with open(nombre_archivo, "w") as archivo:
        archivo.write(informe)
    ```

    Al finalizar el ciclo deberían obtener una carpeta similar a:

    ```text
    Informes/
    ├── muestra_842302.txt
    ├── muestra_842517.txt
    ├── muestra_843009.txt
    ├── ...
    └── muestra_...
    ```

    **4. ¿Qué debe estar dentro y fuera del ciclo?**

    Piensen qué instrucciones dependen de la muestra que estamos analizando y
    cuáles no.

    Por ejemplo, los promedios de `radius_mean` de las muestras benignas y
    malignas son los mismos para todas las muestras. Por lo tanto, no es
    necesario calcularlos nuevamente en cada vuelta del ciclo.

    El `for` debería encargarse principalmente de tomar una muestra, analizarla
    y guardar su informe antes de pasar a la siguiente.

<!-- Resolución Ej 8
    import os

# Crear los subconjuntos de muestras benignas y malignas
df_benignas = df[df["diagnosis"] == "B"]
df_malignas = df[df["diagnosis"] == "M"]

# Calcular los promedios una sola vez
promedio_benignas = df_benignas["radius_mean"].mean()
promedio_malignas = df_malignas["radius_mean"].mean()

# Crear la carpeta donde se guardarán los informes
os.makedirs("Informes", exist_ok=True)

# Recorrer las primeras 50 muestras
for i in range(50):

    # Seleccionar la muestra
    muestra = df.iloc[i]

    # Calcular las diferencias respecto a los promedios
    diferencia_benigna = muestra["radius_mean"] - promedio_benignas
    diferencia_maligna = muestra["radius_mean"] - promedio_malignas

    # Crear el texto del informe
    informe = (
        "INFORME DE ANÁLISIS DE MUESTRA\n\n"
        + "ID: " + str(muestra["id"]) + "\n"
        + "Diagnóstico: " + str(muestra["diagnosis"]) + "\n\n"
        + "Características:\n\n"
        + "Radius mean: " + str(muestra["radius_mean"]) + "\n"
        + "Texture mean: " + str(muestra["texture_mean"]) + "\n"
        + "Perimeter mean: " + str(muestra["perimeter_mean"]) + "\n"
        + "Area mean: " + str(muestra["area_mean"]) + "\n"
        + "Smoothness mean: " + str(muestra["smoothness_mean"]) + "\n"
        + "Compactness mean: " + str(muestra["compactness_mean"]) + "\n"
        + "Concavity mean: " + str(muestra["concavity_mean"]) + "\n"
        + "Symmetry mean: " + str(muestra["symmetry_mean"]) + "\n\n"
        + "Diferencia respecto al promedio de muestras benignas: "
        + str(diferencia_benigna) + "\n"
        + "Diferencia respecto al promedio de muestras malignas: "
        + str(diferencia_maligna)
    )

    # Crear un nombre diferente para cada informe
    nombre_archivo = (
        "Informes/muestra_"
        + str(muestra["id"])
        + ".txt"
    )

    # Guardar el informe
    with open(nombre_archivo, "w") as archivo:
        archivo.write(informe)

print("Informes generados correctamente.")
-->

## ✏️**Ejercicio Adicional 1** { markdown data-toc-label='Ejercicio Adicional 1' }

En este ejercicio vamos a comprobar si los números aleatorios de **Python** se comportan como esperamos. Para ello escriban un programa que:

* Tire una moneda.
* Anote si salió **Cara** o **Seca**.
* Repita los pasos anteriores hasta obtener **100 caras** o **100 secas** (es decir, repita el proceso **mientras** no haya alcanzado alguna de esas dos cantidades).
* Imprima por pantalla cuántas caras y cuántas secas obtuvo.

Para simular el lanzamiento de una moneda pueden utilizar la función `choice()` de la librería `random`:

```python
import random

moneda = random.choice(["Cara", "Seca"])
```

Cada vez que ejecuten esa línea, la variable `moneda` tomará aleatoriamente el valor `"Cara"` o `"Seca"`.

Ejecuten el programa varias veces y observen si los resultados parecen razonables.

<!--
###Solución
```python
import random

# Contadores de caras y secas
caras = 0
secas = 0

# Repetimos el proceso mientras no hayamos obtenido
# 100 caras ni 100 secas
while caras < 100 and secas < 100:

    # Tiramos la moneda al azar
    moneda = random.choice(["Cara", "Seca"])

    # Actualizamos el contador correspondiente
    if moneda == "Cara":
        caras = caras + 1
    else:
        secas = secas + 1

# Mostramos el resultado final
print("Caras:", caras)
print("Secas:", secas)
```
-->

## ✏️**Ejercicio Adicional 2** { markdown data-toc-label='Ejercicio Adicional 2' }

Para valores enteros de `x` entre **1** y **200**, calculen el `y` correspondiente a una recta con pendiente **3** y ordenada al origen **5**.

1. Grafiquen los puntos utilizando `plt.scatter()`.
2. Agreguen un título y etiquetas a ambos ejes.
3. Guarden el gráfico en formato **SVG**.


## ✏️**Ejercicio Adicional 3** { markdown data-toc-label='Ejercicio Adicional 3' }


Introducción

En este trabajo práctico vamos a trabajar con datos generados por un lector de placas de wells. Vamos a analizar los datos de un experimento cuyo objetivo es encontrar compuestos que funcionen como inhibidores de una enzima de interés, a la que denominaremos **enzima Z**.

La enzima Z tiene como producto un compuesto fluorescente. Por lo tanto, podemos utilizar la señal de fluorescencia para estimar la velocidad de la reacción.

En el experimento se evaluaron diferentes compuestos a diferentes concentraciones y se realizaron mediciones a distintos tiempos.

Los archivos necesarios para realizar este ejercicio se encuentran en los materiales de trabajo.

---

Experimento

El equipo **FilterMax F5** permite realizar mediciones de absorbancia y fluorescencia en placas de wells.

En nuestro experimento se utilizaron placas de 384 wells y se realizaron 4 mediciones por placa, una cada aproximadamente 5 minutos.

Cada columna de la placa corresponde a un compuesto diferente y cada fila corresponde a una concentración diferente del compuesto.

Nuestro objetivo será:

1. familiarizarnos con los datos;
2. limpiar y reorganizar la información;
3. agregar la información de compuestos y concentraciones;
4. calcular la velocidad de reacción;
5. calcular la actividad relativa;
6. calcular el IC50 de los diferentes compuestos;
7. analizar los resultados obtenidos.

---

Paso 1 - Familiarizarnos con el Archivo

El archivo **00_datos_filtermax.txt** contiene los datos tal como fueron generados por el equipo.

✏️ 1) 

Abran el archivo **00_datos_filtermax.txt** con un editor de texto y observen su estructura.

Respondan:

- ¿Se parece a algún archivo `.csv` o `.tsv` que hayan utilizado anteriormente?
- ¿Qué diferencias presenta?
- ¿Hay filas que parecen contener información que no corresponde directamente a los datos de la tabla?

✏️ 2)

Mirando el archivo y la información del experimento:

- ¿Qué hay en la celda A1?
- ¿Qué posiciones contienen las diferentes diluciones del compuesto `Umbrella2`?
- ¿Cuántos datos hay para cada dilución de `Umbrella2`?
- ¿Por qué hay esa cantidad de datos?

✏️ 3)

Abran el archivo **00_datos_filtermax.txt** en una hoja de cálculo.

Al final de cada placa hay varias celdas sin datos.

- ¿Hay algo en la organización de la placa que explique por qué ocurre esto?

---

Paso 2 - Limpiar y Parsear el Archivo

En este paso queremos obtener una tabla que podamos utilizar fácilmente para realizar el análisis.

El archivo **02_datos_filtermax_parseados.tsv** contiene los datos ya reorganizados.

✏️ 4)

Carguen el archivo **02_datos_filtermax_parseados.tsv** utilizando `pandas`.

Observen la columna `signal`.

- ¿Qué creen que representan los valores `NaN` que aparecen en esta columna?

---

Paso 3 - Agregar la información que necesito

En este momento tenemos una tabla donde cada fila representa una medición independiente.

Sin embargo, tenemos algunos problemas:

- no tenemos el nombre del compuesto, solamente el número de columna;
- no tenemos la concentración, solamente la letra de la fila;
- `time` está almacenado como texto y posteriormente necesitaremos trabajar con el tiempo como un número.

También disponemos de dos archivos adicionales:

- **00_datos_compuestos.tsv**, que indica qué compuesto corresponde a cada columna;
- **00_datos_concentraciones.tsv**, que indica qué concentración corresponde a cada fila.

✏️ 5)

Carguen ambos archivos utilizando `pandas`.

Obtengan:

- una tabla con la correspondencia entre `columna` y `compuesto`;
- una tabla con la correspondencia entre `fila` y `concentracion`.

Luego incorporen esta información al DataFrame de datos experimentales.

El resultado debe contener, como mínimo, las siguientes columnas:

```text
compuesto
concentracion
time
temperature
fila
columna
signal
```

```python
# Acá hay que poner el Path Absoluto que apunta a su carpeta de trabajo
# Por ejemplo: "/content/drive/MyDrive/data_TPPb"
import os
import pandas as pd

os.chdir(@@EDITAR@@)


# Uso read_csv para cargar los datos parseados.
# El archivo está separado por tabulaciones.
# pandas reconoce automáticamente los valores faltantes como NaN.
df_parsed_data = pd.read_csv(
    @@EDITAR@@,
    sep="\t"
)


# Primero que nada sé que las columnas de los wells 23 y 24 están vacías,
# así que saco las filas donde columna sea 23 o 24.
# Es decir, me quedo con las filas donde columna es 1 a 22.

df_parsed_data = df_parsed_data[
    @@EDITAR@@
]


# Ahora la fila y la columna no me están dando mucha información de lo que
# está pasando, por lo que quiero agregar información de los compuestos
# y de las concentraciones.


# Agrego información de compuestos.

df_datos_compuestos = pd.read_csv(
    "00_datos_compuestos.tsv",
    sep="\t"
)

df_parsed_data = pd.merge(
    df_parsed_data,
    df_datos_compuestos,
    on="columna"
)


# Agrego información de concentraciones.
# Ojo: en "00_datos_concentraciones.tsv" el separador decimal es la coma.

df_datos_concentraciones = pd.read_csv(
    @@EDITAR@@
)

df_parsed_data = pd.merge(
    df_parsed_data,
    df_datos_concentraciones,
    on="fila"
)


# Para cada combinación de compuesto y concentración quiero saber la velocidad
# de la reacción, es decir, la pendiente de la recta que sale de hacer una
# regresión lineal por los 4 tiempos ensayados.


# El primer problema que tengo es que la variable time es un string,
# por lo que no puedo usarla como X en una ecuación.
# Por esta razón vamos a convertir time en cantidad de segundos.


# Si bien hay 1408 filas, en sí solo hay 4 tiempos que se repiten:
# "00:00:00", "00:04:59", "00:10:00" y "00:15:00"


# Voy entonces a hacer una tabla llamada df_times_in_seconds que va a empezar
# vacía y una vez corrido el siguiente for va a tener 4 filas, una por cada
# uno de los 4 tiempos.
#
# Esta tabla va a tener dos columnas:
# - time: indicando el tiempo que estamos analizando como string.
# - segundos_totales: contiene ese tiempo transformado a número de segundos.


# Extraigo entonces los diferentes tiempos y creo una tabla vacía donde voy
# a guardar la cantidad de segundos para cada time.

unique_times = df_parsed_data["time"].unique()

df_times_in_seconds = pd.DataFrame(
    columns=["time", "segundos_totales"]
)


for time_for in unique_times:

    # Esta siguiente línea comentada la uso para debuggear, es decir,
    # para cuando estoy creando el programa.
    # Si la ejecutan a mano (sin el #) pueden entonces ir paso a paso
    # en el for viendo que funcione todo.
    # Recuerden que pueden usar CTRL + ENTER para ejecutar el código
    # seleccionado o ver el valor de una variable.

    # time_for = unique_times[2]


    # Divido las horas, minutos y segundos.
    # split() devuelve una lista de strings.

    time_spliteado = @@EDITAR@@


    # Guardo cada uno de los tres números en otra variable.
    # Como ahora son strings uso int() para convertirlos en números.

    horas = int(@@EDITAR@@)
    minutos = int(@@EDITAR@@)
    segundos = int(@@EDITAR@@)


    # Calculo los segundos totales.
    # Es decir, transformo las horas y los minutos en segundos
    # y sumo las tres variables.

    segundos_totales = @@EDITAR@@


    # Guardo esta información en la tabla que acabo de crear.

    df_new_row_times_in_seconds = pd.DataFrame({
        "time": [@@EDITAR@@],
        "segundos_totales": [@@EDITAR@@]
    })


    # Agrego la nueva fila a la tabla.

    df_times_in_seconds = pd.concat(
        [@@EDITAR@@],
        ignore_index=True
    )


# Agrego la información de los segundos totales, guardada en
# df_times_in_seconds, a mi tabla original.

df_parsed_data = pd.merge(
    @@EDITAR@@
)


# Ahora van a ver que las columnas de la tabla parecen estar mezcladas,
# lo que se debe al merge.
#
# Por otro lado hay columnas que ya no vamos a usar.
#
# Resolvemos las dos cosas a la vez seleccionando únicamente las columnas
# que necesitamos y en el orden que queremos.

df_parsed_data = df_parsed_data[
    @@EDITAR@@
]


# Escribo los datos en una nueva tabla.

df_parsed_data.to_csv(
    "03_datos_filtermax_parseados_y_formateados.tsv",
    @@EDITAR@@
)
```
Paso 4 - Calcular velocidades de reacción

✏️ 6)

Para cada combinación de **compuesto** y **concentración** tenemos cuatro mediciones
de `signal`, correspondientes a cuatro tiempos diferentes.

Queremos calcular la **velocidad de reacción**.

Como primera aproximación, vamos a asumir que la señal aumenta de manera
aproximadamente lineal con el tiempo:

$$
signal = velocidad \times tiempo + b
$$

Por lo tanto, la velocidad de reacción corresponde a la **pendiente de la recta**
que relaciona `signal` con `segundos_totales`.

Para cada combinación de compuesto y concentración tenemos cuatro puntos y
calcularemos una recta utilizando esos cuatro puntos.

Por ejemplo, para una determinada combinación podríamos tener:

```text
tiempo (s)    signal
0             417246
299           595504
600           789920
900           985947

La pendiente de la recta será nuestra estimación de la velocidad de reacción.

Ahora calculen la velocidad de reacción para todas las combinaciones de
compuesto y concentración.

Para ello deberán:

Obtener los diferentes compuestos.
Obtener las diferentes concentraciones.
Recorrer las diferentes combinaciones mediante ciclos.
Seleccionar los datos correspondientes a cada combinación.
Calcular la pendiente de la relación entre signal y segundos_totales.
Guardar el resultado.

### Script para completar

```python
import numpy as np
import pandas as pd

# Cargar los datos formateados
df = pd.read_csv(
    @@EDITAR@@,
    sep="\t"
)


# ---------------------------------------------------------
# EJERCICIO
# Calcular la velocidad de reacción para una combinación
# ---------------------------------------------------------

# Seleccionar los datos correspondientes a Umbrella1
# y concentración 0.

datos = df[
    @@EDITAR@@
]


# Definir X e Y

x = @@EDITAR@@
y = @@EDITAR@@


# Calcular la pendiente de la recta.
# La pendiente corresponde a la velocidad de reacción.

velocidad = @@EDITAR@@

print(velocidad)


# ---------------------------------------------------------
# EJERCICIO
# Calcular las velocidades para todas las combinaciones
# ---------------------------------------------------------

# Obtener los diferentes compuestos y concentraciones

compuestos = @@EDITAR@@
concentraciones = @@EDITAR@@


# Crear una tabla vacía donde vamos a guardar los resultados

df_velocidades = pd.DataFrame(
    columns=["compuesto", "concentracion", "velocidad"]
)


# Recorrer todos los compuestos

for compuesto in compuestos:

    # Recorrer todas las concentraciones

    for concentracion in concentraciones:

        # Seleccionar los datos correspondientes a esta
        # combinación de compuesto y concentración

        datos = df[
            (@@EDITAR@@) &
            (@@EDITAR@@)
        ]

        # Extraer los valores de X e Y

        x = @@EDITAR@@
        y = @@EDITAR@@

        # Calcular la pendiente

        velocidad = @@EDITAR@@


        # Crear una nueva fila

        nueva_fila = pd.DataFrame({
            "compuesto": [@@EDITAR@@],
            "concentracion": [@@EDITAR@@],
            "velocidad": [@@EDITAR@@]
        })


        # Agregar la fila a la tabla de resultados

        df_velocidades = pd.concat(
            [@@EDITAR@@],
            ignore_index=True
        )


# Mostrar los resultados

print(df_velocidades)


# Guardar los resultados

df_velocidades.to_csv(
    "04_velocidades_de_reaccion.tsv",
    @@EDITAR@@
)
```

## **Bibliografía**

<!--
### :material-bookshelf: Libros
* Libro 1 
* Libro 2
-->

<!--
### :material-web: Online
* Documentación oficial de Python: https://docs.python.org/3/
* Tutorial oficial de Python: https://docs.python.org/3/tutorial/
-->

### :material-console-line: Consola de Python
* Comando `help()`
