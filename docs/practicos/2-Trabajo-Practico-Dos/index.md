![Image](img/featured.png){ width="250", align=left }
# TP2. EMBOSS { markdown data-toc-label='Label que aparece en Table Of Contents' }
[:fontawesome-solid-download: Materiales](#){ .md-button .md-button--primary }
<!--
Este es el botón para decargar materiales, en (#) hay que agregar el link correspondiente.
--->

### Software a usar


### Recursos Online


### Objetivos


## Introduccion al Tema


## Cosas

poner una carpeta input o output

mkdir VpVAN_output

for TAG in `ls *-tag.fasta`; # Por cada archivo Fasta de tag disponible... 

do 
   vpvanseq=`cat VpVAN.fasta | grep -v ">"`; # leer el archivo VpVAN y quitarle el header (>), guardarlo en una variable (1)
   tagseq=`cat $TAG | grep -v ">"`; # leer cada archivo tag y quitarle el header (>), guardarlo en otra variable (2)
   printf ">VpVAN-$TAG\n$vpvanseq$tagseq" > VpVAN_output/VpVAN-$TAG; # imprimir y guardar en un archivo separado para cada tag (3)
done;


tfm, que significa :p
http://www.sacs.ucsf.edu/Documentation/emboss/tfm.html

## Ejercicio 1. Titulo del Ejercicio a realizar  { markdown data-toc-label='Ejercicio 1' }  


## Bibliografía
