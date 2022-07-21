#!/bin/bash

clear

echo "Instalando o lightdm com slick-greeter"
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl enable lightdm.service
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-gtk-greeter/' /etc/lightdm/lightdm.conf''

