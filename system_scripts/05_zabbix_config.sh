#!/bin/bash
#
clear

cat << END
In config file, find and replace.....

### Option: DBPassword
#       Database password.
#       Comment this line if no password is used.
#
# Mandatory: no
# Default:
DBPassword=password
-----------
END
#
vim /etc/zabbix/zabbix_server.conf
#
systemctl restart zabbix-server.service
systemctl status zabbix-server.service
