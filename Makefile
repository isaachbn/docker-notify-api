build:
	docker build -t isaachbn/docker-notify-api:master master

version:
	@docker run isaachbn/docker-notify-api --version --no-ansi

test:
	@make version