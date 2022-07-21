#!/usr/bin/env bash

clear
cp /home/fabio/Arquivos/Imagens/Wallpapers/* /usr/share/backgrounds/archlinux/
sudo pacman -S feh --noconfirm
feh --bg-fill  /usr/share/backgrounds/archlinux/car01.jpg

