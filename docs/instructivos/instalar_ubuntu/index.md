# Instructivo: Instalar Bash en Windows con WSL

Windows Subsystem for Linux (WSL) te permite ejecutar una terminal de Linux (Bash) directamente en Windows, sin necesidad de máquinas virtuales ni arranque dual. Es la forma más sencilla de tener un entorno Bash para bioinformática en Windows.

---

## Instalación rápida

### Paso 1: Abrir PowerShell como administrador

1. Buscá PowerShell en el menú Inicio.
2. Hacé clic derecho y seleccioná "Ejecutar como administrador".

### Paso 2: Ejecutar el comando de instalación

En la ventana de PowerShell, escribí:

    wsl --install

Este comando hace todo automáticamente:
- Habilita los componentes necesarios (WSL y Plataforma de máquina virtual)
- Descarga e instala el kernel de Linux más reciente
- Establece WSL 2 como versión predeterminada
- Descarga e instala Ubuntu (la distribución de Linux por defecto)

### Paso 3: Reiniciar la computadora

Cuando finalice la instalación, reiniciá tu PC si el sistema lo solicita.

---

## Configuración inicial de Ubuntu

### Paso 1: Abrir Ubuntu

Buscá Ubuntu en el menú Inicio y abrila.

### Paso 2: Crear usuario y contraseña

La primera vez que abras Ubuntu, te pedirá que crees:
- Un nombre de usuario para Linux (puede ser distinto al de Windows)
- Una contraseña

Importante: al escribir la contraseña, no se verá nada en pantalla (escritura ciega). Es normal.

### Paso 3: Actualizar Ubuntu

Una vez dentro, ejecutá:

    sudo apt update && sudo apt upgrade -y

Esto actualiza todos los paquetes del sistema.

---

## Instalación de herramientas esenciales para bioinformática

Dentro de Ubuntu, instalá las herramientas básicas:

    sudo apt install -y curl git wget nano

Para EMBOSS:

    sudo apt install -y emboss

---

## Solución de problemas comunes

| Problema | Solución |
|----------|----------|
| wsl --install no funciona | Verificá que tu Windows esté actualizado (versión 2004 o superior) |
| Error de virtualización | Activá la virtualización en la BIOS/UEFI de tu PC |
| No se ve la contraseña al escribir | Es normal, es una medida de seguridad |
| WSL no arranca | Ejecutá wsl --shutdown y volvé a abrir Ubuntu |
| Error al instalar una distribución | Probá con wsl --install -d Ubuntu o instalá desde la Microsoft Store |

---

## Recomendaciones finales

- Recomendamos instalar Visual Studio Code con la extensión WSL para editar y ejecutar código dentro del entorno Linux.

¡Listo! Ya tenés un entorno Bash completo en tu Windows para empezar a trabajar.