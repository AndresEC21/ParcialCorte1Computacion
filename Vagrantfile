# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
if Vagrant.has_plugin? "vagrant-vbguest"
  config.vbguest.no_install = true
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
end
config.vm.define :serverUbuntu do |serverUbuntu|
serverUbuntu.vm.box = "bento/ubuntu-20.04"
serverUbuntu.vm.network :private_network, ip: "192.168.100.8"
serverUbuntu.vm.provision "shell", path: "server1.sh"
serverUbuntu.vm.hostname = "serverUbuntu"
end
config.vm.define :serverUbuntu2 do |serverUbuntu2|
serverUbuntu2.vm.box = "bento/ubuntu-20.04"
serverUbuntu2.vm.network :private_network, ip: "192.168.100.9"
serverUbuntu2.vm.provision "shell", path: "server2.sh"
serverUbuntu2.vm.hostname = "serverUbuntu2"
end
config.vm.define :haproxyUbuntu do |haproxyUbuntu|
haproxyUbuntu.vm.box = "bento/ubuntu-20.04"
haproxyUbuntu.vm.network :private_network, ip: "192.168.100.10"
haproxyUbuntu.vm.provision "shell", path: "happ.sh"
haproxyUbuntu.vm.hostname = "haproxyUbuntu"
end
end