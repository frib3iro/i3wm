#!/usr/bin/env bash
# --------------------------------------------------------
# Script    : [install-01.sh]
# Descrição : Script para instalação do arch linux no modo UEFI
# Versão    : 1.0
# Autor     : Fabio Junior Ribeiro
# Email     : rib3iro@live.com
# Data      : 11/12/2020
# Licença   : GNU/GPL v3.0
# --------------------------------------------------------
# Uso       : ./install-01.sh
# --------------------------------------------------------

echo "Instalando o yay..."
sleep 2s

sudo pacman -S git go --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Instalando as fontes..."
sleep 2s

sudo pacman -S ttf-opensans
sudo pacman -S ttf-mononoki-nerd

# Configurações
~/.config/i3/config
~/.config/kitty
/etc/lightdm
/etc/xdg/picon.conf

# Exemplo plugins e temas no vim
mkdir -p ~/.vim/pack/themes/start/ 
echo "Baixando os temas para o vim..."
sleep 2s
cd ~/.vim/pack/themes/start/ 
git clone https://github.com/ghifarit53/tokyonight-vim.git
git clone https://github.com/joshdick/onedark.vim.git

cd ~/
mkdir -p ~/.vim/pack/plugins/start/ 






