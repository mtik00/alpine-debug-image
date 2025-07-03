.PHONY: build push

build:
	docker build -t mtik00/debug:latest --pull .

push: build
	docker push mtik00/debug:latest
