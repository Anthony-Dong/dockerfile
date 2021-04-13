FROM fanhaodong/golang:1.13.5

# 容器内项目地址
WORKDIR /data/project
COPY . .

## 启动参数
ENTRYPOINT ["/bin/bash", "-c", "go build -v -race -ldflags '-s -w' -o bin/app cmd/main.go && bin/app"]