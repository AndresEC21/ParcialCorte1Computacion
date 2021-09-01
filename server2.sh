#!/bin/bash


echo "Creando un contenedor server2"
newgrp lxd
sudo snap install lxd --channel=4.0/stable
#Si te sale error quitas la siguiente linea.
lxd init --auto 
lxc launch ubuntu:18.04 server2
lxc exec server2 -- sudo apt update && apt upgrade -y
lxc exec server2 -- sudo apt-get install apache2 -y
lxc exec server2 -- sudo systemctl enable apache2
lxc file push /vagrant/servidor2.html server2/var/www/html/index.html
lxc exec server2 -- sudo systemctl restart apache2
sudo lxc config device add server2 serr280 proxy listen=tcp:192.168.100.9:80 connect=tcp:127.0.0.1:80

echo "Creando un contenedor serbackup2"
newgrp lxd
sudo snap install lxd --channel=4.0/stable
#Si te sale error quitas la siguiente linea.
lxd init --auto 
lxc launch ubuntu:18.04 serback2
lxc exec serback2 -- sudo apt update && apt upgrade -y
lxc exec serback2 -- sudo apt-get install apache2 -y
lxc exec serback2 -- sudo systemctl enable apache2
lxc file push /vagrant/serback2.html serback2/var/www/html/index.html
lxc exec serback2 -- sudo systemctl restart apache2
sudo lxc config device add serback2 serback280 proxy listen=tcp:192.168.100.9:1580 connect=tcp:127.0.0.1:80