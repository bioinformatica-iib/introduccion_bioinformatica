![Banner](img/banner.jpg){ width="250", align="left" }

# **TP 2**. EMBOSS { markdown data-toc-label = 'TP 2' }

<br>

[:fontawesome-solid-download: Materiales](#){ .md-button .md-button--primary }
<!--
Este es el botón para decargar materiales, en (#) hay que agregar el link correspondiente.
--->

### Software a usar
* EMBOSS (ya instalado en la VM)

### Recursos Online



### Objetivos

* Familiarizarse con el uso de herramientas bioinformáticas por línea de comandos.
* Familiarizarse con los formatos característicos de datos biológicos.
* Aprender usar comandos desde cero (sin copiar y pegar).


## **Introduccion al Tema**

[EMBOSS](http://emboss.sourceforge.net/) es una suite bioinformática creada y mantenida por [EMBnet](https://www.embnet.org/) que incluye una multitud de herramientas elementales en biología molecular y genética. Algunas ventajas de EMBOSS son:

* Maneja información biológica en varios formatos para realizar distintos tipos de tareas.
* Es muy rápida, lo cual significa que es computacionalmente escalable.
* Si bien cada uno de sus programas individuales podrían ser reemplazados por otros softwares o un script propio, EMBOSS agrupa todos estos programas en un solo paquete y le provee al usuario una interfaz unificada para todas las aplicaciones.

A continuación se encuentra una lista de 256 programas que contiene EMBOSS y un resumen corto de lo que hace cada uno:

??? info "Programas de EMBOSS"

    | Program name { data-sort-method='none' } | Description { data-sort-method='none' } |
    | :--- | :--- |
    | aaindexextract | Extract amino acid property data from AAINDEX |
    | abiview | Display the trace in an ABI sequencer file |
    | acdc | Test an application ACD file |
    | acdpretty | Correctly reformat an application ACD file |
    | acdtable | Generate an HTML table of parameters from an application ACD file |
    | acdtrace | Trace processing of an application ACD file (for testing) |
    | acdvalid | Validate an application ACD file |
    | aligncopy | Read and write alignments |
    | aligncopypair | Read and write pairs from alignments |
    | antigenic | Find antigenic sites in proteins |
    | assemblyget | Get assembly of sequence reads |
    | backtranambig | Back-translate a protein sequence to ambiguous nucleotide sequence |
    | backtranseq | Back-translate a protein sequence to a nucleotide sequence |
    | banana | Plot bending and curvature data for B-DNA |
    | biosed | Replace or delete sequence sections |
    | btwisted | Calculate the twisting in a B-DNA sequence |
    | cachedas | Generate server cache file for DAS servers or for the DAS registry |
    | cachedbfetch | Generate server cache file for Dbfetch/WSDbfetch data sources |
    | cacheebeyesearch | Generate server cache file for EB-eye search domains |
    | cacheensembl | Generate server cache file for an Ensembl server |
    | cai | Calculate codon adaptation index |
    | chaos | Draw a chaos game representation plot for a nucleotide sequence |
    | charge | Draw a protein charge plot |
    | checktrans | Report STOP codons and ORF statistics of a protein |
    | chips | Calculate Nc codon usage statistic |
    | cirdna | Draw circular map of DNA constructs |
    | codcmp | Codon usage table comparison |
    | codcopy | Copy and reformat a codon usage table |
    | coderet | Extract CDS, mRNA and translations from feature tables |
    | compseq | Calculate the composition of unique words in sequences |
    | cons | Create a consensus sequence from a multiple alignment |
    | consambig | Create an ambiguous consensus sequence from a multiple alignment |
    | cpgplot | Identify and plot CpG islands in nucleotide sequence(s) |
    | cpgreport | Identify and report CpG-rich regions in nucleotide sequence(s) |
    | cusp | Create a codon usage table from nucleotide sequence(s) |
    | cutgextract | Extract codon usage tables from CUTG database |
    | cutseq | Remove a section from a sequence |
    | dan | Calculate nucleic acid melting temperature |
    | dbiblast | Index a BLAST database |
    | dbifasta | Index a fasta file database |
    | dbiflat | Index a flat file database |
    | dbigcg | Index a GCG formatted database |
    | dbtell | Display information about a public database |
    | dbxcompress | Compress an uncompressed dbx index |
    | dbxedam | Index the EDAM ontology using b+tree indices |
    | dbxfasta | Index a fasta file database using b+tree indices |
    | dbxflat | Index a flat file database using b+tree indices |
    | dbxgcg | Index a GCG formatted database using b+tree indices |
    | dbxobo | Index an obo ontology using b+tree indices |
    | dbxreport | Validate index and report internals for dbx databases |
    | dbxresource | Index a data resource catalogue using b+tree indices |
    | dbxstat | Dump statistics for dbx databases |
    | dbxtax | Index NCBI taxonomy using b+tree indices |
    | dbxuncompress | Uncompress a compressed dbx index |
    | degapseq | Remove non-alphabetic (e.g. gap) characters from sequences |
    | density | Draw a nucleic acid density plot |
    | descseq | Alter the name or description of a sequence |
    | diffseq | Compare and report features of two similar sequences |
    | distmat | Create a distance matrix from a multiple sequence alignment |
    | dotmatcher | Draw a threshold dotplot of two sequences |
    | dotpath | Draw a non-overlapping wordmatch dotplot of two sequences |
    | dottup | Display a wordmatch dotplot of two sequences |
    | dreg | Regular expression search of nucleotide sequence(s) |
    | drfinddata | Find public databases by data type |
    | drfindformat | Find public databases by format |
    | drfindid | Find public databases by identifier |
    | drfindresource | Find public databases by resource |
    | drget | Get data resource entries |
    | drtext | Get data resource entries complete text |
    | edamdef | Find EDAM ontology terms by definition |
    | edamhasinput | Find EDAM ontology terms by has_input relation |
    | edamhasoutput | Find EDAM ontology terms by has_output relation |
    | edamisformat | Find EDAM ontology terms by is_format_of relation |
    | edamisid | Find EDAM ontology terms by is_identifier_of relation |
    | edamname | Find EDAM ontology terms by name |
    | edialign | Local multiple alignment of sequences |
    | einverted | Find inverted repeats in nucleotide sequences |
    | embossdata | Find and retrieve EMBOSS data files |
    | embossupdate | Checks for more recent updates to EMBOSS |
    | embossversion | Report the current EMBOSS version number |
    | emma | Multiple sequence alignment (ClustalW wrapper) |
    | emowse | Search protein sequences by digest fragment molecular weight |
    | entret | Retrieve sequence entries from flatfile databases and files |
    | epestfind | Find PEST motifs as potential proteolytic cleavage sites |
    | eprimer3 | Pick PCR primers and hybridization oligos |
    | eprimer32 | Pick PCR primers and hybridization oligos |
    | equicktandem | Find tandem repeats in nucleotide sequences |
    | est2genome | Align EST sequences to genomic DNA sequence |
    | etandem | Find tandem repeats in a nucleotide sequence |
    | extractalign | Extract regions from a sequence alignment |
    | extractfeat | Extract features from sequence(s) |
    | extractseq | Extract regions from a sequence |
    | featcopy | Read and write a feature table |
    | featmerge | Merge two overlapping feature tables |
    | featreport | Read and write a feature table |
    | feattext | Return a feature table original text |
    | findkm | Calculate and plot enzyme reaction data |
    | freak | Generate residue/base frequency table or plot |
    | fuzznuc | Search for patterns in nucleotide sequences |
    | fuzzpro | Search for patterns in protein sequences |
    | fuzztran | Search for patterns in protein sequences (translated) |
    | garnier | Predict protein secondary structure using GOR method |
    | geecee | Calculate fractional GC content of nucleic acid sequences |
    | getorf | Find and extract open reading frames (ORFs) |
    | godef | Find GO ontology terms by definition |
    | goname | Find GO ontology terms by name |
    | helixturnhelix | Identify nucleic acid-binding motifs in protein sequences |
    | hmoment | Calculate and plot hydrophobic moment for protein sequence(s) |
    | iep | Calculate the isoelectric point of proteins |
    | infoalign | Display basic information about a multiple sequence alignment |
    | infoassembly | Display information about assemblies |
    | infobase | Return information on a given nucleotide base |
    | inforesidue | Return information on a given amino acid residue |
    | infoseq | Display basic information about sequences |
    | isochore | Plot isochores in DNA sequences |
    | jaspextract | Extract data from JASPAR |
    | jaspscan | Scan DNA sequences for transcription factors |
    | lindna | Draw linear maps of DNA constructs |
    | listor | Write a list file of the logical OR of two sets of sequences |
    | makenucseq | Create random nucleotide sequences |
    | makeprotseq | Create random protein sequences |
    | marscan | Find matrix/scaffold recognition (MRS) signatures in DNA sequences |
    | maskambignuc | Mask all ambiguity characters in nucleotide sequences with N |
    | maskambigprot | Mask all ambiguity characters in protein sequences with X |
    | maskfeat | Write a sequence with masked features |
    | maskseq | Write a sequence with masked regions |
    | matcher | Waterman-Eggert local alignment of two sequences |
    | megamerger | Merge two large overlapping DNA sequences |
    | merger | Merge two overlapping sequences |
    | msbar | Mutate a sequence |
    | mwcontam | Find weights common to multiple molecular weights files |
    | mwfilter | Filter noisy data from molecular weights file |
    | needle | Needleman-Wunsch global alignment of two sequences |
    | needleall | Many-to-many pairwise alignments of two sequence sets |
    | newcpgreport | Identify CpG islands in nucleotide sequence(s) |
    | newcpgseek | Identify and report CpG-rich regions in nucleotide sequence(s) |
    | newseq | Create a sequence file from a typed-in sequence |
    | nohtml | Remove mark-up (e.g. HTML tags) from an ASCII text file |
    | noreturn | Remove carriage return from ASCII files |
    | nospace | Remove whitespace from an ASCII text file |
    | notab | Replace tabs with spaces in an ASCII text file |
    | notseq | Write to file a subset of an input stream of sequences |
    | nthseq | Write to file a single sequence from an input stream of sequences |
    | nthseqset | Read and write (return) one set of sequences from many |
    | octanol | Draw a White-Wimley protein hydropathy plot |
    | oddcomp | Identify proteins with specified sequence word composition |
    | ontocount | Count ontology term(s) |
    | ontoget | Get ontology term(s) |
    | ontogetcommon | Get common ancestor for terms |
    | ontogetdown | Get ontology term(s) by parent id |
    | ontogetobsolete | Get ontology ontology terms |
    | ontogetroot | Get ontology root terms by child identifier |
    | ontogetsibs | Get ontology term(s) by id with common parent |
    | ontogetup | Get ontology term(s) by id of child |
    | ontoisobsolete | Report whether an ontology term id is obsolete |
    | ontotext | Get ontology term(s) original full text |
    | palindrome | Find inverted repeats in nucleotide sequence(s) |
    | pasteseq | Insert one sequence into another |
    | patmatdb | Search protein sequences with a sequence motif |
    | patmatmotifs | Scan a protein sequence with motifs from the PROSITE database |
    | pepcoil | Predict coiled coil regions in protein sequences |
    | pepdigest | Report on protein proteolytic enzyme or reagent cleavage sites |
    | pepinfo | Plot amino acid properties of a protein sequence in parallel |
    | pepnet | Draw a helical net for a protein sequence |
    | pepstats | Calculate statistics of protein properties |
    | pepwheel | Draw a helical wheel diagram for a protein sequence |
    | pepwindow | Draw a hydropathy plot for a protein sequence |
    | pepwindowall | Draw Kyte-Doolittle hydropathy plot for a protein alignment |
    | plotcon | Plot conservation of a sequence alignment |
    | plotorf | Plot potential open reading frames in a nucleotide sequence |
    | polydot | Draw dotplots for all-against-all comparison of a sequence set |
    | preg | Regular expression search of protein sequence(s) |
    | prettyplot | Draw a sequence alignment with pretty formatting |
    | prettyseq | Write a nucleotide sequence and its translation to file |
    | primersearch | Search DNA sequences for matches with primer pairs |
    | printsextract | Extract data from PRINTS database for use by pscan |
    | profit | Scan one or more sequences with a simple frequency matrix |
    | prophecy | Create frequency matrix or profile from a multiple alignment |
    | prophet | Scan one or more sequences with a Gribskov or Henikoff profile |
    | prosextract | Process the PROSITE motif database for use by patmatmotifs |
    | pscan | Scan protein sequence(s) with fingerprints from the PRINTS database |
    | psiphi | Calculates phi and psi torsion angles from protein coordinates |
    | rebaseextract | Process the REBASE database for use by restriction enzyme applications |
    | recoder | Find restriction sites to remove (mutate) with no translation change |
    | redata | Retrieve information from REBASE restriction enzyme database |
    | refseqget | Get reference sequence |
    | remap | Display restriction enzyme binding sites in a nucleotide sequence |
    | restover | Find restriction enzymes producing a specific overhang |
    | restrict | Report restriction enzyme cleavage sites in a nucleotide sequence |
    | revseq | Reverse and complement a nucleotide sequence |
    | seealso | Find programs with similar function to a specified program |
    | seqcount | Read and count sequences |
    | seqmatchall | All-against-all word comparison of a sequence set |
    | seqret | Read and write (return) sequences |
    | seqretsetall | Read and write (return) many sets of sequences |
    | seqretsplit | Read sequences and write them to individual files |
    | seqxref | Retrieve all database cross-references for a sequence entry |
    | seqxrefget | Retrieve all cross-referenced data for a sequence entry |
    | servertell | Display information about a public server |
    | showalign | Display a multiple sequence alignment in pretty format |
    | showdb | Display information on configured databases |
    | showfeat | Display features of a sequence in pretty format |
    | showorf | Display a nucleotide sequence and translation in pretty format |
    | showpep | Display protein sequences with features in pretty format |
    | showseq | Display sequences with features in pretty format |
    | showserver | Display information on configured servers |
    | shuffleseq | Shuffle a set of sequences maintaining composition |
    | sigcleave | Report on signal cleavage sites in a protein sequence |
    | silent | Find restriction sites to insert (mutate) with no translation change |
    | sirna | Find siRNA duplexes in mRNA |
    | sixpack | Display a DNA sequence with 6-frame translation and ORFs |
    | sizeseq | Sort sequences by size |
    | skipredundant | Remove redundant sequences from an input set |
    | skipseq | Read and write (return) sequences, skipping first few |
    | splitsource | Split sequence(s) into original source sequences |
    | splitter | Split sequence(s) into smaller sequences |
    | stretcher | Needleman-Wunsch rapid global alignment of two sequences |
    | stssearch | Search a DNA database for matches with a set of STS primers |
    | supermatcher | Calculate approximate local pair-wise alignments of larger sequences |
    | syco | Draw synonymous codon usage statistic plot for a nucleotide sequence |
    | taxget | Get taxon(s) |
    | taxgetdown | Get descendants of taxon(s) |
    | taxgetrank | Get parents of taxon(s) |
    | taxgetspecies | Get all species under taxon(s) |
    | taxgetup | Get parents of taxon(s) |
    | tcode | Identify protein-coding regions using Fickett TESTCODE statistic |
    | textget | Get text data entries |
    | textsearch | Search the textual description of sequence(s) |
    | tfextract | Process TRANSFAC transcription factor database for use by tfscan |
    | tfm | Display full documentation for an application |
    | tfscan | Identify transcription factor binding sites in DNA sequences |
    | tmap | Predict and plot transmembrane segments in protein sequences |
    | tranalign | Generate an alignment of nucleic coding regions from aligned proteins |
    | transeq | Translate nucleic acid sequences |
    | trimest | Remove poly-A tails from nucleotide sequences |
    | trimseq | Remove unwanted characters from start and end of sequence(s) |
    | trimspace | Remove extra whitespace from an ASCII text file |
    | twofeat | Find neighbouring pairs of features in sequence(s) |
    | union | Concatenate multiple sequences into a single sequence |
    | urlget | Get URLs of data resources |
    | variationget | Get sequence variations |
    | vectorstrip | Remove vectors from the ends of nucleotide sequence(s) |
    | water | Smith-Waterman local alignment of sequences |
    | whichdb | Search all sequence databases for an entry and retrieve it |
    | wobble | Plot third base position variability in a nucleotide sequence |
    | wordcount | Count and extract unique words in molecular sequence(s) |
    | wordfinder | Match large sequences against one or more other sequences |
    | wordmatch | Find regions of identity (exact matches) of two sequences |
    | wossdata | Find programs by EDAM data |
    | wossinput | Find programs by EDAM input data |
    | wossname | Find programs by keywords in their short description |
    | wossoperation | Find programs by EDAM operation |
    | wossoutput | Find programs by EDAM output data |
    | wossparam | Find programs by EDAM parameter |
    | wosstopic | Find programs by EDAM topic |
    | yank | Add a sequence reference (a full USA) to a list file |

Como mencionamos antes es posible hacer bioinformática sin usar EMBOSS, ya sea porque queremos controlar hasta el último detalle que hace nuestro programa, porque queremos agregar alguna opción que EMBOSS no tiene, o simplemente porque era una tarea simple y no queríamos aprender a usar un programa de EMBOSS para hacerla. Son todas razones válidas. Lo que queremos que se lleven hoy es que EMBOSS existe y que puede hacer algunas tareas que les van a resultar útiles en el día a día de hacer bioinformática.

## **Aplicaciones en Biotecnología**

En el TP de hoy vamos a familiarizarnos con EMBOSS y algunas herramientas del paquete, aplicándolas al diseño de una estrategia de clonado, puntualmente para diseñar/optimizar proteínas para expresión recombinante heteróloga.

En los últimos años se ha simplificado considerablemente la ejecución del proceso de clonado/expresión. Esto se debe a la aparición de múltiples herramientas de Ingenieria Genética y a la posibilidad de sintetizar largas secuencias de ácidos nucleicos *in vitro*, lo que quita el peso de levantar un gen de interés o el riesgo de meter errores durante la PCR que ejecutamos para hacerlo. Para este TP consideraremos que hay una promoción de ADN sintético que hace que tenga un descuento del 90%, por lo que podemos no preocuparnos por los costos.

Una de las industrias biotecnológicas más antigua es la industria alimenticia. Centenas de microorganismos distintos y decenas de enzimas son utilizados en esta industria para distintos procesos. Algunos de estos procesos son muy complejos, como la fermentación de un buen vino (y de uno malo también), mientras que otros son simples y puntuales, como la degradación de lactosa en productos lácteos para intolerantes a este azúcar. Los procesos enzimáticos simples pueden resolverse fácilmente mediante la producción de la enzima de interés en forma heteróloga.

Con el fin de dar rienda suelta a nuestro emprendedor interior, montaremos las bases de una empresa biotecnológica: vamos a producir enzimas. La primera enzima que queremos producir es la **VpVan**, la cual es la encargada de convertir el ácido ferúlico en **vanillina**. La **vainillina** es un compuesto de alto interés económico debido a su uso como saborizante (a que no adivinan que sabor tiene).

<figure markdown>
![Vainillina](img/vainilina_new_version.png){ width="800" }
</figure>

### Archivos FASTA

Esta enzima ha sido aislada (y secuenciada) a partir de *Vanilla planifolia*. Encontrarán la secuencia correspondiente entre sus materiales de trabajo (**VpVAN.fasta**) y más información sobre el descubrimiento en este [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4083428/).

Por si no lo saben o no lo recuerdan, el formato **FASTA** es la forma más usada para trabajar secuencias biológicas (ADN, ARN, aminoácidos) en forma digital. Son archivos de texto plano, donde se asume un formato muy sencillo de interpretar para el ojo humano:

<figure markdown>
![FASTA](img/fasta.png)
</figure>

Un archivo FASTA tiene dos elementos importantes:

* **Header**: Está indicado con un **>** . Es la línea con el nombre o identificador de la secuencia. Puede contener información adicional como alguna descripción extra sobre la secuencia, tal como las condiciones en que fue obtenida u otra descripción opcional.
* **Secuencia**: El resto de las líneas que continúan contienen la secuencia propiamente dicha. El largo de cada fila de la secuencia no significa nada; una secuencia de 800 aminoácidos puede ser escrita en una sola línea de 800 aminoácidos o en 10 líneas de 80 aminoácidos cada una. La secuencia sigue hasta el próximo **>** o hasta el final del archivo, lo que pase primero.

!!! info
    
    Cuando un FASTA tiene más de una secuencia se lo denomina **multiFASTA**. En los archivos multiFASTA cada secuencia tiene su header y su secuencia propiamente dicha.

### Repaso biológico

Nuestro objetivo en esta guia va a ser diseñar una secuencia de ADN sintético que:

* Exprese VpVan
* Tenga sitios de corte para enzimas de restricción para que pueda ser insertado en un plásmido o vector de expresión de un organismo huesped. En este caso, dichos sitios de corte van a pertenecer a diferentes enzimas de restricción para facilitar la inserción del gen en el sentido correcto
* Marque a VpVan de alguna forma para facilitar su posterior purificación

A continuación vamos a dar una versión **super** resumida de los conceptos anteriores. Si ya saben como funciona todo lo mencionado pueden ir a la próxima sección (**Bases del experimento**).

#### Plásmidos

Los plásmidos son moléculas de ADN de forma circular presentes principalmente en bacterias, arqueas y levaduras. Estas moléculas se encuentran fuera de los cromosomas y se replican de manera autónoma. 

Debido a estas características, es posible generar plásmidos artificiales con el objetivo de amplificar (*vector de clonacion*) o de expresar (*vector de expresion*) un gen de interes. Esto generalmente se realiza cuando la expresión de dicho gen en su organismo original no es factible, ya sea por problemas de volumen, logística o ética.

Los principales componentes de vector de expresion son:

<figure markdown>
![FASTA](img/plasmidos.png)
</figure>

* **Origen de la replicacion:** punto inicial para la replicación del plásmido
* **Gen de resistencia a antibioticos:** gen que se expresa y da resistencia al organismo huesped, permite quedarnos solo con los organismos que tienen el plásmido dentro de ellos
* **Promotor:** controla la transcripción de una determinada secuencia (en este caso el gen insertado)
* **Sitio de restricción:** secuencia que es cortada por una enzima de restricción y donde será insertado el gen de interés (más de esto a continuación)

#### Enzimas de Restricción

Las enzimas de restricción son proteínas que reconocen una secuencia específica de nucleótidos dentro de una molécula de ADN y cortan el ADN en ese punto en concreto o en un punto cercano. A esas secuencias de ADN se las denomina sitios de restricción y tienen entre cuatro a seis pares de bases.

Hay dos grandes grupos de enzimas de restricción, aquellas que dejan extremos romos y aquellas que dejan extremos cohesivos:

<figure markdown>
![Enzimas de restricción](img/restri_enzymes.png){ width="600" }
</figure>

En general al momento de insertar genes en plásmidos se usan enzimas de restricción que dejan extremos cohesivos ya que facilitan la inserción del gen.

La idea detrás de su uso es colocar un sitio de restricción en el plásmido y colocar el mismo sitio de restricción a cada lado del gen de interés (en el ADN que uno sintetiza). Luego los plásmidos vacios se colocan en una solución con el ADN sintético y se les agrega la enzima de restricción correspondiente que va a cortar el ADN dejando los extremos cohesivos en cada sitio de restricción. 

<figure markdown>
![Agregar un gen](img/agregar_gen_2.png){ width="600" }
</figure>

Como el sitio de restricción es el mismo en el plástido y en la secuencia de ADN, es posible entonces que el ADN sintético se inserté en el plásmido, ya sea espontaneamente o ayudado por una ligasa. [Esta página](https://www.khanacademy.org/science/biology/biotech-dna-technology/dna-cloning-tutorial/a/restriction-enzymes-dna-ligase) tiene muy buenos esquemas sobre el proceso.

En el experimento anterior, luego de cortar el sitio de restricción con la enzima, pueden pasar tres cosas: 

* El plásmido se vuelve a cerrar sin ningun inserto :fontawesome-solid-xmark:{ .red_icon }
* Se inserta el gen de interés en la dirección correcta (respecto al promotor en el plásmido) :fontawesome-solid-check:{ .green_icon }
* Se inserta el gen de interés en la dirección contraria (respecto al promotor en el plásmido) :fontawesome-solid-xmark:{ .red_icon }

 Es posible evitar el caso donde el gen se inserta en la dirección contraria combinando 2 enzimas de restricción diferentes, donde ahora va a haber 2 sitios de restricción en el plásmido (uno para cada enzima) y los dos sitios de restricción en el ADN sintético van a ser diferentes (uno para cada enzima, en el mismo orden que en el plásmido). Si bien en esta versión no es posible que el gen sea insertado en la dirección contraria, sí es posible que se vuelva a insertar el fragmento de plásmido entre los sitios de restricción, pero hay formas de controlar estos casos. Cuando usamos 2 enzimas de reestricción en esta forma decimos que estamos "clonando en forma direccional".

!!! danger

    Es importante cuando se usan enzimas de restricción asegurarse que no haya ningún sitio de corte para las enzimas elegidas en el plásmido ni en el ADN sintético fuera de los sitios involucrados en el proceso de inserción (ya que de existir también serán cortados y la inserción fracasará).

#### Purificación y Tags

Una vez que nuestros organismos huesped tienen el vector de expresión con el gen de interés se los deja crecer, reproducirse y expresar la proteína de interés en grandes cantidades. Una vez hecho esto, es necesario extraer esa proteína de la solución, lo que no es trivial.

Hay varias formas de purificar proteínas, y una de ellas es la cromatografía por afinidad, la cual se basa en la unión reversible entre el analito de interés (en nuestro caso la *VpVan*) y un ligando específico, inmovilizado en un soporte sólido inerte. Cuando la muestra pasa por la columna, sólo son retenidas las moléculas que se unen de manera selectiva al ligando por afinidad y las que no se unen avanzan con la fase móvil. La figura a continuación muestra un ejemplo donde se usan anticuerpos inmovilizados en una columna para purificar la proteína roja del resto de la solución:

<figure markdown>
![Agregar un gen](img/cromatografia_afinidad.jpg){ width="400" }
</figure>

Uno podría asumir entonces que para poder construir estas columnas es necesario conseguir un ligando que reconozca a nuestra proteína de interes. Si bien esto es teóricamente cierto, como nosotros estamos sintetizando el ADN desde cero podemos pensar lateralmente y agregarle a nuestra proteína una secuencía aminoacídica en uno de sus extremos para la cual ya conozcamos ligandos. Estas secuencias pueden ser desde pocos aminoacidos a proteínas pequeñas y son denominadas **tags**.

### Bases del experimento

Volviendo a nuestro experimento, queremos insertar el gen de *VpVan* en un vector de expresión. Nuestro **organismo huesped** es:

* E. coli BL21

Como queremos clonar en forma direccional tenemos que usar dos **enzimas de restricción**. Ellas son:

* BamHI
* HindIII

Al momento de purificar necesitamos agregarle un **tag** a la proteína. Vamos a probar 3 tags diferentes:

* His-tag
* MBP-tag
* FLAG-tag

Por cuestiones de practicidad, todos los tags van a estar en el C-terminal.

!!! danger "TO DO"

    arreglar la lista siguiente con lo que hace cada ej

En los siguientes ejercicios vamos a:

* Generar secuencia de aminoácidos VpVAN-Tag para cada tag de interés.
* Obtener las secuencias codificantes del organismo de interés y generar tabla de uso de codones para el organismo de interés.
* Generar la secuencia nucleotídica VpVAN-tag con los codones optimizados para el organismo de interés.
* Verificar que no hayan quedado sitios de restricción propios de la estrategia de clonado DENTRO de la secuecnia VpVAN-tag optimizada.

## Ejercicio 1. Secuencias aminoacídicas VpVan-Tag

Vamos a generar las secuencias de aminoácidos quiméricas VpVan-Tag (donde Tag = His/MBP/FLAG). Para esto van a necesitar los siguientes archivos que se encuentras en sus materiales de trabajo:

* VpVan.fasta
* His-tag.fasta
* MBP-tag.fasta
* FLAG-tag.fasta

Es altamente recomendado que creen diferentes carpetas para los diferentes TPs y en algunos casos para los diferentes ejercicios. El nombre y la ubicación lo pueden decidir ustedes, pero un ejemplo para este ejercicio seria **\~/Documentos/TP_02/EJ_1** (recuerden que es preferible no usar espacios al crear directorios). Una vez creada la carpeta para este ejercicio, muevan los cuatro archivos anteriores a dicha carpeta.

Nuestro objetivo ahora es crear 3 archivos FASTA nuevos que contengan las diferentes construcciones (*VpVan* + cada uno de los tags). Para que sea fácil saber lo que contienen estos archivos vamos a llamarlos **VpVan_con_tag-HIS.fasta** y similar (reemplazando el nombre del tag en cada caso).

Ahora bien, como son solo 3 tags esto se puede hacer a mano copiando y pegando, pero es un buen momento para profundizar en dos conceptos que aprendimos la clase pasada: *scripts* y *ciclos*.

Creen un archivo vacio de texto en esa carpeta y llamenló **agregar_tags.sh**. Dentró del archivo pongan lo siguiente:

!!! danger "TO DO"

    Seguir de aca, ver FOR, ver corriendo en la otra PC como funca

```
# Acá va una propuesta. Pueden pensar en alguna alternativa, si quieren.

for TAG in `ls *-tag.fasta`; # Por cada archivo Fasta de tag disponible... 

do 
   vpvanseq=`cat VpVAN.fasta | grep -v ">"`; # leer el archivo VpVAN y quitarle el header (>), guardarlo en una variable (1)
   tagseq=`cat $TAG | grep -v ">"`; # leer cada archivo tag y quitarle el header (>), guardarlo en otra variable (2)
   printf ">VpVAN-$TAG\n$vpvanseq$tagseq" > VpVAN-$TAG; # imprimir y guardar en un archivo separado para cada tag (3)
done;
```

Para entender en detalle que hace todo este script de **BASH** vamos a dedicarle unos minutos:

!!! danger "TO DO"

    Aca esta toda la explicacion del FOR, ver que poner considerando el TP 1

### Entrada en calor con EMBOSS

Para familiarizarnos con EMBOSS, comencemos por buscar qué herramientas vamos a usar durante el TP.

Si emboss-doc está instalado, se puede ver la documentación de los paquetes en la línea de comando. Ya sabemos que vamos a estar optimizando codones para algún organismo así que arranquemos por ahí:

Para buscar comandos que hacen cosas, se usa wossname con palabras clave (en inglés, ej: ‘codon’). El comando wossname nos da una lista de comandos asociados con esas palabras clave y lo que hace cada programa.

## Bibliografía


https://www.khanacademy.org/science/biology/biotech-dna-technology/dna-cloning-tutorial/a/restriction-enzymes-dna-ligase

https://cienciadelux.com/2015/08/16/cromatografia-por-afinidad/