
IMAGE_NAME = pdal-s2i
SQUASH = $(shell docker version | grep Experimental | awk '{if($2 == "true") {print "--squash"}}')

.PHONY: build
build:
	docker build --squash --build-arg http_proxy --build-arg https_proxy -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build --build-arg http_proxy --build-arg https_proxy -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
