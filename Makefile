# samples for the Docker Quick Start guide

all: build-all
build-all:  from label copy add1 add2 add3

from: 
	cd from-demo && \
	docker image build --rm --tag from-demo:1.0 .

label:
	cd label-demo && \
	docker image build --rm --tag label-demo:1.0 .

copy:
	cd copy-demo && \
	docker image build --rm --tag copy-demo:1.0 .

add1:
	cd add1-demo && \
	docker image build --rm --tag add-demo:1.0 .

add2:
	cd add2-demo && \
	docker image build --rm --tag add-demo:2.0 .

add3:
	cd add3-demo && \
	docker image build --rm --tag add-demo:3.0 .
