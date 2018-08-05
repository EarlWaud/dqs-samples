# samples for the Docker Quick Start guide

all: build-all
build-all:  from label copy add1 add2 add3 env

from: 
	cd from-demo && \
	docker image build --rm --tag from-demo:1.0 .

run-from:
	docker container run --rm from-demo:1.0

label:
	cd label-demo && \
	docker image build --rm --tag label-demo:1.0 .

run-label:
	docker image inspect --format '{{json .Config}}' hello-earl:1.0.1 | jq '.Labels'

copy:
	cd copy-demo && \
	docker image build --rm --tag copy-demo:1.0 .

run-copy:
	docker container run --rm copy-demo:1.0 ls -l -R theqsg

add1:
	cd add1-demo && \
	docker image build --rm --tag add-demo:1.0 .

add2:
	cd add2-demo && \
	docker image build --rm --tag add-demo:2.0 .

add3:
	cd add3-demo && \
	docker image build --rm --tag add-demo:3.0 .

run-add:
	docker container run --rm add-demo:1.0 ls -l -R theqsg
	docker container run --rm add-demo:2.0 ls -l -R theqsg
	docker container run --rm add-demo:3.0

env:
	cd env-demo && \
	docker image build --rm --tag env-demo:1.0 .

run-env:
	docker image inspect --format '{{json .Config}}' env-demo:1.0 | jq '.Env'
	docker container run --rm --env changeMe="New Value" --env adhoc="run time"  env-demo:1.0 env

arg1:
	cd arg-demo && \
	docker image build --rm --tag arg-demo:1.0 . 

arg2:
	cd arg-demo && \
	docker image build --rm \
	   --build-arg key1="buildTimeValue" \
	   --build-arg key2="good till env instruction" \
	   --tag arg-demo:2.0 .

arg3:
	cd arg3-demo && \
	docker image build --rm \
	   --build-arg username=35 \
	   --build-arg appdir="/opt/hello" \
	   --tag arg-demo:3.0 .

run-arg1:
	docker image inspect --format '{{json .Config}}' arg-demo:1.0 | jq '.Env'
	docker container run --rm arg-demo:1.0 env

run-arg2:
	docker image inspect --format '{{json .Config}}' arg-demo:1.0 | jq '.Env'
	docker container run --rm arg-demo:2.0 env

run-arg3:
	docker container run --rm --env lifecycle="test" arg-demo:3.0

clean-arg1:
	docker image rm arg-demo:1.0

clean-arg2:
	docker image rm arg-demo:2.0
