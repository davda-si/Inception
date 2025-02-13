FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

COPY tools/script.sh /app/

WORKDIR /app

RUN chmod +x script.sh

EXPOSE 3306

CMD [ "./script.sh" ]