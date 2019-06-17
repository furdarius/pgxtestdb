.PHONY: all
all: certs build run

.PHONY: run
certs:
	./gen_srt.sh

.PHONY: build
build:
	docker build -t pgxtestdb:latest .

.PHONY: run
run:
	docker run --rm --net=host -d --name pgxtestdb pgxtestdb:latest

.PHONY: clear
clear:
	docker stop pgxtestdb