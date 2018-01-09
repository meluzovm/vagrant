#!/bin/bash

 #Install Ansible
 yum list installed ansible&>/dev/null || {
 yum -y install epel-release
 yum -y install ansible
 }

 mkdir ~/galera
 rm -f ~/galera/inventory
 ln -s /vagrant/inventory ~/galera/inventory
