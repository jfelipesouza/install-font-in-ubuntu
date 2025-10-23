#!/bin/bash

# ==================================================
# Instalador automático de fontes (Fira Code e JetBrains Mono)
# Tenta usar scripts locais primeiro; baixa do GitHub se não existirem.
# ==================================================

# --- Verifica se está sendo executado como root ---
if [ "$EUID" -ne 0 ]; then
  echo "❌ Este script precisa ser executado com privilégios de root."
  echo "Por favor, execute: sudo ./install.sh"
  echo "ou: sudo curl -sL [URL_DO_RAW] | bash"
  exit 1
fi

# --- Configuração do Repositório ---
REPO_USER="jfelipesouza"
REPO_NAME="install-font-in-ubuntu"
REPO_BRANCH="main"
BASE_RAW_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$REPO_BRANCH"
# -----------------------------------

# --- Lista de scripts a instalar ---
SCRIPT_LIST=(
  "install_firacode.sh"
  "install_jetbrainsmono.sh"
)
# -----------------------------------

echo "📦 Scripts de instalação:"
printf " - %s\n" "${SCRIPT_LIST[@]}"
echo ""

# Cria diretório temporário seguro
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit 1

# Percorre a lista de scripts
for SCRIPT_NAME in "${SCRIPT_LIST[@]}"; do
  echo "=================================================="
  echo "🔍 Preparando $SCRIPT_NAME"
  echo "=================================================="

  # Verifica se o script existe localmente
  if [ -f "../$SCRIPT_NAME" ]; then
    echo "📂 Usando script local: ../$SCRIPT_NAME"
    cp "../$SCRIPT_NAME" "./$SCRIPT_NAME"
  else
    echo "🌐 Baixando do GitHub..."
    SCRIPT_URL="$BASE_RAW_URL/$SCRIPT_NAME"
    curl -s -O "$SCRIPT_URL"
  fi

  # Verifica se o arquivo foi obtido
  if [ ! -f "$SCRIPT_NAME" ]; then
    echo "❌ ERRO: Falha ao obter $SCRIPT_NAME. Pulando..."
    continue
  fi

  # Confirma que é um script bash válido
  FIRST_LINE=$(head -n 1 "$SCRIPT_NAME")
  if [[ "$FIRST_LINE" != "#!/bin/bash" ]]; then
    echo "⚠️  O arquivo $SCRIPT_NAME não parece ser um script bash válido."
    echo "Conteúdo recebido:"
    head "$SCRIPT_NAME"
    echo "Pulando..."
    continue
  fi

  chmod +x "$SCRIPT_NAME"
  echo "▶️ Executando $SCRIPT_NAME..."
  bash "$SCRIPT_NAME"
  echo "✅ Concluído: $SCRIPT_NAME"
  echo ""
done

# Limpeza
echo "=================================================="
echo "🧹 Limpando diretórios temporários..."
cd /
rm -rf "$TMP_DIR"

echo "🎉 Todas as fontes foram instaladas com sucesso!"
