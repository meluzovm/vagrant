#!/bin/bash
#ln -s /usr/bin/nodejs /usr/bin/node

#Add repo dor MariaDB as simlink
rm -f /etc/yum.repos.d/MariaDB.repo
ln -s /vagrant/MariaDB.repo /etc/yum.repos.d/MariaDB.repo

#Install MariaDB
 yum list installed MariaDB-server&>/dev/null || {
yum -y install MariaDB-server MariaDB-client galera
}
#Install Ansible
 yum list installed ansible&>/dev/null || {
yum -y install epel-release
yum -y install ansible
}

systemctl start mariadb	

#command hubot -v &>/dev/null || {
#npm install -g hubot coffee-script}
