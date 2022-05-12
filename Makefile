.PHONY: images

images:
	docker build -t mtik00/debug:latest --pull .
	docker push mtik00/debug:latest
