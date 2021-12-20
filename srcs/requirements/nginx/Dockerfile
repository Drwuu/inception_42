# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: drwuu <drwuu@student.42lyon.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/05/14 11:48:40 by lwourms           #+#    #+#              #
#    Updated: 2021/12/19 22:28:44 by drwuu            ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
EXPOSE 443

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx
RUN apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Lyon/O=42 Network/OU=Winkel/CN=Ludwig Wourms" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
COPY ./conf/default etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
