#!/bin/bash

# URL do repositório do GitHub onde o arquivo ZIP está hospedado
GITHUB_URL="https://github.com/jfelipesouza/install-font-in-ubutu/raw/main/Fira_Code_v6.2.zip"

# Diretório onde as fontes serão instaladas
FONT_DIR="/usr/share/fonts/truetype/firacode"

# Cria o diretório de fontes, caso não exista
sudo mkdir -p $FONT_DIR

# Baixa o arquivo ZIP com as fontes
echo "Baixando FiraCode do GitHub..."
wget -O /tmp/firacode.zip $GITHUB_URL

# Descompacta o arquivo ZIP
echo "Descompactando o arquivo..."
sudo unzip -o /tmp/firacode.zip -d $FONT_DIR

# Atualiza o cache de fontes do sistema
echo "Atualizando cache de fontes..."
sudo fc-cache -fv

# Limpeza (remove o arquivo ZIP temporário)
echo "Limpando arquivos temporários..."
rm /tmp/firacode.zip

# Mensagem final
echo "FiraCode instalada com sucesso!"
