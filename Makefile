.PHONY: image example

IMAGE_NAME ?= codeclimate/codeclimate-gnu-complexity

image:
	docker build --tag $(IMAGE_NAME) .

example: image
	docker run --rm --volume $(PWD):/code $(IMAGE_NAME)
