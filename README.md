# 🖋️ Instalação Local das Fontes Fira Code e JetBrains Mono no Ubuntu

Este repositório contém um script simples para instalar as fontes **Fira Code** e **JetBrains Mono** localmente no Ubuntu 24 (ou qualquer distribuição baseada em Debian).

A instalação utiliza os arquivos **ZIP** já presentes na pasta, sem necessidade de baixar nada da internet.

---

## 🚀 Como Usar

Siga os passos abaixo para instalar as fontes no seu usuário local:

### 1️⃣ Verifique os arquivos

Certifique-se de que a pasta contém:

```
Fira_Code_v6.2.zip
JetBrainsMono-2.304.zip
install.sh
```

---

### 2️⃣ Dê permissão de execução ao script

```bash
chmod +x install.sh
```

---

### 3️⃣ Execute o instalador

```bash
./install.sh
```

O script irá:

* Criar a pasta `~/.local/share/fonts` se não existir
* Extrair os arquivos ZIP
* Copiar as fontes `.ttf` para a pasta de fontes
* Atualizar o cache de fontes do sistema

---

## 🖍️ Fontes Instaladas

* **Fira Code** (com ligatures)
* **JetBrains Mono** (com ligatures)

Após a instalação, as fontes estarão disponíveis em qualquer aplicativo (VS Code, terminal, editores de texto, etc).

---

## 💬 Informações

🛠️ **Autor:** João Felipe de Oliveira Souza
📅 **Versão:** 2.0 (Local Edition)
📄 **Licença:** MIT
