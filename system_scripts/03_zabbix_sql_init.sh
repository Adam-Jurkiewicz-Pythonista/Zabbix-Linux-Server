#!/bin/bash
#
apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y
apt install mysql-server-8.0 -y
systemctl status mysql.service 
clear

cat << SQLEND
In MySQL, copy and paste.....

mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'your-secret-password-here-like-@aep1bae@Xemaich0#ahN3sie6@'
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;
-----------
SQLEND
#
PASS=`pwgen -y -n 15`
echo "Sample password: ${PASS} "
#
mysql -uroot -p
#
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
#
cat << SQLEND
In MySQL, copy and paste.....

mysql> set global log_bin_trust_function_creators = 0
mysql> quit;
-----------
SQLEND
#
mysql -uroot -p