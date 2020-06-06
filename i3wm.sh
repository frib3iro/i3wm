#!/usr/bin/env bash

# variaveis
user='fabio'
root='root'
pass_user='cp1113bug6u'
blue='\e[34;1m'
green='\e[32;1m'
red='\e[31;1m'
yellow='\e[33;1m'
end='\e[m'
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
echo -e "${seta} ${blue}Bem vindo a instalação do i3wm${end}"
sleep 2s
clear

# Atualizando os espelhos
echo -e "${seta} ${blue}Atualizando...${end}"
echo $pass_user | sudo -S pacman -Syu --noconfirm
sleep 2s
clear

echo -e "${seta} ${blue}Digite${end} ${red}[ 1 ]${end} ${blue}para instalar o driver virt-manager${end}"
echo -e "${seta} ${blue}Digite${end} ${red}[ 2 ]${end} ${blue}para instalar o driver nvidia${end}\n"
echo -en "${seta} ${blue}Qual sua resposta:${end} "
read resposta
clear

if [ "$resposta" -eq 1 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para virt-manager${end}"
    sleep 2s
    driver_virtmanager
    clear
elif [ "$resposta" -eq 2 ]; then
    echo -e "${seta} ${blue}Iniciando instalação do driver para nvidia${end}"
    sleep 2s
    driver_nvidia
    clear
else
    echo -e "${seta} ${red}Resposta inválida!${end}"
    exit 1
fi

echo -e "${seta} ${blue}Instalando o i3wm desktop${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S xorg xorg-xinit i3-wm i3lock i3status i3blocks dmenu terminator --noconfirm
clear

echo -e "${seta} ${blue}Copiando .xinitrc para o diretorio home${end}"
sleep 2s
echo $pass_user | sudo -S cp /etc/X11/xinit/xinitrc ~/.xinitrc
clear

echo -e "${seta} ${blue}Instalando o nautilus${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S nautilus --noconfirm
clear

echo -e "${seta} ${blue}Instalando os pacotes necessários${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S archlinux-keyring archlinux-wallpaper bash-completion cmatrix cronie dialog gimp gnome-keyring gnome-tweaks gnupg gufw htop libreoffice libreoffice-fresh-pt-br man-db neofetch pass powerline-fonts rsync tcpdump totem ttf-hack gnu-free-fonts ttf-dejavu ttf-nerd-fonts-symbols ufw unrar xdg-user-dirs xdg-utils xf86-input-synaptics xcursor-vanilla-dmz-aa xclip youtube-dl --noconfirm
clear

echo -e "${seta} ${blue}Instalando o yay${end}"
sleep 2s
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
clear

# Hackerman -------------------------------------------------------
echo -e "${seta} ${blue}Instalando aircrack-ng e usbutils${end}"
sleep 2s
echo $pass_user | sudo -S pacman -S aircrack-ng usbutils --noconfirm
clear

echo -e "${seta} ${blue}Instalando o crunch${end}"
sleep 2s
yay -S crunch --noconfirm
clear
# Hackerman -------------------------------------------------------

echo -e "${seta} ${blue}Instalando o gnome-terminal-transparency${end}"
sleep 2s
yay -S gnome-terminal-transparency --noconfirm
clear

echo -e "${seta} ${blue}Instalando o mint-backgrounds${end}"
sleep 2s
yay -S mint-backgrounds --noconfirm
clear

echo -e "${seta} ${blue}Instalando os${end} ${yellow}firmwares warnigs${end} ${blue}do archlinux${end}"
sleep 2s
yay -S aic94xx-firmware wd719x-firmware --noconfirm
clear

echo -e "${seta} ${blue}Instalando o debtap${end}"
sleep 2s
yay -S debtap --noconfirm
clear

echo -e "${seta} ${blue}Instalando o xviewer${end}"
sleep 2s
yay -S xviewer xviewer-plugins --noconfirm
clear

echo -e "${seta} ${blue}Instalando as fontes${end}"
sleep 2s
yay -S ttf-ms-fonts --noconfirm
yay -S ttf-ubuntu-font-family --noconfirm
clear

echo -e "${seta} ${blue}Instalando o google-chrome${end}"
sleep 2s
yay -S google-chrome --noconfirm
clear

echo -e "${seta} ${blue}Iniciando o xdg-update${end}"
sleep 2s
xdg-user-dirs-update
clear

echo -e "${seta} ${blue}Instalando o gdm${end}"
sleep 2s
instalar_gdm 
clear

echo -e "${seta} ${blue}Iniciando o serviço do gdm${end}"
sleep 2s
iniciar_gdm
clear
