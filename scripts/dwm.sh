#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : [dwm.sh]
# Descrição :
# Versão    : 1.0
# Autor     : Fabio Junior Ribeiro 
# Email     : rib3iro@live.com
# Github    : https://github.com/frib3iro 
# Data      : 15/07/2022
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       :
#----------------------------------------------------------------------

clear

echo "Criando diretorio para baixar arquivos..."
mkdir ~/dwm && cd ~/dwm

echo
echo "Clonando dwm..."
git clone https://git.suckless.org/dwm

echo
echo "Clonando dmenu..."
git clone https://git.suckless.org/dmenu

echo
echo "Clonando st..."
git clone https://git.suckless.org/st

