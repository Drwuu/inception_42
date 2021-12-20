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

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server

COPY conf/db.sql /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN service mysql start && mysql < db.sql
RUN rm -f db.sql

# CMD ["usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]
CMD ["mysqld"]
