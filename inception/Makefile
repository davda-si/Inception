all: up

up:
	mkdir -p /home/davda-si/login/data/wp
	mkdir -p /home/davda-si/login/data/mdb
	docker compose -f srcs/docker-compose.yml up -d --build

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf /home/davda-si/login/data/wp/*
	sudo rm -rf /home/davda-si/login/data/mdb/*

re: clean up

stop:
	docker compose -f srcs/docker-compose.yml stop

start:
	docker compose -f srcs/docker-compose.yml start

status:
	docker ps

logs:
	docker compose -f srcs/docker-compose.yml logs