![Image](img/featured.png){ width="250", align="left" }

# **TP 9**. Predicción de Desorden { markdown data-toc-label = 'TP 9' }

<br>
<br>
<br>

## Videos de la clase grabada

* :octicons-video-16: [Introducción al TP](https://www.youtube.com/watch?v=i8YJJR6eqG4)
* :octicons-video-16: [Puesta en común del TP](https://www.youtube.com/watch?v=ogw6Sp7jLms)

!!! abstract "Atención: Este TP tiene informe."

[:fontawesome-solid-download: Materiales](https://drive.google.com/file/d/1wh5zn1GZ4s_Rp8V5lekZZbIKzM7BOKc8/view?usp=sharing){ .md-button .md-button--primary }


## **PARTE I: Predicción de Desorden**

## Recursos online
* ProViz                [http://slim.icr.ac.uk/proviz/](http://slim.icr.ac.uk/proviz/)
* IUPred2A            [https://iupred2a.elte.hu/plot](https://iupred2a.elte.hu/plot)
* DisProt            [https://www.disprot.org](https://www.disprot.org)



## Objetivos
* Interpretar alineamientos múltiples de secuencias
* Identificar regiones ordenadas y desordenadas en alineamientos múltiples de secuencia
* Familiarizarse con la base de datos DisProt
* Entender las técnicas experimentales que permiten la identificación de regiones desordenadas
* Familiarizarse con distintos métodos de predicción de desorden (sólo en ejercicios adicionales)
* Interpretación de los resultados de los distintos métodos de predicción de desorden (sólo en ejercicios adicionales)


## **Métodos de predicción de desorden**

Uno de los mayores desafíos en el campo de las proteínas es la predicción de la estructura tridimensional a partir de la estructura primaria incluyendo aquellas proteínas que son total o parcialmente desordenadas. Mientras que las proteínas globulares adquieren una única estructura nativa, las proteínas intrínsecamente desordenadas (IDPs, del inglés *intrinsically disordered proteins*) son un conjunto de estructuras tridimensionales. También pueden existir regiones desordenadas conectando dos dominios globulares, como los *loops*; o incluso regiones más largas, que abarcan más de 30 residuos de longitud, que reciben el nombre de IDRs (del inglés *intrinsically disordered regions*).

En el año 2020, AlphaFold2 gana la competición de predicción de estructuras (CASP14) con un amplio margen prediciendo estructuras con muy alta precisión. Sin embargo, aún la predicción de conjunto de estructuras para proteínas desordenadas no se ha resuelto.

La predicción de IDRs/IDPs a partir de la secuencia de aminoácidos permite un análisis rápido y abarcativo de distintas proteínas permitiendo establecer hipótesis sobre la presencia de desorden en las proteínas (Dunker et al., 2008; van der Lee et al., 2014). La importancia que adquirieron las IDRs/IDPs en los últimos años llevó al desarrollo de numerosos métodos de predicción, pero en general se basan en tres estrategias de predicción de desorden: 

1. a partir de composición de secuencia, 
2. a partir de *machine learning* sobre estructuras determinadas por cristalografía de rayos X y 
3. a partir de meta-predictores que integran los resultados predichos por diferentes métodos.

Entre los algoritmos que se basan en composición de secuencia podemos nombrar IUPred (Dosztányi et al., 2005; Erdös et al., 2021), que aplica un campo de energı́a desarrollado a partir de un gran número de proteínas con estructura determinada obtenidas de PDB. El primer algoritmo en *machine learning* fue PONDR (Obradovic et al., 2003; Romero et al., 1997), entrenado a partir de un grupo estructuras de proteínas globulares y atributos de secuencia asociados a residuos no resueltos en dichas estructuras, que corresponden a regiones flexibles dentro del cristal. GlobPlot (Linding et al., 2003) fue entrenado estudiando la tendencia de un residuo a adquirir determinada estructura secundaria, hélices α o láminas β.

## **Ejercicios**

### **Ejercicio 1.** Visualización de Alineamientos en ProViz { markdown data-toc-label='Ejercicio 1' }

!!! idea "Antes de empezar, piensen ..."

      ¿Porqué es importante visualizar un MSA?
      
      ¿Qué información podemos obtener de los MSA?

**ProViz** es una herramienta que permite visualizar alineamientos y estructura de dominios de una proteína online. Ingresa a la web de **ProViz** [http://slim.icr.ac.uk/proviz/](http://slim.icr.ac.uk/proviz/), y busca la proteína p53 ingresando su Accession Number en la ventana “search” (Accession Number: P04637):

Selecciona la proteína que se llama: [Cellular tumor antigen p53 (TP53) Homo sapiens (Human)](http://slim.icr.ac.uk/proviz/proviz.php?uniprot_acc=P04637). Es la primera de la lista.


!!! danger "IMPORTANTE"

      Para responder las preguntas debajo, asegúrate de que en el panel superior de la página, en **alignments**, esté seleccionada la opción **QFO**. (Puedes investigar qué pasa si cambian a otras opciones, como *mammalian* o *vertebrates*).

      En **Options** a la izquierda haz click en *Show/hide gaps*. Aparecen más posiciones con gaps en el alineamiento que antes estaban ocultas.


**1.** ¿Qué regiones parecen estar mejor alineadas (indicar aproximadamente de qué posición a qué posición de la primera secuencia)?

**2.** ¿Existe diferencia en la composición de secuencia entre las regiones mejor alineadas y las no tan bien alineadas?

**3.** ¿Se observan diferencias en el grado de conservación de estas regiones?

**4.** ¿A qué pueden deberse las diferencias observadas?


### **Ejercicio 2.** Predicción de desorden a partir de la secuencia { markdown data-toc-label='Ejercicio 2' }

Ingresa en la web de **IUPred2A** [https://iupred2a.elte.hu](https://iupred2a.elte.hu) e ingresa la proteína p53 (puede ingresarse la secuencia de aminoácidos, el **Uniprot ID** - P53_HUMAN o el **accession number** - P04637). 

!!! info "Score IUPred"

      El algoritmo IUPred considera que un residuo es:

      * **Desordenado** cuando el valor de IUPred es mayor o igual a 0.5
      * **Ordenado** cuando es menor a 0.5

      **Nota:** Esta es una convención. El umbral lo puede decir el usuario a su propia conveniencia.

**1.** Anota las posiciones iniciales y finales de las regiones predichas como desordenadas. ¿Se correlacionan las regiones predichas como ordenadas o desordenadas con las diferencias observadas en el ejercicio anterior?

**2.** Imaginemos que queremos correr la predicción de desorden para cientos de proteínas, o que queremos contar el porcentaje de aminoácidos que se encuentran en regiones desordenadas:

   * ¿Le parece que el visualizador online sería una herramienta útil para hacerlo?
   
¡Claro que no! Por suerte, el algoritmo IUPred puede también correrse de manera local y además es rápido.

Abre una terminal y ve al directorio dónde está IUPred

```bash
cd ~/Tools/IUPred/

# Primero corremos IUPred sin ninguna opción para ver cómo es su uso:
./iupred2a.py
```
Debería aparecer lo siguiente:
```bash
Usage: ./iupred2a.py (options) (seqfile) (iupred type)
   Available types: "long", "short", "glob"

Options
   -d str   -   Location of data directory (default='./')
   -a       -   Enable ANCHOR2 predition

```

El archivo con la secuencia de p53 (`P53_HUMAN.seq`) está guardado en el mismo directorio que IUPred. En base a esto, el comando a utilizar es el siguiente

```bash
./iupred2a.py -a P53_HUMAN.seq long > P53_HUMAN.iupred
```

**3.** Explora el archivo generado (`P53_HUMAN.iupred`) y responde.

   * ¿Cómo es el formato de los datos?
   * ¿Las columnas tienen nombre? ¿Serán interpretadas correctamente por R?


**4.** **Crea un script en R.**

Para esto, abre RStudio y elije:

   *New* --> *RScript*

Recuerda ver en qué directorio estás trabajando y configurarlo para trabajar en el directorio deseado, por si no lo recuerdas las funciones eran:

* ```getwd()```: Devuelve el directorio de trabajo
* ```setwd()```: Configura el directorio de trabajo

**4a.** **¡A cargar los datos!**

¿Te acordás cómo se hacía?

Se utilizaba la función `fread()`. Vamos a modificar algunos argumentos para que lea correctamente el archivo. Si querés saber qué es cada argumento siempre se puede revisar el uso de las funciones con ```help(fread)```

``` R
library(data.table)

fileIN <- "~/Tools/IUPred/P53_HUMAN.iupred"

header <-c("Posicion","Aminoacido","Iupred","Anchor")

p53 <- fread(file=fileIN, header=T ,sep="\t", col.names=header, skip="POS")
```
Asegurate que los datos se cargaron correctamente, esperamos una tabla con 4 columnas.

**4b.** Ahora quisiéramos clasificar las posiciones en pase a la predicción realizada por IUPred como *Orden* y *Desorden*.

¿Se te ocurre cómo hacerlo?

Primero crearemos una columna en el data.table:

``` R
umbral <- 0.5
p53$Prediccion <- ""
p53[Iupred>=umbral]$Prediccion <- "Desorden"
p53[Iupred<umbral]$Prediccion <- "Orden"
```

Para obtener un gráfico similar al que brinda el servidor de IUPred, utilizaremos la librería `ggplot2`:

``` R
library(ggplot2)

plot_p53 <- ggplot(p53,aes(x=Posicion,y=Iupred)) +
  scale_x_continuous(n.breaks = 20,expand = c(0.01,0.01)) +
  scale_y_continuous(n.breaks = 10,limits = c(0,1),expand = c(0,0.01)) +
  geom_line(color="navyblue") +
  geom_point(aes(color=Prediccion)) +
  geom_hline(yintercept = 0.5,lty="dotted",size=1) +
  theme_linedraw()

plot_p53
```

Debería obtener un gráfico como el siguiente:

![](./img/IUPred.png)

Ahora, quisiéramos evaluar el porcentaje de residuos predichos ordenados y desordenados. Por suerte, R tiene una función que “cuenta” por nosotros:

``` R
cuentaTotal <- table(p53$Prediccion)
porcentaje <- 100*cuentaTotal/length(p53$Posicion)

print(cuentaTotal)
print(porcentaje)

```

**4c.** En base a los valores obtenidos, ¿diría que la proteína p53 es altamente desordenada?

**4d.** Por último, analizaremos la composición de aminoácidos de p53.

!!! idea "Pero antes:"

      ¿Qué residuos espera ver enriquecidos en las regiones **desordenadas** y cuales en las **ordenadas**? ¿Por qué?

Vamos a graficar el porcentaje de cada aminoácido predicho como ordenado o desordenado en la secuencia de p53

``` R
aminoacidos <- table(p53$Aminoacido,p53$Prediccion)
print(aminoacidos)
```

* ¿Qué hizo la función ```table``` en este caso?

Para calcular el porcentaje de aminoácidos:

``` R
aminoacidos_porcentaje <- 100*aminoacidos/length(p53$Posicion)
```

Ahora vamos a convertir la tabla en un data.table para graficar con `ggplot2`:

``` R
aminoacidos_df<-as.data.table(aminoacidos_porcentaje)
colnames(aminoacidos_df) <- c("Aminoacidos","Prediccion","Porcentaje")

plot_aa <- ggplot(aminoacidos_df,aes(x=Aminoacidos,y=Porcentaje,fill=Prediccion)) +
      geom_col(position = "dodge") +
      scale_y_continuous(n.breaks = 10,limits = c(0,10),expand = c(0,0.01)) +
      theme_bw()

ggsave(filename="aminoacidos.png",plot=plot_aa,device="png",dpi=150,width=10,height=5,units="cm")
```
Deberías obtener un gráfico como el siguiente:

![](./img/Aminoacidos.png)

* ¿Qué aminoácidos son los más abundantes en las regiones desordenadas? ¿La abundancia de los aminoácidos coincide con lo esperado?

## **PARTE II: Base de Datos Disprot**
La base de datos [DisProt](https://disprot.org/) es una colección de evidencia de desorden experimental recolectada de la literatura y curada manualmente. La evidencia corresponde a una región proteica, e incluye por lo menos:

* un experimento,
* el artículo científico correspondiente a ese experimento,
* el inicio y final de la región desordenada en la secuencia proteica
* un término de anotación que corresponde a la Ontología de desorden.
    
**Cada una de las entradas en la base de datos posee un identificador único**

La ontología de desorden está organizada en tres categorías diferentes:

* Estado estructural (*Structural State*): Orden o Desorden (*Order or Disorder*)
* Transición estructural (*Structural Transition*): Transiciones que pueden ocurrir entre diferentes estados estructurales (*Disorder to order*)
* Función de desorden (*Disorder Function*): La función de una región incluyendo términos específicos a desorden.

En Disprot también se incluye la función molecular *Molecular function* de cada región. 

### **Ejercicio 1.** Base de datos DisProt  { markdown data-toc-label='Ejercicio 1' }

La proteína p53 es una proteína supresora de tumores, es decir que su mutación favorece el crecimiento tumoral. p53 es uno de los genes más mutados en el cáncer humano, y actúa como un factor de transcripción que se expresa en todos los tejidos. Cumple un rol principal en el ciclo celular y es el regulador principal de la apoptosis. Es esencial para inducir la respuesta celular ante el daño al ADN, deteniendo el ciclo celular cuando las células no pueden reparar el ADN dañado por agentes genotóxicos. Si falla p53 podrían facilitar la formación de tumores celulares y en consecuencia producir cáncer. Alrededor de un 50% de los tumores humanos identificados poseen mutaciones en la proteína p53. Esta proteína, por su importancia para la salud humana, es una de las proteínas más estudiadas en cuanto a su estructura y función.

Ingresa a la página web de [DisProt](https://disprot.org/) y encuentra la proteína p53 (P04637). La búsqueda puede realizarse utilizando el Accession Number o por palabras claves. El identificador de DisProt que deberían encontrar es DP00086. Una vez encontrado haz click en el identificador de Disprot.


**a.** Si *Disprot consensus* está colapsado, expandelo:

   * ¿Qué tipo de información observa en la página?

**b.** Expande *Structural state* y luego expande *Disorder*:

   * ¿A qué corresponden los segmentos coloreados?
   * ¿Qué tipo de evidencia poseen dichos fragmentos?

**c.** Pensando en el rol de las regiones desordenadas.

**i.** Expande *Molecular Function*:

   * ¿Qué tipo de funciones están indicadas para cada región?
   * ¿Qué técnicas se usaron para identificarlas?

**ii.** Expande *Disorder Function*:

   * ¿Qué tipo de funciones están indicadas?
   * ¿Cuántos experimentos y que tipo de técnicas se realizaron para identificar cada una?   

**d.** Expande *Domains*.

!!! info "Sabiendo que ..."

      * **Los dominios Pfam** son asignados a partir de un perfil de HMMs creado de un alineamiento de proteínas representativas
      * **Gene3D** contiene anotaciones de dominios estructurados.
      
   ¿Se observa algún dominio conservado que **NO** adquiera una estructura globular?

**e.** ¿La evidencia experimental recolectada coincide con las predicciones realizadas en el **Ejercicio 1** y en el **Ejercicio 2**?


## **PARTE III: Análisis de alineamientos múltiples de secuencia de proteínas - Visualizando alineamientos con JalView** { markdown data-toc-label='Parte III - Alineamientos' }

## Software
* JalView:                [https://www.jalview.org/](https://www.jalview.org/)

## Recursos Online
* Pfam:                    [https://pfam.xfam.org/](https://pfam.xfam.org/)

## Objetivos
* Aprender a utilizar Jalview para visualizar un MSA y familiarizarse con el manejo de programas de visualización de alineamientos.
* Interpretar alineamientos múltiples de secuencias. Identificar regiones de secuencia conservadas y asociarlas a diferentes elementos funcionales de las proteínas. 
* Visualizar y analizar los patrones de sustitución aminoacídica encontrados en proteínas modulares. Correlacionar con sus conocimientos sobre matrices de sustitución 

## **Ejercicios**

### **Ejercicio 1.** Identificando Módulos en Proteínas { markdown data-toc-label='Ejercicio 1' }
Utilizando su código UNIPROT (P04637), busca la proteína p53 humana (P53_HUMAN) en la base de datos Pfam [https://pfam.xfam.org/](https://pfam.xfam.org/)

La base de datos Pfam es una colección de familias de dominios de proteínas construida en base a alineamientos múltiples de secuencia y modelos ocultos de markov (HMMs). Las proteínas están compuestas por una o más regiones funcionales o dominios, que combinados de distintas maneras crean la diversidad proteica que se encuentra en las proteínas naturales.

**1a.** ¿Por qué es necesario identificar dominios en las proteínas?

Para buscar la proteína p53 puedes hacerlo ingresando en *VIEW A SEQUENCE* el accession number (P04637) o el uniprot ID (P53_HUMAN)

**1b.** ¿Qué longitud tiene la proteína p53 humana?

**1c.** Observar el esquema de p53: ¿Puedes identificar qué dominios Pfam tiene p53? ¿Qué nombres y qué funciones tienen? En algunos casos esta información está en la pestaña de Pfam que aparece en la nueva ventana que se abre al hacer click en el nombre del dominio.

**1d.** ¿En qué regiones de la secuencia se encuentran estos dominios? Anotar de qué residuo a qué residuo abarca cada dominio, para usar más adelante. 

**1e.** ¿Creen que estos dominios corresponden unívocamente a dominios globulares?

**1f.** ¿A qué cree que corresponden las regiones marcadas como *Disorder* y *Low Complexity* en p53?

**1g.** ¿Se corresponden las regiones identificadas como *Disorder* en Pfam con las predichas por IUPred en el **Ejercicio 2** de la parte I de predicción de desorden? ¿Qué utiliza Pfam para poder identificar las regiones como *Disorder* (Esta información está en el **HELP** de Pfam en *Guide to Graphics*)?

## **JalView, software de visualización de alineamientos**
Para poder visualizar alineamientos múltiples de secuencias (MSA, de sus siglas en inglés: Multiple Sequence Alignment) utilizaremos el visualizador de alineamientos JalView desarrollado en JAVA. Jalview permite generar alineamientos, manipularlos, editarlos y anotarlos. Tiene una interfaz que permite acceder remotamente numerosas herramientas como programas para realizar alineamientos múltiples de secuencia y predictores de estructura secundaria. A lo largo de la guía de ejercicios, introduciremos este programa usandolo para visualizar alineamientos múltiples de secuencias (MSAs) de proteínas modulares y discutir características de secuencia asociadas a los dominios y motivos funcionales encontrados en las proteínas.

JalView es un programa que se ofrece de manera gratuita, y está disponible para descargar e instalar en tu propia computadora en [https://www.jalview.org/](https://www.jalview.org/)
 
Existen un alto número de guías y tutoriales disponibles online que pueden encontrar en: [https://www.jalview.org/training](https://www.jalview.org/training)

Los desarrolladores de JalView crearon numerosos videos de entrenamiento disponibles en el [Canal de YouTube de JalView](https://www.youtube.com/channel/UCIjpnvZB770yz7ftbrJ0tfw)

### **Ejercicio 2.** Usando JalView para analizar un MSA de p53 { markdown data-toc-label='Ejercicio 2' }
**2a.** Abre Jalview

Para abrir Jalview vayan al directorio: `~/Tools/Jalview/` y corran el archivo `jalview.sh`:

```
bash jalview.sh
```

Abran en Jalview el conjunto de secuencias de p53 que se encuentra en el archivo `p53.fasta`:  

*File* → *Input Alignment* →  *From File*

**2c.** Para realizar el alineamiento utilizaremos el programa Clustal, al cual accederemos de manera remota desde JalView de la siguiente manera:

*Web Service* → *Alignment* →  *Clustal* → *With defaults*

Si no llegara a funcionar, pues Internet, Virtualidad, la vida... Tienen las secuencias ya alineadas en el archivo `p53_aligned.fasta`

**2d.** Inspecciona el alineamiento visualmente y reconoce algunas características de las secuencias. Si no se muestran todos los residuos y algunos aparecen como `.` ve a:

*Format* → *Show Non-Conserved*

a. Algunas secuencias son más cortas que otras ¿por qué crees que es esto?

b. ¿Si quieren construir un alineamiento de alta calidad, preservarían o descartarían estas secuencias?

c. Remuevan las secuencias que no corresponden a proteínas completas. Para ello seleccionar las secuencias haciendo click sobre el nombre de la misma en el panel izquierdo, la secuencia se marcará con una caja roja punteada. Remover la secuencia seleccionada utilizando la tecla ++backspace++ o ++del++

d. ¿Existen regiones del alineamiento que no estén alineadas correctamente?

Para editar el alineamiento, primero asegurate de realizar:
    
*Select* → *Deselect All*

**Eliminar gaps:** Seleccione con el mouse el gap o arrastrando sobre el grupo de gaps que desea eliminar y presione o ++backspace++ o bien ++del++

**Agregar gaps:** Presione ++f2++. En la primera posición del alineamiento en la primera secuencia aparecerá un cursor de color negro. Colóquelo en la posición donde desee ingresar un gap y presione la barra espaciadora.

### **Ejercicio 3.** Análisis de distintas propiedades del MSA utilizando el menú COLOUR.  { markdown data-toc-label='Ejercicio 3' }
Este menú permite colorear el alineamiento con diferentes paletas de colores que permiten visualizar determinadas características fisicoquímicas o relacionadas con la conservación o identidad de secuencia que facilitan el análisis de la información contenida en el MSA.

Por ejemplo: *Percentage identity* colorea los residuos según el porcentaje de identidad en la columna. *Hydrophobicity* colorea los residuos según el grado de hidrofobicidad.

También es posible disminuir la intensidad de los colores según el grado de conservación (*By conservation*) o filtrar los colores según el porcentaje de identidad (*Above identity threshold*) a partir de un umbral deseado.

**3a.** Seleccione para colorear el alineamiento desde el menú la opción:

*Colour* → *Clustalx*

Este esquema es muy comúnmente utilizado para la visualización de MSAs y permite representar información importante contenida en los patrones de sustitución de un MSA.

Observando el alineamiento intente identificar:

a. ¿Cuál es la base del esquema de color “ClustalX” provisto por Jalview? *Nota:* Google provee respuestas pero... pueden ir directamente al [esquema de colores de ClustalX](http://www.jalview.org/help/html/colourSchemes/clustal.html)  
b. ¿Cuántos colores existen?  
c. ¿Qué propiedades fisicoquímicas representa cada grupo de color?  
d. La cisteína cumple un rol estructural importante en algunas proteínas (¿cuál?). ¿Qué observa respecto de la coloración de la cisteína? ¿Es siempre igual? ¿A qué se debe el cambio en la representación?  

!!! info ""
      En ProViz la cisteína estaba siempre coloreada del mismo color, pero en el esquema de colores de ClustalX no lo está.

e. ¿En qué situaciones los residuos no están coloreados?

f. Hay residuos que siempre están coloreados? ¿Cuáles son y a qué cree que se debe?

**3b.** Manteniendo el esquema de color Clustal, es posible filtrar regiones de acuerdo al % identidad en el alineamiento múltiple. Para ello, aplique el filtro de identidad yendo a:

*Colour* → *Above identity threshold*

Se abrirá una ventana en la cual podrá seleccionar el % identidad del filtro en escala de 0 a 100%. Explore los cambios en todo el alineamiento al variar la escala de 0 a 100%.

Utilizando el filtro, respondan:

a. ¿Qué regiones muestran una identidad de secuencia mayor al 80% en el MSA de p53? ¿Y al 100%?

   Anote los límites de estas regiones y responda: ¿Qué correlación observa con la información obtenida de Pfam?
 
Con la identidad al 80%, observe en las columnas del MSA que sustituciones ocurren. Estas susticiones son un reflejo de la historia evolutiva de la proteína y contienen mucha información funcional.

Observando detenidamente, responda:

b. ¿Qué tipos de sustituciones observa?  
c. ¿Qué relación guardan estas sustituciones con las matrices PAM y BLOSUM utilizadas para construir alineamientos de proteínas? 
d. En base a este alineamiento analice las regiones desordenadas y ordenadas ya reconocidas en p53. Compare sus observaciones en este alineamiento con el alineamiento visualizado en ProViz en el **Ejercicio 1** de la **PARTE I**.

* ¿Puede distinguir las mismas regiones? 
* ¿Ve diferencias en la composición de secuencia en cada región entre los dos alineamientos?  
* ¿Se observan diferencias en el grado de conservación entre los dos alineamientos?  
* ¿Las especies a las que corresponde cada secuencia son las mismas en los alineamientos? ¿Cuál posee organismos más distantes?  
* Discuta qué ventajas considera que tiene trabajar con un alineamiento propio respecto de trabajar con el alineamiento de ProViz.

## Ejercicio a informar

!!! info ""

      **Fecha límite de entrega:** Viernes, 07 de Octubre 2022, 23:59hs.



### Enunciado
El aislamiento que le proporcionaron está avanzando rápidamente en latinoamérica!.
Dada la importancia de la proteína N de la nucleocápside en la replicación viral, su jefe considera que es un blanco posible de drogas.
La proteína N forma la nucleocápside viral de SARS-CoV2 y empaqueta el genoma viral de ARN formando una
ribonucleocápside. La estructura de la proteína es altamente desordenada y posee dos dominios globulares
pequeños en el N-terminal (Dominio N) y C terminal (Dominio C). 

1. Usando IUPred, identifique las regiones desordenadas y globulares. ¿Puede identificar fácilmente los dominios globulares con el umbral de 0.5? ¿y con el umbral de 0.4? Justifique los resultados en base al funcionamiento del algoritmo.

2. Si desearía cristalizar el dominio N ¿Qué regiones no incluiría?

3. Analice la proporción de residuos predichos como ordenados y como desordenados utilizando cada uno de los umbrales. ¿Se correlaciona esto con lo estudiado en la literatura?

**Extra! (y por ende opcional)**
1. Como se vió en la clase teórica, IUPred puede correrse utilizando como argumento `short` o `long`. Realice el gráfico del perfil de IUPred nuevamente utilizando `short`. ¿Qué diferencias observa en los gráficos usando Iupred `short` o `long`? En base a sus conocimientos de IUPred, explique **brevemente** y de manera **abarcativa** las diferencias observadas.


<!--
## Ejercicios Adicionales de Desorden
### Ejercicio Adicional 1. Base de datos MobiDB

* MobiDB            [http://mobidb.bio.unipd.it/](http://mobidb.bio.unipd.it/)

La base de datos MobiDB centraliza diferentes recursos que facilitan la anotación de proteínas desordenadas y de su función. MobiDB abarca distintos aspectos del desorden, desde regiones que carecen una estructura tridimensional definida anotadas o predichas como desordenadas hasta regiones que interactúan con otras proteínas, ADN o ARN preservando una estructura desordenada. Los datos provienen de bases de datos externas con datos manualmente curados, de datos experimentales como estructuras tridimensionales de las proteínas o predicciones.

1. Ingresa a la web de MobiDB: [(http://mobidb.bio.unipd.it)](http://mobidb.bio.unipd.it) y busca la proteína p53 (P04637).

2. Ingresa a **Advanced**. En la primera línea se indica la secuencia. A la izquierda aparece una lista de métodos que aportan distinta información de desorden. Observa la línea **Disorder consensus**. Si haces click en la `P` verás que se pliega o despliega una lista de predictores de desorden y sus predicciones. En la primera línea, al lado de **Disorder consensus**, se encuentra el consenso de la predicción de desorden.

* ¿Cuáles regiones son predichas como desordenadas por la mayoría de los métodos?
* ¿Qué métodos predicen más desorden y cuáles menos? ¿Hay mucha variación?

3. Ahora observa la línea que dice **Missing residues consensus**, donde se indica el consenso en base a la evidencia estructural. Ubique el mouse sobre las distintas regiones y responda: ¿Qué significan los distintos colores de las regiones marcados en el consenso?

4. Exploremos la evidencia proveniente de la estructura cristalográfica. Para ello despliega la sección *Missing residues consensus* haciendo click en la `D` al lado de **Missing residues consensus**.

    * ¿Qué regiones tienen una estructura? 

    Observa la entrada 5AOM_A. Ahora ve a la página web del [Protein Data Bank](https://www.rcsb.org) y busca el PDB 5AOM, o puedes ir directamente desde [aquí](https://www.rcsb.org/structure/5AOM). En la web de la base de datos de PDB ve a la sección *Macromolecules*. Mira la sección correspondiente a la cadena A (UNMODELED A). ¿Puedes decir cómo se determinó que estas regiones eran desordenadas?

### Ejercicio Adicional 2. Selección de regiones para determinar la estructura de una proteína.
Una de las aplicaciones principales de la predicción de desorden es encontrar regiones que son más adecuadas para determinar la estructura tridimensional de una proteína por cristalografía de rayos X.

1. ¿Por qué cree que predecir las regiones desordenadas puede ayudar a seleccionar el dominio para cristalizar?

Dada la siguiente proteína misteriosa:

```
>mystery_protein  
MMQDLRLILIIVGAIAIIALLVHGFWTSRKERSSMFRDRPLKRMKSKRDDDSYDEDVEDD
EGVGEVRVHRVNHAPANAQEHEAARPSPQHQYQPPYASAQPRQPVQQPPEAQVPPQHAPH
PAQPVQQPAYQPQPEQPLQQPVSPQVAPAPQPVHSAPQPAQQAFQPAEPVAAPQPEPVAE
PAPVMDKPKRKEAVIIMNVAAHHGSELNGELLLNSIQQAGFIFGDMNIYHRHLSPDGSGP
ALFSLANMVKPGTFDPEMKDFTTPGVTIFMQVPSYGDELQNFKLMLQSAQHIADEVGGVV
LDDQRRMMTPQKLREYQDIIREVKDANA
```

2. Utilizando IUPred2A, pega solamente la secuencia sin el header ¿Qué región de la proteína trataría de cristalizar?

3. Para ver si la selección fue la correcta, haz un blast de la secuencia en la página web [https://blast.ncbi.nlm.nih.gov/Blast.cgi](https://blast.ncbi.nlm.nih.gov/Blast.cgi).

Pega la secuencia en el box *Enter Query Sequence*. Chequear que el box *align two or more sequences* no esté seleccionado.

En la sección **Choose Search Set**, selecciona la **database Protein Data Bank proteins (pdb)**.

Explora los resultados. ¿Elegimos correctamente?


### Ejercicio Adicional 3. Búsqueda de regiones funcionales dentro de las IDPs, usando como ejemplo la proteína p53.

#### Objetivos:
* Familiarizarse con la identificación de sitios de unión en IDPs
* Interpretación de los resultados de los distintos métodos.

Muchas proteínas desordenadas ejercen su función uniéndose a una proteína globular, mediante una transición de desorden a orden. ANCHOR es un algoritmo para predecir sitios de unión en proteínas desordenadas buscando identificar segmentos que residen en regiones desordenadas y no forman interacciones intracatenarias suficientes que favorezcan el plegado por sí mismas, pero sí logran estabilizarse al interactuar con una proteína globular.

1. Ve a la web de IUPred. [https://iupred2a.elte.hu](https://iupred2a.elte.hu)

2. Ingresa la proteína p53 (P53_HUMAN), asegúrate que la opción ANCHOR en *Context-dependent predictions* esté seleccionada.
    * ¿Cuántas regiones de interacción identifica ANCHOR?

3. La base de datos IDEAL se enfoca en IDRs que adoptan una estructura 3D al unirse a sus pares proteicos y se los llama *Protean Segments* (ProS), que se definen cuando la información estructural y no desestructural existen. Hay otros conceptos similares a los ProS que difieren en la definición, como por ejemplo, los *Molecular recognition features* (MoRFs), que tienen una limitación de longitud de 70 residues y los motivos lineales eucarióticos que son expresados por expresiones regulares.

    Ingresa a la base de datos IDEAL y busca la proteína p53 (P53_HUMAN, P04637). ¿Qué regiones están involucradas en la formación de complejos?

    Prestando atención a la región C-terminal:

    a. ¿A cuántas proteínas distintas se une p53?  
    b. ¿Qué tipo de estructura secundaria adquieren en el complejo?
        

4. Busca los PDBs: 1MA3, 1H26, 1JSP, 1DT7.

    ¿Cuán parecidas son las predicciones de ANCHOR con las regiones de unión conocidas?


Existen muchísimos métodos para predecir regiones desordenadas. Puedes probar los siguientes métodos en casa y ver las diferencias:

* PONDR [http://www.pondr.com](http://www.pondr.com)
* PredictProtein [http://ppopen.informatik.tu-muenchen.de/](http://ppopen.informatik.tu-muenchen.de/)

    IDPs se predicen por Meta-Disorder a partir de una combinación de NORSnet, DISOPRED2, PROFbval y Ucon.

* Globplot2 [http://globplot.embl.de/](http://globplot.embl.de/)
* DISOPRED3 [http://bioinf.cs.ucl.ac.uk/psipred/](http://bioinf.cs.ucl.ac.uk/psipred/)

    Elegir la opción Disopred3. Este método lleva por lo menos 20 minutos y puede tardar hasta 2 horas.

### Ejercicio Adicional 4. Análisis de una proteína altamente desordenada
1. Utiliza un predictor de desorden para la entrada de DisProt DP00039.
2. Utiliza el servidor protparam [(https://web.expasy.org/protparam/)](https://web.expasy.org/protparam/), o algún otro método que conozcas, para contar el número de aminoácidos cargados positivamente y el número de aminoácidos cargados negativamente.
3. Calcula la carga neta (o utiliza el servidor protparam)
4. Observa los segmentos de baja complejidad de secuencia (indicados en Pfam)
5. Observa los dominios Pfam.
6. ¿Existen contradicciones entre la asignación de dominios Pfam y el desorden predicho?

### Ejercicio Adicional 5. Caracterización de la proteína humana N-WASP (O00401) desde el punto de vista de orden y desorden.
1. Busca el número de estructuras PDB que existen para esta proteína ([http://www.rcsb.org/pdb/protein/O00401](http://www.rcsb.org/pdb/protein/O00401) → *Number of PDB entries for O00401*)
2. ¿Qué regiones de la proteína N-WASP están resueltas para cada entrada del PDB?
3. Busca familias Pfam y observa el tipo.

    a. Haz click en el domain  
    b. Haz click en *Curation and model*  
    c. Chequea el tipo: *Domain*, *Family* o *Motif*

4. Encuentra regiones de baja complejidad (“low complexity”) ¿Qué aminoácidos son más frecuentes en esta región?
5. Utiliza el predictor de desorden de tu preferencia.
6. ¿Qué regiones llamarías desordenadas?
-->