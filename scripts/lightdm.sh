#!/bin/bash

clear

echo "Instalando o lightdm com slick-greeter"
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl enable lightdm.service
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-gtk-greeter/' /caminho/arquivo''

echo
echo "Criando o diretorio xsessions..."
mkdir /usr/share/xsessions

echo
echo "Criando o arquivo dwm.desktop..."
touch /usr/share/xsessions/dwm.desktop
cat >> '/usr/share/xsessions/dwm.desktop' << EOF
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF

