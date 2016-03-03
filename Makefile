.PHONY: image example

IMAGE_NAME ?= codeclimate/codeclimate-gnu-complexity

image:
	docker build --tag $(IMAGE_NAME) .

test: image
	cram test

citest:
	cram test

example: image
	docker run --rm --volume $(PWD):/code $(IMAGE_NAME)
