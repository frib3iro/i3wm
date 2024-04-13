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
# Uso       : ./install.sh
# --------------------------------------------------------

# Atualizando o sistema ----------------------------------
echo "Atualizando todo o sistema..."
sleep 2s
sudo pacman -Syu --noconfirm

# Instalando as fontes -----------------------------------
echo "Instalando as fontes..."
sleep 2s
sudo pacman -S ttf-opensans
sudo pacman -S ttf-mononoki-nerd

# Instalando pacotes -------------------------------------
echo "Instalando pacotes..."
sleep 2s
sudo pacman -S git go --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/ && rm -rf yay

sudo pacman -S thunar thunar-media-tags-plugin thunar-archive-plugin thunar-volman

# Copiando os arquivos para os diretórios ---------------
echo "Copiando os arquivos para os diretórios..."
sleep 2s

# Fazendo as configurações -------------------------------
echo "Fazendo as configuraçẽs..."
sleep 2s
~/.config/i3/config
~/.config/kitty
/etc/lightdm
/etc/xdg/picon.conf

# Instalando  plugins e temas no vim
echo "Baixando os temas para o vim..."
sleep 2s

mkdir -p ~/.vim/pack/plugins/start && git clone https://github.com/mg979/vim-visual-multi.git

mkdir -p /home/fabio/.vim/pack/plugins/start

mkdir -p /home/fabio/.vim/pack/themes/start &&  git clone https://github.com/ghifarit53/tokyonight-vim.git &&  git clone https://github.com/joshdick/onedark.vim.git

mkdir -p /home/fabio/.vim/view





