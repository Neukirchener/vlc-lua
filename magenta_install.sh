#!/bin/bash

# Variablen definieren
VLC_EXT_DIR="$HOME/.local/share/vlc/lua/extensions"
SCRIPT_NAME="magenta.lua"
REPO_URL="https://raw.githubusercontent.com/Neukirchener/vlc-lua/refs/heads/main/$SCRIPT_NAME"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$VLC_EXT_DIR"

# Skript herunterladen und verschieben
curl -o "$SCRIPT_NAME" "$REPO_URL" && \
mv "$SCRIPT_NAME" "$VLC_EXT_DIR"
