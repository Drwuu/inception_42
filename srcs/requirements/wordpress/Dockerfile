FROM debian:buster
# EXPOSE 9000


RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install php7.3 php-mysqli php-fpm mariadb-client
RUN apt-get -y install wget

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir -p /var/www
WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN rm -f wordpress/wp-config-sample.php
COPY ./conf/wp-config.php wordpress
RUN mkdir /run/php/

CMD ["/usr/sbin/php-fpm7.3", "-F"]
