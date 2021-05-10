.PHONY:

# 当前路径
PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# 软件的配置
MEMORY := 512m
# mysql版本
MYSQL_VERSION := 5.7
# redis 版本
REDIS_VERSION := 4.0
# es version
ES_VERSION := 6.8.8

# mysql port: 3306, user: root, passwd: 123456
# https://hub.docker.com/_/mysql
mysql:
	docker run -d --rm  --name mysql -m $(MEMORY) -v $(PROJECT_DIR)/data/mysql:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:$(MYSQL_VERSION) --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# https://hub.docker.com/_/redis
# port 6379, passwd: 123456
# docker exec -it redis redis-cli
redis:
	docker run -d --rm --name redis -m $(MEMORY) -p 6379:6379 -v $(PROJECT_DIR)/config/redis.conf:/usr/local/etc/redis/redis.conf redis:$(REDIS_VERSION) redis-server /usr/local/etc/redis/redis.conf

# rocket-mq 请使用这个项目搭建 https://github.com/Anthony-Dong/docker-rocketmq-cluster

# kafka 使用这个项目搭建 https://github.com/Anthony-Dong/docker-kafka-cluster

# es 搭建
es:
	# 创建网络
	@ if [ ! `docker network  inspect elasticsearch` ];then docker network create elasticsearch;fi
	# 创建es(signle-node)
	docker run -d  --rm --name elasticsearch -p 9200:9200 -p 9300:9300 --network elasticsearch -e "discovery.type=single-node" elasticsearch:$(ES_VERSION)
	# 创建kibana(web-console)
	docker run -d --rm --name kibana -p 5601:5601 --network elasticsearch  kibana:$(ES_VERSION)
