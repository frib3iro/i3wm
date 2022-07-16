#!/usr/bin/env bash

# Lista de pacotes para instalar com o yay
listayay=(4kvideodownloader cava consolas-font crunch debtap downgrade google-chrome mintstick mint-y-icons onedriver pyrit spotify timeshift ttf-ms-fonts ttf-ubuntu-font-family tumbler-extra-thumbnailers xcursor-breeze)

# Instalando o yay
echo
echo "Instalando o yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

# Instalando pacotes com o yay
echo
echo "Instalando pacotes com yay..."
for i in ${listayay[@]}; do
    echo
    echo "Instalando o pacote $i"
    if yay -S $i --noconfirm; then
        echo "Pacote $i instalado com sucesso!"
    else
        echo "Houve erro na instalação do pacote $i!"
    fi
done
