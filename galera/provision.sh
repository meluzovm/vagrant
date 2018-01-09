#!/bin/bash



#Install MariaDB
yum list installed MariaDB-server&>/dev/null || {
yum -y install MariaDB-server MariaDB-client galera
#Add repo dor MariaDB as simlink
rm -f /etc/yum.repos.d/MariaDB.repo
ln -s /vagrant/MariaDB.repo /etc/yum.repos.d/MariaDB.repo
}
#Install Ansible
yum list installed ansible&>/dev/null || {
yum -y install epel-release
yum -y install ansible
}

#Disable SELinux for MySQL
#semanage permissive -a mysqld_t

#Change properties
rm /etc/my.cnf 
ln -s /vagrant/my.cnf /etc/my.cnf

#Start MySQL service
#systemctl start mariadb

#Firewall Configuration
#iptables --append INPUT --protocol tcp --source 192.168.33.20 --jump ACCEPT
#iptables --append INPUT --protocol tcp --source 192.168.33.30 --jump ACCEPT
#service save iptables

#Change SSH Settings
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
