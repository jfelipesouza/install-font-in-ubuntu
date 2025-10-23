#!/bin/bash

# Caminho local e remoto do pacote de fontes
LOCAL_ZIP_PATH="./Fira_Code_v6.2.zip"
GITHUB_URL="https://github.com/jfelipesouza/install-font-in-ubuntu/raw/main/Fira_Code_v6.2.zip"

# Diretório de instalação local do usuário
FONT_DIR="$HOME/.local/share/fonts/FiraCode"

# Caminho temporário (caso precise baixar)
TMP_ZIP_PATH="/tmp/firacode.zip"

echo "Criando diretório local de fontes..."
mkdir -p "$FONT_DIR"

# Verifica se o arquivo existe localmente
if [ -f "$LOCAL_ZIP_PATH" ]; then
    echo "📦 Arquivo local encontrado: $LOCAL_ZIP_PATH"
    ZIP_SOURCE="$LOCAL_ZIP_PATH"
else
    echo "🌐 Arquivo local não encontrado. Baixando do GitHub..."
    wget -O "$TMP_ZIP_PATH" "$GITHUB_URL"
    ZIP_SOURCE="$TMP_ZIP_PATH"
fi

echo "📂 Extraindo fontes para $FONT_DIR..."
unzip -o "$ZIP_SOURCE" -d "$FONT_DIR"

echo "🔄 Atualizando cache de fontes..."
fc-cache -fv "$FONT_DIR"

# Remove o arquivo temporário, se foi baixado
if [ "$ZIP_SOURCE" == "$TMP_ZIP_PATH" ]; then
    echo "🧹 Limpando arquivo temporário..."
    rm "$TMP_ZIP_PATH"
fi

echo "✅ Fonte Fira Code instalada com sucesso em $FONT_DIR"
