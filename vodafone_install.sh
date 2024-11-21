#!/bin/bash

# Variablen definieren
VLC_EXT_DIR="$HOME/.local/share/vlc/lua/extensions"
SCRIPT_NAME="vodafone.lua"
REPO_URL="https://github.com/Neukirchener/vlc-lua/blob/70355e25e60328e4b5883e52b7a02a74aab36aad/lua/$SCRIPT_NAME"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$VLC_EXT_DIR"

# Skript herunterladen und verschieben
curl -o "$SCRIPT_NAME" "$REPO_URL" && \
mv "$SCRIPT_NAME" "$VLC_EXT_DIR"
