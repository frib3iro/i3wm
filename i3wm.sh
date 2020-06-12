#!/usr/bin/env bash

# variaveis
user='fabio'
root='root'
pass_user='cp1113bug6u'
azl='\e[34;1m'
vrd='\e[32;1m'
vrm='\e[31;1m'
amr='\e[33;1m'
fim='\e[m'
seta='\e[32;1m==>\e[m'

# Funções ------------------------------------------------------------
driver_virtmanager(){
    echo $pass_user | sudo -S pacman -S xf86-video-qxl --noconfirm
}

driver_nvidia(){
    echo $pass_user | sudo -S pacman -S nvidia nvidia-utils nvidia-settings intel-ucode --noconfirm
}
# GDM ----------------------------------------------------------------
instalar_gdm(){
    echo $pass_user | sudo -S pacman -S gdm --noconfirm
}
iniciar_gdm(){
    echo $pass_user | sudo -S systemctl enable gdm
    echo $pass_user | sudo -S systemctl start gdm
}

# Tela de boas vindas
clear
echo -e "${seta} ${azl}Bem vindo a instalação do i3wm${fim}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${azl}Atualizando...${fim}"
echo $pass_user | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

echo -e "${seta} ${azl}Digite${fim} ${vrm}[ 1 ]${fim} ${azl}para instalar o driver virt-manager${fim}"
echo -e "${seta} ${azl}Digite${fim} ${vrm}[ 2 ]${fim} ${azl}para instalar o driver nvidia${fim}\n"
echo -en "${seta} ${azl}Qual sua resposta:${fim} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${azl}Iniciando instalação do driver para virt-manager${fim}"
    sleep 2s
    driver_virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${azl}Iniciando instalação do driver para nvidia${fim}"
    sleep 2s
    driver_nvidia
    clear
else
    echo -e "${seta} ${vrm}Resposta inválida!${fim}"
    exit 1
fi

echo -e "${seta} ${azl}Instalando o i3wm desktop${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S xorg xorg-xinit i3-wm i3lock i3status i3blocks dmenu xfce4-terminal --noconfirm
clear

echo -e "${seta} ${azl}Copiando .xinitrc para o diretorio home${fim}"
sleep 2s
echo $pass_user | sudo -S cp /etc/X11/xinit/xinitrc ~/.xinitrc
clear

echo -e "${seta} ${azl}Instalando o nautilus${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S nautilus --noconfirm
clear

echo -e "${seta} ${azl}Instalando os pacotes necessários${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S archlinux-keyring archlinux-wallpaper cmatrix cronie dialog gimp gnome-keyring gnome-tweaks gnupg gufw htop libreoffice libreoffice-fresh-pt-br man-db neofetch pass powerline-fonts rsync totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip youtube-dl --noconfirm
clear

echo -e "${seta} ${azl}Instalando o yay${fim}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${azl}Instalando aircrack-ng e usbutils${fim}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils tcpdump --noconfirm
clear

echo -e "${seta} ${azl}Instalando o crunch${fim}"
sleep 2s
yay -S crunch --noconfirm
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${azl}Instalando os${fim} ${amr}firmwares warnigs${fim} ${azl}do archlinux${fim}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

echo -e "${seta} ${azl}Instalando o debtap${fim}"
sleep 2s
yay -S debtap --noconfirm
clear

echo -e "${seta} ${azl}Instalando o xviewer${fim}"
sleep 2s
yay -S xviewer xviewer-plugins --noconfirm
clear

echo -e "${seta} ${azl}Instalando as fontes${fim}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "${seta} ${azl}Instalando o google-chrome${fim}"
sleep 2s
yay -S google-chrome --noconfirm
clear

echo -e "${seta} ${azl}Iniciando o xdg-update${fim}"
sleep 2s
xdg-user-dirs-update
clear

echo -e "${seta} ${azl}Instalando o gdm${fim}"
sleep 2s
instalar_gdm 
clear

echo -e "${seta} ${azl}Iniciando o serviço do gdm${fim}"
sleep 2s
iniciar_gdm
clear
