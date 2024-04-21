NAME=ghcr.io/uenob/logrotate:latest

logrotate.tar: Dockerfile
	docker buildx build --platform=linux/amd64 -t $(NAME) .
	docker save -o $@ $(NAME)
