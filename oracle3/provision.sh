#Install packages
yum update
yum install -y vim
yum install -y binutils.x86_64 compat-libcap1.x86_64 gcc.x86_64 gcc-c++.x86_64 glibc.i686 glibc.x86_64 glibc-devel.i686 glibc-devel.x86_64 ksh compat-libstdc++-33 libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 libgcc.i686 libgcc.x86_64 libstdc++.i686 libstdc++.x86_64 libstdc++-devel.i686 libstdc++-devel.x86_64 libXi.i686 libXi.x86_64 libXtst.i686 libXtst.x86_64 make.x86_64 sysstat.x86_64

#SSH Problem fix
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

#Kernel parameters recommended by oracle
cp /etc/sysctl.conf{,.bkp}
echo "#Parameters for Oracle DB:" >> /etc/sysctl.conf
echo "fs.file-max = 6815744" >> /etc/sysctl.conf
echo "kernel.sem = 250 32000 100" >> /etc/sysctl.conf
echo "kernel.semmni = 128" >> /etc/sysctl.conf
echo "kernel.shmmax= 536870912" >> /etc/sysctl.conf
echo "kernel.shmall= 2097152" >> /etc/sysctl.conf
echo "kernel.shmmni = 4096" >> /etc/sysctl.conf
echo "kernel.panic_on_oops = 1" >> /etc/sysctl.conf #Orabug 19212317
echo "net.core.rmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.rmem_max = 4194304" >> /etc/sysctl.conf
echo "net.core.wmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.wmem_max = 1048576" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 2" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 2" >> /etc/sysctl.conf
echo "fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 9000 65500" >> /etc/sysctl.conf

sysctl -p

#Limits
cp /etc/security/limits.conf{,.bkp}
echo "#Parameters for Oracle DB:" >> /etc/security/limits.conf
echo "oracle hard nproc 16384" >> /etc/security/limits.conf
echo "oracle hard nofile 65536" >> /etc/security/limits.conf

#Users and groups
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba oracle
echo "oracle" | passwd oracle --stdin

#Directories and Permissions
mkdir /u01
chown -R oracle:oinstall /u01
chmod -R 775 /u01
chmod g+s /u01

# Oracle Environment Settings
echo 'export TMP=/tmp' >> /home/oracle/.bash_profile 
echo 'export ORACLE_HOSTNAME=$HOSTNAME' >> /home/oracle/.bash_profile 
echo 'export ORACLE_UNQNAME=ORCL' >> /home/oracle/.bash_profile 
echo 'export ORACLE_BASE=/u01/app/oracle' >> /home/oracle/.bash_profile 
echo 'export ORACLE_HOME=${ORACLE_BASE}/product/11.2.0/dbhome' >> /home/oracle/.bash_profile 
echo 'export ORACLE_SID=ORCL' >> /home/oracle/.bash_profile 

echo 'PATH=/usr/sbin:${PATH}:${ORACLE_HOME}/bin' >> /home/oracle/.bash_profile 

echo 'export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:/lib:/usr/lib;' >> /home/oracle/.bash_profile 
echo 'export CLASSPATH=${ORACLE_HOME}/jlib:${ORACLE_HOME}/rdbms/jlib;' >> /home/oracle/.bash_profile 

echo 'alias cdob="cd ${ORACLE_BASE}"' >> /home/oracle/.bash_profile 
echo 'alias cdoh="cd ${ORACLE_HOME}"' >> /home/oracle/.bash_profile 
echo 'alias tns="cd ${ORACLE_HOME}/network/admin"' >> /home/oracle/.bash_profile 
echo 'alias envo="env | grep ORACLE"' >> /home/oracle/.bash_profile 

echo 'umask 022' >> /home/oracle/.bash_profile 

echo 'envo' >> /home/oracle/.bash_profile 


