#!/usr/bin/env bash

set -e

FONT_DIR="$HOME/.local/share/fonts"
INSTALL_DIR="$(pwd)"

echo "🧩 Criando diretório de fontes em: $FONT_DIR"
mkdir -p "$FONT_DIR"

echo "📦 Extraindo arquivos ZIP..."
unzip -o "$INSTALL_DIR/Fira_Code_v6.2.zip" -d "$INSTALL_DIR/Fira_Code_v6.2"
unzip -o "$INSTALL_DIR/JetBrainsMono-2.304.zip" -d "$INSTALL_DIR/JetBrainsMono-2.304"

echo "📁 Copiando fontes para $FONT_DIR..."
find "$INSTALL_DIR/Fira_Code_v6.2" -name "*.ttf" -exec cp {} "$FONT_DIR" ;
find "$INSTALL_DIR/JetBrainsMono-2.304" -name "*.ttf" -exec cp {} "$FONT_DIR" ;

echo "🔄 Atualizando cache de fontes..."
fc-cache -fv > /dev/null

echo "✅ Instalação concluída!"
echo "As fontes Fira Code e JetBrains Mono estão prontas para uso."
