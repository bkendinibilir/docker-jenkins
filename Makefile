NAME = jenkins
REGISTRY ?= eu.gcr.io/techstories-155021
VERSION ?= 2.32.2

build:
	docker build -t ${REGISTRY}/${NAME}:${VERSION} .

push: build
	gcloud docker -- push ${REGISTRY}/${NAME}:${VERSION}

shell: build
	docker run -ti --rm ${REGISTRY}/${NAME}:${VERSION} /bin/sh

clean:
	docker rmi ${REGISTRY}/${NAME}:${VERSION}

all: clean build push