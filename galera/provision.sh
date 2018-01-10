#!/bin/bash



#Install MariaDB
yum list installed MariaDB-server&>/dev/null || {
# rm -f /etc/yum.repos.d/MariaDB.repo
ln -s /vagrant/MariaDB.repo /etc/yum.repos.d/MariaDB.repo
yum -y install MariaDB-server MariaDB-client galera
}

#Install Ansible
yum list installed ansible&>/dev/null || {
yum -y install epel-release
yum -y install ansible
}

#Install vim 
yum list installed vim>/dev/null || {
yum -y install vim
}

#Install net-tools
yum list installed net-tools>/dev/null || {
yum -y install net-tools
}

#Change SSH Settings
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

#Disable SELinux for MySQL
setenforce 0

#Change properties
cp /vagrant/galera.cnf /etc/my.cnf.d/

#Firewall Configuration
#iptables --append INPUT --protocol tcp --source 192.168.33.20 --jump ACCEPT
#iptables --append INPUT --protocol tcp --source 192.168.33.30 --jump ACCEPT
#service save iptables

