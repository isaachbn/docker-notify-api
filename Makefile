build:
	docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASSWORD
	docker build -t isaachbn/docker-notify-api:base .

version:
	@docker run isaachbn/docker-notify-api --version --no-ansi

test:
	@make version