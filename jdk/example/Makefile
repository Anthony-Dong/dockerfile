.PHONY: all start build run
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
JAVA_OPTS := -Xms512m -Xmx512m -Xmn256m -Xss512k -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m -verbose:gc -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+DisableExplicitGC  -XX:CMSInitiatingOccupancyFraction=70 -XX:+UseCMSInitiatingOccupancyOnly -XX:+CMSParallelInitialMarkEnabled -XX:+PrintGCDetails -XX:+CMSScavengeBeforeRemark -XX:+PrintHeapAtGC -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError

all: start ## 默认启动Docker镜像

start: ## 启动docker镜像
	docker run --rm -it --cap-add=SYS_PTRACE -v ${HOME}/.m2:/root/.m2 -v $(PROJECT_DIR):/data/project --name jdk-example fanhaodong/open-jdk:1.8.0 /bin/bash -c "set -x && cd /data/project && make run main=com.example.Main"

build: ## 构建Java程序
	@if [ ! -d /data/project/bin ]; then mkdir /data/project/bin; fi
	mvn clean package -Dmaven.test.skip=true
	mv target/java-example-v1.0.0.jar ./bin/run.jar
	mv dependency-reduced-pom.xml ./bin/dependency-reduced-pom.xml

run: build ## 启动Java程序, eg: make run main=com.example.Main
	java $(JAVA_OPTS) -cp bin/run.jar $(main)


help: ## 帮助
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf " \033[36m%-20s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)	