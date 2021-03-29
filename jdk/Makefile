.PHONY: all build run
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
HOME_DIR := $(shell echo $$HOME)

JAVA_OPTS := -Xms512m -Xmx512m -Xmn256m -Xss512k -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m -verbose:gc -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+DisableExplicitGC  -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:+CMSParallelInitialMarkEnabled -XX:+PrintGCDetails -XX:+CMSScavengeBeforeRemark -XX:+PrintHeapAtGC -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError

all: docker_run exec

init:
	docker build -t jdk1.8:latest .

# docker环境无法进行jmap操作
# https://www.cnblogs.com/thirteen-yang/p/14452199.html
docker_run:
	-docker stop jdk1.8
	-docker rm jdk1.8
	docker run --rm -it -d --cap-add=SYS_PTRACE -v $(HOME_DIR)/.m2:/root/.m2 -v $(PROJECT_DIR):/data/project --name jdk1.8 jdk1.8:latest top

exec:
	docker exec -it jdk1.8 /bin/bash

build:
	@if [ -e ./bin/app.jar ];then rm -f ./bin/app.jar; fi
	mvn package -Dmaven.test.skip=true
	mv target/java-example-v1.0.0.jar ./bin/run.jar
	mv dependency-reduced-pom.xml ./bin/dependency-reduced-pom.xml

run:
	java $(JAVA_OPTS) -cp bin/run.jar $(main)