build:
	docker build -t isaachbn/docker-notify-api:base .

version:
	@docker run isaachbn/docker-notify-api --version --no-ansi

test:
	@make version