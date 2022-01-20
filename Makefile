IMAGE?=devbegroupcompanies/php:0.0.7

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

default: build
