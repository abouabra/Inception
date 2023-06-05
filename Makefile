
all: run

run:
	@rm -rf /home/abouabra/data
	@mkdir -p /home/abouabra/data
	@mkdir -p /home/abouabra/data/wordpress
	@mkdir -p /home/abouabra/data/mariadb
	@docker compose -f src/docker-compose.yml up -d --build

stop:
	@docker compose -f src/docker-compose.yml stop

fclean:
	@docker compose -f src/docker-compose.yml down -v 
	@docker rmi --force $$(docker image ls -aq)
	@docker builder prune --force
	@rm -rf /home/abouabra/data
re: fclean all