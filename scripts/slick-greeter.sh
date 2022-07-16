#!/bin/bash

clear

echo "Criando o arquivo slick-greeter.conf..."
touch /etc/lightdm/slick-greeter.conf
cat >> '/etc/lightdm/slick-greeter.conf' << EOF
[Greeter]
background=/usr/share/backgrounds/archlinux/car02.jpg
EOF

sed -i 's/greeter-session=lightdm-gtk-greeter/greeter-
session=lightdm-slick-greeter/' /caminho/arquivo''
