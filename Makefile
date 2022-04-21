IMAGE?=devbegroupcompanies/ci:0.0.3

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

default: build
