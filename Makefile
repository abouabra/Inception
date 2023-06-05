
NAME = inception
all: $(NAME)

$(NAME):
	@docker compose up -d -f src/docker-compose.yml

stop:
	@docker compose stop -f src/docker-compose.yml
fclean:
	@docker compose down -v -f src/docker-compose.yml
	@docker rmi --force $(docker image ls -aq)
	@docker builder prune --force

re: fclean all