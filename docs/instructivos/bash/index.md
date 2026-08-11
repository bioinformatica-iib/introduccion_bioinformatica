# Instructivo rápido de Bash para bioinformática

## ¿Qué es Bash?

Bash (Bourne Again SHell) es el intérprete de comandos que usamos en la terminal de Linux/Ubuntu. Permite navegar por el sistema, manipular archivos, ejecutar programas y automatizar tareas mediante scripts. En bioinformática, es la herramienta fundamental para procesar datos, lanzar pipelines y manejar archivos de secuenciación.

---

## Comandos esenciales (tabla resumen)

| Comando | Qué hace | Ejemplo |
|---------|----------|---------|
| `pwd`   | Muestra la ruta del directorio actual | `pwd` → `/home/usuario/proyecto` |
| `ls`    | Lista el contenido de un directorio | `ls -lh` (detalles y tamaños legibles) |
| `cd`    | Cambia de directorio | `cd datos/` (entra a `datos`) ; `cd ..` (sube un nivel) |
| `mkdir` | Crea un nuevo directorio | `mkdir resultados` |
| `rmdir` | Elimina un directorio vacío | `rmdir carpeta_vacia` |
| `rm`    | Elimina archivos o directorios (con `-r`) | `rm archivo.txt` ; `rm -r carpeta/` |
| `cp`    | Copia archivos o directorios | `cp archivo.txt backup/` |
| `mv`    | Mueve o renombra archivos | `mv archivo.txt archivo_old.txt` |
| `head`  | Muestra las primeras líneas de un archivo | `head -n 20 secuencias.fasta` |
| `tail`  | Muestra las últimas líneas | `tail -n 5 log.txt` |
| `wc`    | Cuenta líneas, palabras o caracteres | `wc -l archivo.txt` (número de líneas) |
| `cat`   | Muestra el contenido completo de un archivo | `cat archivo.txt` |
| `less`  | Permite ver un archivo página por página | `less archivo.fasta` (navegar con flechas, `q` para salir) |
| `grep`  | Busca líneas que coinciden con un patrón | `grep "^>" secuencias.fasta` (cabeceras FASTA) |
| `wget`  | Descarga archivos desde una URL | `wget https://ejemplo.com/datos.zip` |
| `echo`  | Imprime texto en la terminal | `echo "Hola mundo"` |
| `awk`   | Procesa texto por columnas | `awk '{print $1}' archivo.tsv` (primera columna) |
| `gunzip`| Descomprime archivos `.gz` | `gunzip archivo.fasta.gz` |
| `zcat`  | Muestra el contenido de un `.gz` sin descomprimir | `zcat archivo.fasta.gz | head` |
| `chmod` | Cambia permisos de archivos | `chmod +x script.sh` (habilita ejecución) |
| `./`    | Ejecuta un script o programa en el directorio actual | `./script.sh` |
| `|`     | Tubería: envía la salida de un comando a otro | `grep "ERR" log.txt | wc -l` |
| `>`     | Redirige la salida a un archivo (sobrescribe) | `ls > lista.txt` |
| `>>`    | Redirige la salida a un archivo (agrega al final) | `echo "nuevo" >> lista.txt` |
| `*`     | Comodín que representa cualquier cadena | `ls *.fasta` (todos los FASTA) |

---

## Cómo ver los manuales de los comandos

En la terminal, todos los comandos tienen una ayuda integrada que explica su uso, opciones y ejemplos. Existen dos formas principales de consultarlos:

### 1. `man` (manual completo)

El comando `man` muestra la página de manual oficial del comando, con toda la documentación detallada.

    man nombre_del_comando

Ejemplos:

    man grep
    man ls
    man wget

- Navegación: flechas o teclas `AvPág` / `RePág`.
- Buscar: presionar `/` y escribir la palabra; `n` para siguiente coincidencia.
- Salir: presionar `q`.

**Nota:** Algunos comandos de EMBOSS tienen su propia página de manual accesible con `man` (por ejemplo, `man needle`).

### 2. `--help` o `-h` (ayuda resumida)

Muchos comandos ofrecen una ayuda más corta y rápida con las opciones principales. Es muy útil para recordar sintaxis sin leer el manual completo.

    comando --help
    # o
    comando -h

Ejemplos:

    grep --help
    wget -h
    needle -help   # comando de EMBOSS

### 3. `whatis` y `apropos` (búsqueda de comandos)

Si no recordás el nombre exacto de un comando, podés buscar por palabra clave:

- `whatis comando` → muestra una breve descripción del comando.
- `apropos palabra` → lista todos los comandos relacionados con esa palabra.

    whatis grep
    apropos alignment   # útil para encontrar herramientas de alineamiento

---

## Consejos prácticos para la terminal

- **Autocompletar** con la tecla `Tabulador` para escribir rutas largas sin errores.
- **Historial de comandos**: flecha arriba/abajo para recuperar comandos anteriores.
- **Copiar/pegar** en la terminal: `Ctrl+Shift+C` / `Ctrl+Shift+V` (no `Ctrl+C`, que interrumpe el proceso).
- **Combinar comandos con tuberías (`|`)** para filtros potentes. Ejemplo: `cat archivo.log | grep "ERROR" | wc -l` (cuenta cuántos errores hay).
- **Redirigir errores** con `2>`: `wget URL 2> errores.txt` guarda mensajes de error en un archivo.

---

## Errores frecuentes y cómo solucionarlos

| Error | Posible causa | Solución |
|-------|---------------|----------|
| `command not found` | El comando no está instalado o está mal escrito. | Verificá la ortografía o instalá el paquete necesario. |
| `No such file or directory` | La ruta o archivo no existe. | Usá `ls` y `pwd` para confirmar ubicación. |
| `Permission denied` | No tenés permisos para leer/ejecutar. | Usá `chmod +x` para scripts o `sudo` si es necesario (con cuidado). |
| `invalid option` | La opción que usaste no es válida. | Revisá `--help` o `man` para las opciones correctas. |
| Archivos con espacios en el nombre | El shell interpreta el espacio como separador. | Usá comillas: `cd "Mi Carpeta"` o escapa con `\`: `cd Mi\ Carpeta`. |

---

## Recomendaciones para bioinformática

- Antes de cualquier análisis, verificar con `pwd` que estás en el directorio correcto.
- Usar `ls -lh` para ver tamaños de archivos y fechas.
- Para archivos comprimidos `.gz`, usar `zcat` o `gunzip` según necesites.
- Siempre documentar los comandos utilizados (pueden guardarse en un script o en un archivo de registro).
- Leer el manual (`man`) o la ayuda (`--help`) de las herramientas antes de usarlas, especialmente para conocer los parámetros de ventana, umbral, matrices, etc.

¡Practicá con estos comandos y no dudes en consultar los manuales siempre que lo necesites!