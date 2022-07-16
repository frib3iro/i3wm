#!/usr/bin/env bash

clear

# Lista de pacotes para instalar com o pacman
listapacman=(aircrack-ng arc-gtk-theme archlinux-wallpaper arc-icon- bluez bluez-utils bully capitaine-cursors cmatrix cowpatty cronie cups fdupes feh ffmpegthumbnailer flameshot geany geany-plugins gst-libav gst-plugin-pipewire gufw hashcat hcxdumptool hcxtools htop libreoffice libreoffice-fresh-pt-br links lollypop lxappearance man-pages-pt_br mesa-demos mplayer neofetch picom ranger reaver rsync tcpdump termshark theme thunar ttf-droid ttf-font-awesome ttf-inconsolata ttf-opensans tumbler unrar wifite xorg-xsetroot xclip xcursor-vanilla-dmz xcursor-vanilla-dmz-aa)

echo "Instalando pacotes com pacman..."
for i in ${listapacman[@]}; do
    echo
    echo "Instalando o pacote $i"
    if pacman -S $i --noconfirm; then
        echo "Pacote $i instalado com sucesso!"
    else
        echo "Houve erro na instalação do pacote $i!"
    fi
done

echo
echo "Iniciando o bluez, cups lightdm..."
systemctl enable bluetooth.service
systemctl enable cups.service

echo
echo "Colorindo a saída do pacman..."
sleep 1s
sed -i 's/#Color/Color/' /etc/pacman.conf

