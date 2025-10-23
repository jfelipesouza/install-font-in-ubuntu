#!/bin/bash


# 1. Verifica se está sendo executado como root (sudo)
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de root."
  echo "Por favor, execute: sudo curl -sL [URL_DO_RAW] | sudo bash"
  echo "Ou, se baixado: sudo ./install.sh"
  exit 1
fi

# --- Configuração do Repositório ---
REPO_USER="jfelipesouza"
REPO_NAME="install-font-in-ubuntu"
REPO_BRANCH="main"
# ------------------------------------

# URL base para baixar os arquivos "raw"
BASE_RAW_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$REPO_BRANCH"

# --- Lista Explícita de Scripts ---
# Em vez de usar a API, definimos os scripts manualmente.
SCRIPT_LIST=(
    "install_firacode.sh"
    "install_jetbrains.sh"
)
# ----------------------------------

echo "Scripts a serem instalados:"
printf " - %s\n" "${SCRIPT_LIST[@]}"
echo ""

# Cria um diretório temporário seguro
TMP_DIR=$(mktemp -d)
if [ ! -d "$TMP_DIR" ]; then
    echo "Falha ao criar diretório temporário."
    exit 1
fi
cd "$TMP_DIR"

# Faz o loop em cada nome de script da lista
for SCRIPT_NAME in "${SCRIPT_LIST[@]}"; do
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

    # --- Verificação de Segurança ---
    # Verifica se o arquivo baixado é realmente um script bash,
    # e não um erro (como o 429 que você viu)
    FIRST_LINE=$(head -n 1 "$SCRIPT_NAME")
    if [[ "$FIRST_LINE" != "#!/bin/bash" ]]; then
        echo "ERRO: O arquivo baixado $SCRIPT_NAME não é um script bash válido!"
        echo "Conteúdo recebido (provavelmente um erro do GitHub):"
        cat "$SCRIPT_NAME"
        echo "Pulando..."
        continue
    fi
    # --- Fim da Verificação ---
    
    # Dá permissão de execução
    chmod +x "$SCRIPT_NAME"
    
    # Executa o script
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