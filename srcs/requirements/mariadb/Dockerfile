# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: drwuu <drwuu@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 11:48:40 by lwourms           #+#    #+#              #
#    Updated: 2021/12/19 23:05:56 by drwuu            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 3306

ARG MARIADB_USER
ARG MARIADB_U_PASS
ARG MARIADB_SP_USER
ARG MARIADB_ROOT_PASS
ARG MARIADB_WP
ARG MARIADB_HOSTNAME

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/db.sql /
RUN sed -i "s/MARIADB_SP_USER/$MARIADB_SP_USER/g" /db.sql
RUN sed -i "s/MARIADB_U_PASS/$MARIADB_U_PASS/g" /db.sql
RUN sed -i "s/MARIADB_USER/$MARIADB_USER/g" /db.sql
RUN sed -i "s/MARIADB_ROOT_PASS/$MARIADB_ROOT_PASS/g" /db.sql

RUN service mysql start && mysql < db.sql
RUN rm -f db.sql

# CMD ["usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]
CMD ["mysqld"]
