#!/bin/bash

# Variablen definieren
VLC_EXT_DIR="$HOME/.local/share/vlc/lua/extensions"
SCRIPT_NAME="vodafone.lua"
REPO_URL="https://github.com/Neukirchener/vlc-lua/blob/b2b9366311142a3a3a593afd79460f82d4ed0081/lua/vodafone.lua/$SCRIPT_NAME"

# Verzeichnis erstellen, falls nicht vorhanden
mkdir -p "$VLC_EXT_DIR"

# Skript herunterladen und verschieben
curl -o "$SCRIPT_NAME" "$REPO_URL" && \
mv "$SCRIPT_NAME" "$VLC_EXT_DIR"
