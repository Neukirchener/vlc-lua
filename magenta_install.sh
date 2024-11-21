#!/bin/bash

# Variablen definieren
VLC_EXT_DIR="$HOME/.local/share/vlc/lua/extensions"
SCRIPT_NAME="magenta.lua"
REPO_URL="hhttps://github.com/Neukirchener/vlc-lua/blob/3d2cbb474b8d08d1a4d8a80ea9dd1d20b81b5c61/lua/$SCRIPT_NAME"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$VLC_EXT_DIR"

# Skript herunterladen und verschieben
curl -o "$SCRIPT_NAME" "$REPO_URL" && \
mv "$SCRIPT_NAME" "$VLC_EXT_DIR"
