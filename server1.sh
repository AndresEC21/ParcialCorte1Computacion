#!/bin/bash


echo "Creando un contenedor server1"
newgrp lxd
sudo snap install lxd --channel=4.0/stable
#Si te sale error quitas la siguiente linea.
lxd init --auto 
lxc launch ubuntu:18.04 server1
lxc exec server1 -- sudo apt update && apt upgrade -y
lxc exec server1 -- sudo apt-get install apache2 -y
lxc exec server1 -- sudo systemctl enable apache2
lxc file push /vagrant/servidor1.html server1/var/www/html/index.html
lxc exec server1 -- sudo systemctl restart apache2
sudo lxc config device add server1 serverr180 proxy listen=tcp:192.168.100.8:80 connect=tcp:127.0.0.1:80

echo "Creando un contenedor haproxy"
newgrp lxd
sudo snap install lxd --channel=4.0/stable
#Si te sale error quitas la siguiente linea.
lxd init --auto 
lxc launch ubuntu:18.04 serback1
lxc exec serback1 -- sudo apt update && apt upgrade -y
lxc exec serback1 -- sudo apt-get install apache2 -y
lxc exec serback1 -- sudo systemctl enable apache2
lxc file push /vagrant/serback1.html serback1/var/www/html/index.html
lxc exec server2 -- sudo systemctl restart apache2
sudo lxc config device add serback1 serback180 proxy listen=tcp:192.168.100.8:1580 connect=tcp:127.0.0.1:80