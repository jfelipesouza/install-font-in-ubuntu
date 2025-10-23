#!/bin/bash

# ---
# Script de Instalação de Fontes
#
# Este script busca dinamicamente no repositório GitHub todos os
# scripts de instalação (padrão: install_*.sh) e os executa
# um por um.
# ---

# 1. Verifica se está sendo executado como root (sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de root."
  echo "Por favor, execute: sudo curl -sL [URL_DO_RAW] | sudo bash"
  echo "Ou, se baixado: sudo ./install.sh"
  exit 1
fi

# --- Configuração do Repositório ---
# (Baseado no seu contexto)
REPO_USER="jfelipesouza"
REPO_NAME="install-font-in-ubutu"
REPO_BRANCH="main"
# ------------------------------------

# URL base para baixar os arquivos "raw"
BASE_RAW_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$REPO_BRANCH"

# URL da API do GitHub para listar o conteúdo do diretório raiz
API_URL="https://api.github.com/repos/$REPO_USER/$REPO_NAME/contents/?ref=$REPO_BRANCH"

echo "Buscando lista de scripts de instalação no repositório..."

# Usamos curl para acessar a API, grep para achar as linhas com "name",
# e sed para extrair apenas o nome do arquivo que bate com o padrão.
SCRIPT_LIST=$(curl -s "$API_URL" | \
              grep '"name": "install_.*\.sh"' | \
              sed -n 's/.*"name": "\(install_.*\.sh\)".*/\1/p')

if [ -z "$SCRIPT_LIST" ]; then
    echo "Nenhum script de instalação (install_*.sh) foi encontrado no repositório."
    exit 1
fi

echo "Scripts encontrados:"
echo "$SCRIPT_LIST"
echo ""

# Cria um diretório temporário seguro para baixar e executar os scripts
TMP_DIR=$(mktemp -d)
if [ ! -d "$TMP_DIR" ]; then
    echo "Falha ao criar diretório temporário."
    exit 1
fi
cd "$TMP_DIR"

# Faz o loop em cada nome de script encontrado
for SCRIPT_NAME in $SCRIPT_LIST; do
    SCRIPT_URL="$BASE_RAW_URL/$SCRIPT_NAME"
    
    echo "=================================================="
    echo "Baixando e preparando: $SCRIPT_NAME"
    echo "=================================================="
    
    # Baixa o script
    curl -s -O "$SCRIPT_URL"
    
    if [ ! -f "$SCRIPT_NAME" ]; then
        echo "ERRO: Falha ao baixar $SCRIPT_NAME."
        echo "Pulando..."
        continue
    fi
    
    # Dá permissão de execução
    chmod +x "$SCRIPT_NAME"
    
    # Executa o script
    # (Já estamos como root, então os comandos 'sudo'
    # dentro dos scripts filhos funcionarão)
    echo "Executando $SCRIPT_NAME..."
    ./"$SCRIPT_NAME"
    
    echo "Execução de $SCRIPT_NAME concluída."
    echo ""
done

# Limpeza
echo "=================================================="
echo "Instalação concluída. Limpando arquivos temporários..."
cd /
rm -rf "$TMP_DIR"

echo "Todas as fontes foram instaladas!"