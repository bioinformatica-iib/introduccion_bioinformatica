---
title: Practico Diez
icon: fontawesome/solid/hammer
tags: 
  - practicos
---
![Image](img/featured.png){ width="250", align="left" }

# **TP 10**. Predicción de Desorden { markdown data-toc-label = 'TP 10' }

<br>
<br>
<br>

!!! abstract "Atención: Este TP tiene informe."
!!! abstract "Atención: Este TP tiene parcialito."

[:fontawesome-solid-download: Materiales](https://drive.google.com/file/d/1wh5zn1GZ4s_Rp8V5lekZZbIKzM7BOKc8/view?usp=sharing){ .md-button .md-button--primary }
[:fontawesome-solid-file-powerpoint: Slides](https://drive.google.com/file/d/1L2LbUjMPgr5c7-hwO52QJPJ-dGeyQQZg/view?usp=sharing){ .md-button .md-button--primary } 

## **PARTE I: Predicción de Desorden**

## Recursos online
* DisProt             [https://www.disprot.org](https://www.disprot.org)
* InterPro            [https://www.ebi.ac.uk/interpro/](https://www.ebi.ac.uk/interpro/)
* ProViz              [http://slim.icr.ac.uk/proviz/](http://slim.icr.ac.uk/proviz/)
* IUPred3             [https://iupred3.elte.hu](https://iupred3.elte.hu)

## Objetivos
* Familiarizarse con la base de datos DisProt y las técnicas experimentales que permiten la identificación de regiones desordenadas.
* Integrar conocimientos de dominios conservados (InterPro) con la presencia/ausencia de estructura tridimensional.
* Interpretar alineamientos múltiples de secuencias (MSAs). 
* Identificar regiones ordenadas y desordenadas en MSAs.
* Familiarizarse con distintos métodos de predicción de desorden.


## **Métodos de predicción de desorden**

Uno de los mayores desafíos en el campo de las proteínas es la predicción de la estructura tridimensional a partir de la estructura primaria incluyendo aquellas proteínas que son total o parcialmente desordenadas. Mientras que las proteínas globulares adquieren una única estructura nativa, las proteínas intrínsecamente desordenadas (IDPs, del inglés *intrinsically disordered proteins*) son un conjunto de estructuras tridimensionales. También pueden existir regiones desordenadas conectando dos dominios globulares, como los *loops*; o incluso regiones más largas, que abarcan más de 30 residuos de longitud, que reciben el nombre de IDRs (del inglés *intrinsically disordered regions*).

En el año 2020, AlphaFold2 gana la competición de predicción de estructuras (CASP14) con un amplio margen prediciendo estructuras con muy alta precisión. Sin embargo, aún la predicción de un conjunto de estructuras para proteínas desordenadas no se ha resuelto.

La predicción de IDRs/IDPs a partir de la secuencia de aminoácidos permite un análisis rápido y abarcativo de distintas proteínas permitiendo establecer hipótesis sobre la presencia de desorden en las proteínas (Dunker et al., 2008; van der Lee et al., 2014). La importancia que adquirieron las IDRs/IDPs en los últimos años llevó al desarrollo de numerosos métodos de predicción, pero en general se basan en tres estrategias de predicción de desorden:

1. **Composición de secuencia:** como IUPred (Dosztányi et al., 2005; Erdös et al., 2021), que aplica un campo de energía estadístico desarrollado a partir de estructuras del PDB.
2. **Machine learning:** como PONDR (Obradovic et al., 2003; Romero et al., 1997), entrenado a partir de un grupo estructuras de proteínas globulares y atributos de secuencia asociados a residuos no resueltos en dichas estructuras, que corresponden a regiones flexibles dentro del cristal. GlobPlot (Linding et al., 2003) fue entrenado estudiando la tendencia de un residuo a adquirir determinada estructura secundaria, hélices α o láminas β.
3. **Meta-predictores:** que integran y ponderan los resultados de múltiples métodos individuales.


### **Parte I: Caracterización de p53** 

La proteína p53 es esencial para inducir la respuesta celular ante el daño al ADN, deteniendo el ciclo celular o induciendo apoptosis, por lo que mutaciones en la misma pueden dar como resultado distintos tipos de cáncer. Dada su importancia biomédica, es una de las proteínas más estudiadas estructural y funcionalmente.

### **Ejercicio 1.** Base de datos DisProt { markdown data-toc-label='Ejercicio 1' }

La base de datos [DisProt](https://disprot.org/) es una colección de evidencia de desorden experimental recolectada de la literatura y curada manualmente, e incluye por lo menos:
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

Ingresa a la web de DisProt y encuentra la proteína p53 (P04637). El identificador de DisProt que deberías encontrar es **DP00086**.

**1.1.** Expande la sección *Structural state* y luego *Disorder*:
   * ¿A qué corresponden los segmentos coloreados en la secuencia?
   * ¿Qué tipo de evidencia experimental validó dichos fragmentos como desordenados?

**1.2.** Pensando en el rol biológico de estas regiones, expande *Molecular Function* y *Disorder Function*:
   * ¿Qué tipo de funciones están indicadas para las regiones desordenadas de p53?
   * Nombra al menos dos técnicas experimentales que se hayan usado para asignar estas funciones.

### **Ejercicio 2.** Dominios conservados en InterPro { markdown data-toc-label='Ejercicio 2' }

!!! idea "Integrando conceptos: InterPro, Pfam y HMMs"
      En el TP de anterior de HMMs aprendimos a identificar dominios conservados en proteínas utilizando bases de datos de perfiles como **Pfam** a través de **InterPro**. 

Observa la línea de **InterPro** dentro de la misma página de DisProt (o busca P04637 directamente en la web de InterPro (https://www.ebi.ac.uk/interpro/) y enfócate en las predicciones de la base de datos **Pfam**.

**2.1.** ¿Cuántos dominios conservados distintos muestra Pfam para p53?

**2.2.** Contrastando con la información vista en el Ejercicio 1: Las regiones validadas experimentalmente como "desordenadas" en DisProt, ¿coinciden con la presencia o con la ausencia de dominios Pfam? 

**2.3.** Biológica y estructuralmente, ¿por qué crees que sucede esto?

---
## **PARTE II: Análisis de Regiones Desordenadas a través de Alineamientos Múltiples de Secuencia (MSAs)**

!!! idea "Antes de seguir, piensen ..."

      ¿Porqué es importante visualizar un MSA?
      
      ¿Qué información podemos obtener de los MSA?

**ProViz** es una herramienta que permite visualizar alineamientos y estructura de dominios de una proteína online. 
### **Ejercicio 1.** Ingresa a la web de **ProViz** [http://slim.icr.ac.uk/proviz/](http://slim.icr.ac.uk/proviz/), y busca la proteína p53 ingresando su Accession Number en la ventana “search” (Accession Number: P04637): { markdown data-toc-label='Ejercicio 1: ProViz' }

Selecciona la proteína que se llama: [Cellular tumor antigen p53 (TP53) Homo sapiens (Human)](http://slim.icr.ac.uk/proviz/proviz.php?uniprot_acc=P04637). Es la primera de la lista.


!!! danger "IMPORTANTE"

      Para responder las preguntas debajo, asegúrate de que en el panel superior de la página, en **alignments**, esté seleccionada la opción **QFO**. (Puedes investigar qué pasa si cambian a otras opciones, como *mammalian* o *vertebrates*).


**1.1.** ¿Qué regiones parecen estar mejor alineadas (indicar aproximadamente de qué posición a qué posición de la primera secuencia)?

**1.2.** ¿Existe diferencia en la composición de secuencia entre las regiones mejor alineadas y las no tan bien alineadas?

**1.3.** ¿Se observan diferencias en el grado de conservación de estas regiones?

**1.4.** ¿A qué pueden deberse las diferencias observadas?

### **Ejercicio 2.** Opción Local: Análisis con JalView { markdown data-toc-label='Ejercicio 2: JalView' }

Jalview es un software robusto que permite generar, editar, analizar y colorear alineamientos localmente.

2.1. Abre JalView (ejecutando el programa en tu computadora). Descarga y abre el conjunto de secuencias p53.fasta proporcionado en los materiales:
File → Input Alignment → From File

2.2. Para realizar el alineamiento, usaremos Clustal de manera remota:
Web Service → Alignment → Clustal → With defaults
(Nota: Si el servicio falla, abre directamente el archivo p53_aligned.fasta que ya se encuentra alineado).

2.3. Edición del alineamiento:
Si algunas secuencias son mucho más cortas o están truncadas, pueden generar ruido. Selecciona el nombre de la secuencia a la izquierda y bórrala (teclas ++backspace++ o ++del++). ¿Por qué creen que es importante filtrar el alineamiento inicial?

2.4. Análisis por colores (Colour → Clustalx):
Este esquema colorea por propiedades fisicoquímicas, pero la intensidad depende de la conservación.

¿Qué observa respecto de la coloración de las cisteínas? ¿Es siempre igual? ¿A qué se debe?

¿Hay residuos que siempre están coloreados? ¿Cuáles son y a qué cree que se debe?

2.5. Filtro de Identidad (Colour → Above identity threshold):
Modifica el umbral de identidad y observa qué regiones sobreviven al 80% o al 100%.

¿Qué regiones muestran una identidad de secuencia mayor al 80%? ¿Coinciden estas regiones con los dominios encontrados en InterPro o con las regiones ordenadas de DisProt?

Observando las regiones variables, ¿qué tipos de sustituciones observa? ¿Qué relación guardan con las matrices BLOSUM o PAM?


---

## **PARTE III: Predicción de Desorden**

Uno de los mayores desafíos en el campo estructural es la predicción de proteínas intrínsecamente desordenadas (IDPs) o regiones desordenadas (IDRs). A diferencia de las proteínas globulares, las IDPs consisten en un ensamble (conjunto) dinámico de conformaciones.
Existen distintas estrategias para predecir desorden a partir de la secuencia: algoritmos basados en la composición de aminoácidos (como IUPred), algoritmos de *machine learning* entrenados con cristalografía (PONDR, GlobPlot), y meta-predictores.

### **Ejercicio 1.** IUPred3 Web para una secuencia { markdown data-toc-label='Ejercicio 1: IUPred3 Web' }

### **Ejercicio 1.** IUPred3 Web para una secuencia { markdown data-toc-label='Ejercicio 1: IUPred3 Web' }

!!! info "Score IUPred"
    En general se considera que un residuo es:
    
    * **Desordenado** cuando el valor de IUPred es mayor o igual a 0.5
    * **Ordenado** cuando es menor a 0.5

     **Nota:** Esta es una convención. El umbral lo puede decir el usuario a su propia conveniencia.
     
    Es posible utilizar la web de **IUPred3** [https://iupred3.elte.hu/](https://iupred3.elte.hu/){ target="_blank" } para realizar una predicción rápida.

**1.1.** Ingresa el Accession Number de p53 (P04637) en la web. Selecciona el tipo de predicción *Long disorder*.

**1.2.** Observa el gráfico interactivo resultante. ¿Las regiones predichas como desordenadas por el algoritmo (score $\ge$ 0.5) coinciden con la evidencia experimental que se vió previamente en DisProt?

### **Ejercicio 2.** Análisis de múltiples secuencias con IUPred3 en Google Colab (Python) { markdown data-toc-label='Ejercicio 2: IUPred3 Colab' }

Imaginemos que queremos analizar la conservación del desorden en decenas de ortólogos de p53. El visualizador web no es práctico para analizar muchas secuencias a la vez.

Utilizaremos la librería **Biopython** para extraer cada secuencia de nuestro archivo multi-FASTA, ejecutaremos el algoritmo de **IUPred3** desde Python usando comandos del sistema, y consolidaremos los datos para generar un gráfico superpuesto.

**2.1.** Preparación del entorno y descarga de archivos.
En tu primera celda de código de Colab, instala Biopython y trae los archivos desde la carpeta de materiales de la materia:

!!! info "¿Qué es Biopython?"
Biopython es un conjunto de herramientas de Python diseñadas específicamente para resolver tareas de biología computacional. En este TP utilizaremos su módulo SeqIO (Sequence Input/Output), que nos permite leer el archivo multi-FASTA, separar automáticamente las secuencias y acceder a sus propiedades (como el nombre o los aminoácidos) de forma muy sencilla, ahorrándonos el trabajo de tener que programar el recorte del texto a mano.

```bash
# Instalamos Biopython
!pip install biopython

# Descargamos el algoritmo IUPred3
!gdown "[https://drive.google.com/uc?id=1TgHdeQAOzZJk3Yln1zlnbZYAHMI6P1G8](https://drive.google.com/uc?id=1TgHdeQAOzZJk3Yln1zlnbZYAHMI6P1G8)" -O iupred3.tar.gz

# Descargamos el archivo multi-FASTA con ortólogos de p53
!gdown "[https://drive.google.com/uc?id=1ZsNxx4T8dp6HVXUsv482XzjTsm3FwEsO](https://drive.google.com/uc?id=1ZsNxx4T8dp6HVXUsv482XzjTsm3FwEsO)" -O p53.fasta

# Descomprimimos el algoritmo
!tar -xzf iupred3.tar.gz
```

**2.2.** Procesamiento del archivo multi-FASTA: Vamos a leer el archivo multi-FASTA, extraer cada secuencia de forma individual, correr IUPred3 y unir todas las tablas resultantes en un único DataFrame de Pandas.

```Python
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from Bio import SeqIO

# 1. Leemos todas las secuencias del archivo multi-FASTA
secuencias = list(SeqIO.parse("p53.fasta", "fasta"))

lista_de_tablas = []
nombres_columnas = ["Posicion", "Aminoacido", "Iupred", "Anchor"]

print(f"Procesando {len(secuencias)} secuencias. Esto puede tardar un momento...")

for i, secuencia_actual in enumerate(secuencias):
    # Tomamos el nombre de la secuencia
    nombre_proteina = secuencia_actual.id.split("|")[-1] 
    
    # Nombres de los archivos que vamos a crear en cada vuelta del ciclo
    archivo_secuencia = f"secuencia_{i}.seq"
    archivo_resultado = f"resultado_{i}.iupred"
    
    # 2. Guardamos la secuencia individual en la computadora de Colab
    SeqIO.write(secuencia_actual, archivo_secuencia, "fasta")
    
    # 3. Ejecutamos IUPred3 mandando el comando a la terminal del sistema
    comando = f"python iupred3/iupred3.py -a {archivo_secuencia} long > {archivo_resultado}"
    os.system(comando)
    
    # 4. Leemos el resultado y lo guardamos en una tabla de Pandas
    tabla_individual = pd.read_csv(archivo_resultado, sep="\t", names=nombres_columnas, comment="#", skipinitialspace=True)
    
    # Agregamos una columna clave para identificar de qué proteína son estos datos
    tabla_individual['Proteina'] = nombre_proteina  
    
    # Guardamos esta tabla en nuestra lista
    lista_de_tablas.append(tabla_individual)

# 5. Unimos todas las tablas pequeñas en una sola tabla grande
tabla_general = pd.concat(lista_de_tablas, ignore_index=True)

# Clasificamos según el umbral de 0.5
tabla_general['Prediccion'] = np.where(tabla_general['Iupred'] >= 0.5, 'Desorden', 'Orden')

# Vemos las primeras filas
tabla_general.head()
```

**2.3** Gráfico de conservación del desorden (Media y Desvío):
Para ver el comportamiento general de la familia p53, vamos a graficar todas las curvas individuales superpuestas con un color tenue. Por encima, calcularemos y graficaremos la línea media junto a una franja sombreada que represente el desvío estándar.

```Python
plt.figure(figsize=(12, 5))

# Primero: Graficamos todas las secuencias individuales superpuestas
# Usamos alpha=0.3 para que sean semitransparentes y formen el fondo
sns.lineplot(data=tabla_general, x='Posicion', y='Iupred', hue='Proteina', 
             alpha=0.3, linewidth=1, legend=False)

# Segundo: Graficamos la Media y el Desvío Estándar
# Al no pasarle 'hue', Seaborn agrupa automáticamente por Posición, 
# calcula la media y grafica el desvío estándar (errorbar='sd')
sns.lineplot(data=tabla_general, x='Posicion', y='Iupred', color='black', 
             errorbar='sd', linewidth=2.5, label='Media ± Desvío')

# Formato del gráfico
plt.axhline(y=0.5, color='red', linestyle='--', linewidth=1.5, label='Umbral (0.5)')
plt.ylim(0, 1)
plt.xlim(0, tabla_general['Posicion'].max())
plt.xlabel("Posición (Aminoácido)", fontsize=12)
plt.ylabel("Score IUPred3", fontsize=12)
plt.title("Conservación del desorden en p53", fontsize=14)
plt.grid(True, linestyle=':', alpha=0.6)
plt.legend(loc='upper right')

plt.tight_layout()
plt.show()
```
Observa el gráfico generado con las secuencias superpuestas y la tendencia central, y responde:

* La línea negra marca la tendencia general de la familia p53. ¿Qué regiones (N-terminal, central, C-terminal) muestran mayor propensión conservada al desorden?

* Notarás que el "ruido" (el desvío estándar sombreado) se ensancha o que las curvas individuales de fondo se desfasen hacia la derecha o izquierda. ¿Por qué ocurre esto al graficar por posición sin haber hecho un alineamiento previo con gaps?

**2.5** Análisis de composición: 
Según la teórica, las regiones desordenadas están empobrecidas en aminoácidos hidrofóbicos y enriquecidas en residuos polares/cargados y prolina. 
Aprovechemos nuestro DataFrame general con todas las secuencias juntas para ver qué aminoácidos son más frecuentes en regiones ordenadas vs. desordenadas en todas las secuencias:

``` Python
plt.figure(figsize=(12, 5))

# El gráfico cuenta automáticamente la frecuencia en la tabla
sns.countplot(data=tabla_general, x='Aminoacido', hue='Prediccion', 
              palette={'Desorden':'red', 'Orden':'blue'}, 
              order=tabla_general['Aminoacido'].value_counts().index)

plt.title('Abundancia de Aminoácidos: Orden vs Desorden en p53')
plt.ylabel('Cantidad total de residuos')
plt.grid(axis='y', linestyle=':', alpha=0.7)
plt.show()
```
Deberías obtener un gráfico como el siguiente:

![](./img/Aminoacidos.png)

---

## **Ejercicio a informar**
!!! danger "Entrega"
**Fecha límite de entrega: viernes 16/10, 23:59hs.** 
 { markdown data-toc-label='Entrega de informe' }

**Enunciado**

Las ciclinas son proteínas que regulan el ciclo celular uniéndose y activando a las quinasas dependientes de ciclinas (CDKs). Dada su relevancia, su disfunción contribuye al desarrollo de diversas enfermedades, incluyendo el cáncer.
La ciclina CCND1 (P24385, ciclina D1) es un regulador clave en la transición de la fase G1 a la fase S. Las ciclinas CCND2 (P30279, ciclina D2) y CCND3 (P30281, ciclina D3) tienen funciones estructurales similares a D1, pero se expresan en distintos tejidos.

En tu laboratorio de bioinformática están interesados en estudiar la estructura de estas tres ciclinas para futuros ensayos de docking.

**1 Predicción:** Usando tu pipeline de Colab (IUPred3), procesa e identifica el porcentaje de regiones desordenadas y globulares en las tres ciclinas. Genera los perfiles de desorden.

**2. Alineamiento de secuencias:** Busca la composición de dominios Pfam. Crea un alineamiento múltiple (MSA) de las tres secuencias utilizando JalView. ¿Qué nivel de conservación observas en las regiones desordenadas vs. los dominios Pfam?

**3. Validación:** Búscalas en DisProt. ¿Existen datos experimentales de desorden para estas proteínas? ¿Coinciden con las predicciones computacionales obtenidas en el punto 1?


---

## Ejercicios Adicionales (Opcionales)

### **Ejercicio Adicional 1. Búsqueda de sitios de unión a IDPs (ANCHOR)** { markdown data-toc-label='Ejercicio Adicional 1' }

Muchas proteínas desordenadas ejercen su función uniéndose a un partner globular, mediante una transición acoplada de plegamiento y unión (folding upon binding). ANCHOR es un algoritmo que identifica estos posibles sitios de unión dentro de regiones desordenadas.

**1.1** En el servidor web de IUPred3, asegúrate de activar la opción ANCHOR en Context-dependent predictions para p53.

 * ¿Cuántas regiones de interacción identifica la curva azul (ANCHOR)?

**1.2** Ingresa a la base de datos [IDEAL](https://www.ideal-db.org/) y busca P53_HUMAN. Esta base de datos anota Protean Segments (ProS) con confirmación estructural.

* En la región C-terminal, ¿a cuántas proteínas distintas se une p53? (Revisa el link "complex").

* ¿Qué tipo de estructura secundaria (hélice, lámina, coil) adquiere ese segmento al unirse a distintos partners?

**1.3** ¿Cuán precisas resultaron las predicciones ab initio de ANCHOR respecto a los complejos cristalizados reportados en IDEAL?

### **Ejercicio Adicional 2. Proteínas Extremas** { markdown data-toc-label='Ejercicio Adicional 2' }

**2.1** Busca la entrada DP00039 en DisProt. Corre IUPred3 para su secuencia.

**2.2** Utiliza un script de Python o el servidor ProtParam (https://web.expasy.org/protparam/{ target="_blank" }) para contar la cantidad de aminoácidos con carga positiva vs negativa. Calcula su carga neta.

**2.3** Observa los dominios que propone InterPro. ¿Existen contradicciones lógicas entre la asignación de familias y el altísimo desorden predicho?
<!--

