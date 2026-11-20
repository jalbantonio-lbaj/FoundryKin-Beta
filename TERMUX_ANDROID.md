# FoundryKin en Android / Termux

Esta rama añade una forma de ejecutar la copia del repositorio en Android sin instalar un APK ni publicar los archivos en un servidor externo.

## Inicio

En Termux:

```sh
pkg install -y git python
git clone --single-branch --branch integration/android-termux-setup https://github.com/jalbantonio-lbaj/FoundryKin-Beta.git
cd FoundryKin-Beta
bash termux-start.sh
```

Abre `http://127.0.0.1:8765/app.html` en el navegador del mismo teléfono. Mantén Termux abierto mientras trabajas. Detén el servidor con Ctrl+C.

## Datos y límites

- Los proyectos y paquetes se guardan en el almacenamiento local del navegador mediante localStorage; no existe sincronización en la nube.
- No uses modo incógnito ni borres los datos del sitio si quieres conservar los packs.
- Haz exportaciones periódicas desde FoundryKin. Los respaldos internos usan el mismo almacenamiento limitado del navegador y no sustituyen una copia externa.
- La vista 3D depende de WebGL y algunas funciones externas cargan bibliotecas desde CDN; por eso se necesita conexión a internet para esas partes.
- La persistencia, importación/exportación y WebGL deben probarse en el navegador Android antes de confiar en el editor con packs importantes.
- El servidor escucha solo en 127.0.0.1; no expone FoundryKin a la red local.

## Por qué se usa app.html

`app.html` es la interfaz principal descrita por el README. Carga el editor `index.html) dentro de su iframe y conserva los flujos de creación, importación, catálogo y exportación.
