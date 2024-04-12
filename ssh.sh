#!/bin/bash

# Verifica se já existem chaves SSH
if [[ -f ~/.ssh/id_ed25519 && -f ~/.ssh/id_ed25519.pub ]]; then
    read -p "Já existem chaves SSH. Deseja removê-las e continuar? (y/n): " remove_keys
    if [[ $remove_keys =~ ^[Yy]$ ]]; then
        rm ~/.ssh/id_ed25519*
    else
        echo "Operação cancelada. As chaves SSH existentes não foram removidas."
        exit 0
    fi
fi

# Gerar nova chave SSH
ssh-keygen -t ed25519 -C "rib3iro@live.com"

# Iniciar ssh-agent
eval "$(ssh-agent -s)"

# Adicionar chave SSH ao ssh-agent
ssh-add ~/.ssh/id_ed25519

# Copiar chave pública para a área de transferência
if command -v xclip >/dev/null 2>&1; then
    cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
    echo "Chave pública SSH copiada para a área de transferência."
else
    echo "Não foi possível encontrar o comando xclip para copiar a chave pública SSH."
    echo "Por favor, copie manualmente a chave pública para o GitHub."
fi

# Testar conexão SSH
echo "Testando conexão SSH com o GitHub..."
ssh -T git@github.com

echo "Configuração concluída."

