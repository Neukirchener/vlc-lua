#!/bin/bash

# Variablen definieren
VLC_EXT_DIR="$HOME/.local/share/vlc/lua/extensions"
SCRIPT_NAME="magenta.lua"
REPO_URL="https://github.com/Neukirchener/vlc-lua/blob/01ceff25323c3c03efcd005ae4ec6c30e3a96a4b/lua/$SCRIPT_NAME"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$VLC_EXT_DIR"

# Skript herunterladen und verschieben
curl -o "$SCRIPT_NAME" "$REPO_URL" && \
mv "$SCRIPT_NAME" "$VLC_EXT_DIR"
