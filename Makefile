# variables
SRCS=	srcs/docker-compose.yml

# rules
all:	up

up:
			sudo mkdir -p /home/lwourms/data/mariadb
			sudo mkdir -p /home/lwourms/data/wordpress
			docker-compose -f $(SRCS) up --build -d
down:
			docker-compose -f $(SRCS) down
ps:
			docker-compose -f $(SRCS) ps

top:
			docker-compose -f $(SRCS) top

fclean:
			docker-compose -f $(SRCS) down --rmi all -v
			sudo rm -rf /home/lwourms/data/

prune:	fclean
			docker system prune -f --all --volumes

.PHONY:	up down ps top fclean prune
