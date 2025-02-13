#!/bin/bash

sleep 4

if test ! -d "/run/php"; then
	mkdir /run/php
fi

cd /var/www/html

if test ! -f "/var/www/html/wp-config.php"; then
	wp --allow-root core download
	wp config create --allow-root --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=mariadb --path="/var/www/html"
	wp cli update --allow-root
	wp core install --allow-root --url="$WEBSITE_WP" --title="$DOMAIN_NAME" --admin_user="$ADMIN_WP" --admin_password="$ADMIN_PS" --admin_email="$ADMIN_EMAIL" --locale=en_US --skip-email
	wp user create "$USER_NAME" "$USER_EMAIL" --role=author --user_pass="$USER_PS" --allow-root
	wp theme install blogvi --activate --allow-root
fi

php-fpm7.4 -F