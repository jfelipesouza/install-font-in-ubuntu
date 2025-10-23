# 🖋️ Instalação das Fontes FiraCode e JetBrains Mono no Ubuntu

Este repositório contém scripts que instalam as fontes **FiraCode** e **JetBrains Mono** no Ubuntu (ou distribuições baseadas em Debian) de forma rápida e automatizada.

Os scripts podem usar **arquivos locais** (se já estiverem na pasta) ou baixá-los automaticamente do GitHub caso não estejam disponíveis.

---

## 🚀 Como Usar

Existem duas maneiras de instalar:

* **Método 1 (Recomendado): Execução direta via terminal**
* **Método 2: Download manual e execução local**

---

## 🧩 Método 1: Execução Direta (Recomendado)

Baixa e executa o instalador automaticamente, sem precisar salvar arquivos.

### Usando `curl`:

```bash
curl -sL https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh | sudo bash
```

### Usando `wget`:

```bash
wget -qO - https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh | sudo bash
```

> 💡 **Nota:** É necessário usar `sudo` porque as fontes são instaladas em `/usr/share/fonts`, um diretório de sistema.

---

## 🧠 Método 2: Instalação Manual (Local)

Permite inspecionar o script antes da execução.

### 1️⃣ Baixar o script

Baixe o `install.sh` diretamente do GitHub:

```bash
wget https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh
```

Ou acesse o repositório:
👉 [https://github.com/jfelipesouza/install-font-in-ubuntu](https://github.com/jfelipesouza/install-font-in-ubuntu)

---

### 2️⃣ Tornar o script executável

```bash
chmod +x install.sh
```

---

### 3️⃣ Executar o instalador

```bash
sudo ./install.sh
```

O script verificará se os arquivos locais (`install_firacode.sh`, `install_jetbrainsmono.sh`) estão disponíveis.
Se não estiverem, ele os baixa automaticamente e executa.

---

## 🖍️ Fontes Instaladas

* **Fira Code** (com ligatures)
* **JetBrains Mono** (com ligatures)

> 🧩 Qualquer novo `install_*.sh` adicionado a este repositório será detectado automaticamente pelo instalador.

---

## 💬 Contribuição

Encontrou um problema ou tem uma sugestão?
Abra uma **issue** ou envie um **pull request**!

Repositório:
👉 [https://github.com/jfelipesouza/install-font-in-ubuntu](https://github.com/jfelipesouza/install-font-in-ubuntu)

---

🛠️ **Autor:** [João Felipe Souza](https://github.com/jfelipesouza)
📅 **Versão:** 2.0
📄 Licença: MIT
