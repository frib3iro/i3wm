#!/bin/bash

mkdir /home/$USER/Arquivos
echo "" >> /etc/fstab
echo "UUID=4ffd3915-b9e2-414a-8d55-0caa94998926 /home/fabio/Arquivos ext4 defaults,user 0 0" >> /etc/fstab
mount -a
chown $USER:$USER Arquivos
