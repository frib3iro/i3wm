#!/usr/bin/env bash

# variaveis
b='\e[34;1m'
g='\e[32;1m'
r='\e[31;1m'
y='\e[33;1m'
f='\e[m'
s='\e[32;1m>>>\e[m'

clear

listapacman=(aircrack-ng arc-gtk-theme archlinux-wallpaper arc-icon-theme bluez bluez-utils bully capitaine-cursors cmatrix cowpatty cronie cups dmenu fdupes feh ffmpegthumbnailer flameshot geany geany-plugins gimp gst-libav gst-plugin-pipewire gufw hashcat hcxdumptool hcxtools htop i3lock i3blocks i3-gaps i3status libreoffice libreoffice-fresh-pt-br links lollypop lxappearance man-pages-pt_br mesa-demos mplayer neofetch picom ranger reaver rsync tcpdump termshark thunar ttf-droid ttf-font-awesome ttf-inconsolata ttf-opensans tumbler unrar unzip wifite xclip xcursor-vanilla-dmz-aa xfce4-terminal xorg-xsetroot)

listayay=(4kvideodownloader cava consolas-font crunch debtap downgrade google-chrome mintstick mint-y-icons onedriver pyrit spotify timeshift ttf-ms-fonts ttf-ubuntu-font-family xcursor-breeze)

echo
echo -e "${s} ${b}Atualizando...${f}"
sudo pacman -Syu --noconfirm

echo
echo -e "${s} ${b}Instalando pacotes com pacman...${f}"
for i in ${listapacman[@]}; do
    echo
    echo -e "${s} ${b}Instalando o pacote $i ${f}"
    if sudo pacman -S $i --noconfirm; then
        echo -e "${s} ${g}Pacote $i instalado com sucesso!${f}"
    else
        echo -e "${s} ${r}Houve erro na instalação do pacote $i!${f}"
    fi
done

echo
echo -e "${s} ${b}Instalando o yay...${f}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo
echo -e "${s} ${b}Instalando pacotes com yay...${f}"
for i in ${listayay[@]}; do
    echo
    echo -e "${s} ${b}Instalando o pacote $i ${f}"
    if yay -S $i --noconfirm; then
        echo -e "${s} ${g}Pacote $i instalado com sucesso!${f}"
    else
        echo -e "${s} ${r}Houve erro na instalação do pacote $i!${f}"
    fi
done

echo
echo -e "${s} ${b}Iniciando o bluez e o cups...${f}"
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable cups.service

echo
echo -e "${s} ${b}Colorindo a saída do pacman...${f}"
sleep 2s
sed -i 's/#Color/Color/' /etc/pacman.conf

git clone https://github.com/frib3iro/github
mv github/*.sh .
./git.sh
./github.sh
cd /home/fabio && rm -rf go yay
