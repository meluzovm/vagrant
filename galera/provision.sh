#!/bin/bash
#ln -s /usr/bin/nodejs /usr/bin/node

#Add repo dor MariaDB as simlink
ln -s /etc/yum.repos.d/MariaDB.repo /vagrant/MariaDB.repo

#Install MariaDB
dpkg -s MariaDB-server &>/dev/null || {
apt-get -y update
yum install MariaDB-server MariaDB-client
}
#Install Ansible
dpkg -s ansible &>/dev/null || {
apt-get -y update
yum -y install epel-release
yum -y install ansible
}

systemctl start mariadb	

#command hubot -v &>/dev/null || {
#npm install -g hubot coffee-script}
