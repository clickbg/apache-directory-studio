tag := latest

all: build-container

build-container:
	docker build -t apache-directory-studio:${tag} .

push:
	docker buildx build --push --platform linux/arm/v5,linux/arm/v7,linux/arm64/v8,linux/amd64 --tag clickbg/apache-directory-studio:${tag} .

.PHONY: all push build-container
