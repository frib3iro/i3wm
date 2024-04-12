#!/usr/bin/bash

echo "Iniciando a criação do repositório..."
sleep 3s

# Verifica se o repositório remoto "origin" já existe
if git remote get-url origin > /dev/null 2>&1; then
    echo "Removendo o repositório remoto existente..."
    git remote remove origin
fi

# Inicia o repositório, adiciona um arquivo README.md, faz o commit inicial, cria a branch main e adiciona o repositório remoto
echo "# i3wm" >> README.md
git init
git add README.md
git commit -m "Arquivos de configuração do i3wm."
git branch -M main
git remote add origin git@github.com:frib3iro/i3wm.git
git push -u origin main
