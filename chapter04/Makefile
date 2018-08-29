# samples for the Docker Quick Start guide
SHELL = bash

all: build-all
build-all:  volume

volume:
	cd volume-demo2 && \
	docker image build --rm --tag volume-demo2:1.0 .

run-volume4:
	docker volume ls
	docker container run --rm -d \
	   --mount source=my-vol-02,target=/myvol \
	   --name vol-demo2 \
	   volume-demo2:1.0 tail -f /dev/null

run-volume5:
	docker volume ls
	docker container run --rm -d --name vol-demo2 \
	   volume-demo2:1.0 tail -f /dev/null

run-volume6:
	docker volume ls
	echo "important data" > /tmp/data-file.txt
	docker container run --rm -d \
	   -v /tmp/data-file.txt:/myvol/data-file.txt \
	   --name vol-demo2 \
	   volume-demo2:1.0 tail -f /dev/null

clean:
	docker container stop vol-demo2
	docker container ls
