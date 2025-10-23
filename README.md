# Instalação da Fonte FiraCode no Ubuntu

Este repositório contém um script que instala a fonte **FiraCode** e **JetBrains Mono** no seu sistema Ubuntu de forma global. O script baixa o arquivo ZIP com a fonte hospedado em um repositório do GitHub, descompacta e instala as fontes no sistema.


## Como Usar
Existem duas maneiras de executar o instalador. O método direto é o mais recomendado pela sua simplicidade.


## Método 1: Execução Direta (Recomendado)

Este é o método mais rápido. Ele baixa e executa o script de instalação com um único comando, sem salvar arquivos permanentemente.

Abra seu terminal e cole **um** dos comandos abaixo:

**Usando `curl`:**
```bash
curl -sL [https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh](https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh) | sudo bash
```

**Usando `wget`:**
```bash
wget -qO - [https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh](https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh) | sudo bash
```

**Nota:** O script pedirá sua senha sudo pois ele instala as fontes no diretório de sistema /usr/share/fonts, que requer privilégios de administrador.

## Método 2: Execução Direta (Recomendado)
Se você prefere baixar o script, inspecioná-lo e executá-lo manualmente, siga estes passos:

### Passos para Instalação

### 1. Baixar o Script

Primeiro, baixe o script `install.sh` para o seu sistema. Você pode fazer isso manualmente ou via linha de comando com o `wget`.

Para baixar manualmente, acesse o [repositório no GitHub](https://github.com/jfelipesouza/install-font-in-ubutu) e faça o download do arquivo.

Se preferir via linha de comando, use:

```bash
wget [https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh](https://raw.githubusercontent.com/jfelipesouza/install-font-in-ubuntu/main/install.sh)

```

### 2. Tornar o Script Executável

Após o download, abra um terminal e navegue até o diretório onde o script foi salvo. Em seguida, torne o script executável com o comando:

```bash
chmod +x install.sh
```

### 3. Executar o Script

Após torna o arquivo executável abra o terminal e digite o código abaixo e dê enter:

```bash
sudo ./install.sh
```

## Fontes Instaladas
Atualmente, o script instala as seguintes fontes:

 - Fira Code (com ligatures)

 - JetBrains Mono (com ligatures)

Qualquer novo script install_*.sh adicionado a este repositório no futuro será incluído automaticamente na instalação.

## Contribua

Se você encontrar algum problema ou tiver sugestões de melhoria, sinta-se à vontade para abrir uma <strong>issue</strong> ou submeter um <strong>pull request</strong>. Fique à vontade para contribui
