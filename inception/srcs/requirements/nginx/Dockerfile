FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx && apt-get install openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -new -newkey rsa:4096 -nodes -keyout etc/nginx/ssl/davda-si.key -out etc/nginx/ssl/davda-si.crt -days 365 -subj "/C=PT/ST=/L=/O=/CN=davda-si"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]