![Image](img/featured.png){ width="250", align=left }
# TP1. Titulo del Trabajo Práctico { markdown data-toc-label='Label que aparece en Table Of Contents' }
[:fontawesome-solid-download: Materiales](#){ .md-button .md-button--primary }
<!--
Este es el botón para decargar materiales, en (#) hay que agregar el link correspondiente.
--->

<br>

### Software a usar
* Programa 1 [www.donde.lo.bajo.com](https://www.example.com)
* Programa 2 [www.donde.lo.bajo2.com](https://www.example.com)

### Recursos Online
* Recurso 1 [www.webAusar.com](https://www.example.com)
* Recurso 2 [www.webAusar.com](https://www.example.com)

### Objetivos

## Introduccion al Tema
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non onsequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

![Imagen](img/featured.png){ width=500 }

Existen distintos de Admonitions

!!! note "Atención esto es un admonition!!"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.


Admonition desplegable (Esto está bueno para ver las soluciones a las cosas o tipo los ayuda memoria, código de aminoácidos de una letra, etc)

??? note "Atención !! Sin desplegar"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

!!! info inline "Definición de Inline"

    Lorem ipsum dolor sit amet, consectetur
    adipiscing elit. Nulla et euismod nulla.
    Curabitur feugiat, tortor non consequat
    finibus, justo purus auctor massa, nec
    semper lorem quam in massa.

Esto en teoría sería para que me entre acá y me quede a la izquierda LO QUE ESTÁ PUESTO ARRIBA ladito Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor massa, nec semper lorem quam in massa.

<br>
<br>
<br>

[Todos los tipos disponibles acá](https://squidfunk.github.io/mkdocs-material/reference/admonitions/#supported-types)

Todo lo que sea código y se muestre la solución se recomienda usar las tabs

=== "Código"

    Esto es una prueba

=== "Ouput"

    Y esta es la otra prueba


<!--
[Todos los tipos disponibles acá](https://squidfunk.github.io/mkdocs-material/reference/admonitions/#supported-types)
-->

## Ejercicio 1. Titulo del Ejercicio a realizar  { markdown data-toc-label='Ejercicio 1' }  

``` py title="probado el titulo en codigo" linenums="1" hl_lines="4"
import tensorflow as tf
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

## Ejercicio 2. Titulo del Ejercicio a realizar { markdown data-toc-label='Ejercicio 2' }

The `range()` function is used to generate a sequence of numbers.

```
>seq1
ARTPLKMNSDADASDASDASJFGDAKJFGKJDAHGFKJDHALFKDHFLKJHAKF
DLKFJHALKDFHKLJHDLFKJHDAKFHLKADJHFLKJHALDKFHLAKDHFLKHA
DSDADSSA
```
++ctrl+alt+del++

++ctrl+v++

<!-- esto es en teoría para incluir archivos pero no me anduvo
``` title=".browserslistrc"
--8<--​ ".secuencias_alineadas_seleccion.fasta"
```
-->

## Bibliografía

### :material-bookshelf: Libros
* Libro 1 
* Libro 2

### :material-console-line: Online
* Material 1
* Material 2