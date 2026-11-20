#!/data/data/com.termux/files/usr/bin/bash
set -eu

ROOT="$HOME/FoundryKin-Beta"
BRANCH="integration/android-termux-setup"
URL="https://github.com/jalbantonio-lbaj/FoundryKin-Beta.git"

if ! command -v git >/dev/null 2>&1 || ! command -v python >/dev/null 2>&1; then
  echo "Instalando Git y Python para Termux..."
  pkg install -y git python
fi

if [ -d "$ROOT/.git" ]; then
  echo "Repositorio existente: actualizando solo la rama $BRANCH"
  git -C "$ROOT" fetch origin "$BRANCH"
  git -C "$ROOT" checkout "$BRANCH"
  git -C "$ROOT" pull --ff-only origin "$BRANCH"
elif [ -e "$ROOT" ]; then
  echo "ERROR: $ROOT existe pero no es un repositorio Git. No se modificó."
  exit 1
else
  git clone --single-branch --branch "$BRANCH" "$URL" "$ROOT"
fi

echo
echo "FoundryKin listo en: $ROOT"
echo "Abre en el navegador del teléfono: http://127.0.0.1:8765/app.html"
echo "Mantén esta sesión de Termux abierta mientras uses FoundryKin."
echo "Para detener el servidor: Ctrl+C"
cd "$ROOT"
exec python -m http.server 8765 --bind 127.0.0.1
