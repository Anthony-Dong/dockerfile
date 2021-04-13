.PHONY : all build run
all: build run ## 启动项目
build: ## 编译镜像
	docker build -t go-example:latest .
run: ## 启动镜像
	docker run --rm -it -p 8080:8080 go-example:latest
help: ## 帮助
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf " \033[36m%-20s\033[0m  %s\n", $$1, $$2}' $(MAKEFILE_LIST)	