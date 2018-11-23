IMAGE_NAME ?= codeclimate/codeclimate-gnu-complexity

all: image image.test test

.PHONY: image
image:
	docker build --tag $(IMAGE_NAME) .

.PHONY: image.test
image.test:
	docker build \
	  --file Dockerfile.test \
	  --tag $(IMAGE_NAME)-test .

.PHONY: test
test:
	docker run --rm $(IMAGE_NAME)-test
