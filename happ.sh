#!/bin/bash


echo "Creando un contenedor haproxy"
newgrp lxd
sudo snap install lxd --channel=4.0/stable
#Si te sale error quitas la siguiente linea.
lxd init --auto 
lxc launch ubuntu:18.04 haproxy
lxc exec haproxy -- sudo apt update && apt upgrade -y
lxc exec haproxy -- sudo apt install haproxy -y
lxc exec haproxy -- sudo systemctl enable haproxy
lxc file push /vagrant/503.http haproxy/etc/haproxy/errors/
lxc exec haproxy -- sudo systemctl start haproxy
sudo lxc config device add haproxy happ80 proxy listen=tcp:192.168.100.10:80 connect=tcp:127.0.0.1:80