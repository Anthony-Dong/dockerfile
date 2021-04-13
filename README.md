> 日常使用的dockerfile镜像
## 1. Centos

### Quick start

```shell
docker pull fanhaodong/centos:7
```
### Feature

- version: 7
- alibaba yum 源
- net-tool 网络工具包
- git wget vim curl zsh
- htop、sysstat、iproute、dstat、tcpdump、telnet 监控和网络工具
- gcc tool

## 2. Golang

### Quick start

```shell
docker pull fanhaodong/golang:1.13.5
```
### Feature
- base image: `fanhaodong/centos:7`
- version: 1.13.5
- qconf: 1.2.1
- GOPROXY=https://goproxy.cn,direct

## Example

可以参考这个例子使用: [golang](./golang/example)
## 3. Open-jdk

### Quick start

```shell
docker pull fanhaodong/open-jdk:1.8.0
```
### Feature

- base image: `fanhaodong/centos:7`
- version: 1.8.0
- mvn: 3.6.3

## Example

可以参考这个例子使用: [jdk](./jdk/example)

## 4. Help

```shell
➜  dockerfile git:(main) ✗ make help 
 all                   构建和推送全部镜像
 login                 登陆docker
 centos                构建基础镜像 centos7
 golang                构建golang 1.13.5
 jdk                   构建 oepn-jdk 1.8.0
 VERSION               查看版本
 container_clear       清理docker已经停止的container
 image_clear           清理docker无用的images
 help                  帮助
```