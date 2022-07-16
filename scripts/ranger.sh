#!/usr/bin/env bash

clear

sudo pacman -S ueberzug --noconfirm
sudo mkdir /etc/ranger
sudo touch /etc/ranger/rc.conf

sudo cat >> '/etc/ranger/rc.conf' << EOF
set preview_images true
set preview_images_method ueberzug
EOF
