#!/bin/bash

service mariadb start > /dev/null

mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "FLUSH PRIVILEGES ;"

sleep 5
service mariadb stop > /dev/null
exec mysqld_safe --bind-address=0.0.0.0 > /dev/null