#!/bin/bash

# URL do repositório do GitHub onde o arquivo .ZIP está hospedado
GITHUB_URL="https://github.com/jfelipesouza/install-font-in-ubutu/raw/main/JetBrainsMono-2.304.zip"

# Diretório onde as fontes serão instaladas
FONT_DIR="/usr/share/fonts/truetype/jetbrainsmono"

# Caminho temporário para o arquivo baixado
TMP_ZIP_PATH="/tmp/jetbrainsmono.zip"

# Cria o diretório de fontes, caso não exista
echo "Criando diretório $FONT_DIR..."
sudo mkdir -p "$FONT_DIR"

# Baixa o arquivo .ZIP com as fontes
echo "Baixando JetBrains Mono do GitHub..."
wget -O "$TMP_ZIP_PATH" "$GITHUB_URL"

# Descompacta o arquivo
echo "Descompactando o arquivo..."
sudo unzip -o "$TMP_ZIP_PATH" -d "$FONT_DIR"

# Atualiza o cache de fontes do sistema
echo "Atualizando cache de fontes..."
sudo fc-cache -fv

# Limpeza (remove o arquivo .ZIP temporário)
echo "Limpando arquivos temporários..."
rm "$TMP_ZIP_PATH"

# Mensagem final
echo "Fonte JetBrains Mono instalada com sucesso!"