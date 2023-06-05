
all: run

run:
	@docker compose -f src/docker-compose.yml up -d --build

stop:
	@docker compose -f src/docker-compose.yml stop

fclean:
	@docker compose -f src/docker-compose.yml down -v 
	@docker rmi --force $$(docker image ls -aq)
	@docker builder prune --force

re: fclean all