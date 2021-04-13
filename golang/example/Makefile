.PHONY : all build run
all: build run
build:
	docker build -t go-example:latest .
run:
	docker run --rm -it -p 8080:8080 go-example:latest