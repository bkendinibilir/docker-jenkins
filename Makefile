NAME = jenkins
VERSION ?= 2.32.2
REGISTRY ?= eu.gcr.io/techstories-155021

default: buildwithcache

all: clean build push

build:
	docker build --no-cache -t ${REGISTRY}/${NAME}:${VERSION} .

buildwithcache:
	docker build -t ${REGISTRY}/${NAME}:${VERSION} .

clean:
	docker rmi ${REGISTRY}/${NAME}:${VERSION}

push: build
	docker push ${REGISTRY}/${NAME}:${VERSION}
	
shell: buildwithcache
	docker run -ti --rm ${REGISTRY}/${NAME}:${VERSION} /bin/sh

