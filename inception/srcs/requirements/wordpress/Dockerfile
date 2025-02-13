FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get -y install curl && apt-get -y install sed

RUN apt-get install -y php-fpm php-mysqli mariadb-client

RUN mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/config.sh /var/www/html/config.sh

EXPOSE 3306

CMD [ "/var/www/html/config.sh" ]