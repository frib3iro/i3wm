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

sudo pacman -S git go --noconfirm

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si


## Fontes
sudo pacman -S ttf-opensans
sudo pacman -S ttf-mononoki-nerd

# Configurações
~/.config/i3/config
~/.config/kitty
/etc/lightdm
/etc/xdg/picon.conf


# Exemplo plugins e temas no vim
$ mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged







