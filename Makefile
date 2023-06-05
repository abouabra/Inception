
all: run

run:
	@docker compose -f src/docker-compose.yml up -d 

stop:
	@docker compose -f src/docker-compose.yml stop

fclean:
	@docker stop $(docker ps -aq)
	@docker rm -f $(docker ps -aq)
	@docker rmi -f $(docker image ls -aq)
	@docker volume rm $(docker volume ls -q);
	@docker network rm $(docker network ls -q);
	@docker builder prune --force

re: fclean all