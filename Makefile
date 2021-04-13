.PHONY: centos golang jdk VERSION
AUTHOR := fanhaodong

all: centos golang jdk ## 构建全部镜像

login: ## 登陆docker
	docker login

centos: ## 构建基础镜像 centos7
	docker build -t $(AUTHOR)/centos:7 ./centos

GOLANG_VERSION := 1.13.5
golang: ## 构建golang 1.13.5
	docker build -t $(AUTHOR)/golang:$(GOLANG_VERSION) ./golang
	docker push $(AUTHOR)/golang:$(GOLANG_VERSION)

OPEN_JDK_VERSION := 1.8.0
jdk: ## 构建 oepn-jdk 1.8.0
	docker build -t $(AUTHOR)/open-jdk:$(OPEN_JDK_VERSION) ./jdk
	docker push $(AUTHOR)/open-jdk:$(OPEN_JDK_VERSION)

VERSION: ## 查看版本
	@cat ./VERSION
	@echo ""
	@docker --version

container_clear: ## 清理docker已经停止的container
	@for item in $(shell docker ps -a | grep 'Exited' | awk '{print $$1}'); do docker rm $$item; done

image_clear: ## 清理docker无用的images
	@for item in $(shell docker images | grep 'none' | awk '{print $$3}'); do docker rmi $$item; done

help: ## 帮助
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf " \033[36m%-20s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)