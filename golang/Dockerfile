FROM centos:7

# about me eamil
MAINTAINER fanhaodong516@gmail.com

## install golang 1.13.5
ARG GO_VERSOION=1.13.5
RUN yum install -y wget git\
    && wget https://golang.org/dl/go${GO_VERSOION}.linux-amd64.tar.gz -O /tmp/go{GO_VERSOION}.linux-amd64.tar.gz \
    && tar -zxvf /tmp/go{GO_VERSOION}.linux-amd64.tar.gz -C /usr/local \
    && rm -f /tmp/go{GO_VERSOION}.linux-amd64.tar.gz
ENV PATH=${PATH}:/usr/local/go/bin

## update yum repo
RUN rm -rf /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo \
    && curl -o /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo

## install 工具(添加工具较为灵活，所以在第三层，防止重复构建Go)
RUN yum install -y \
    net-tools \
    git \
    vim \
    zsh \
    htop \
    sysstat \
    iproute \
    dstat \
    telnet \
    wget \
    unzip \
    curl \
    tcpdump \
    lrzsz \
    openssh \
    openssh-clients \
    openssh-server

# install gcc
RUN yum install -y gcc \
    automake \
    autoconf \
    libtool \
    make


# install qconf
RUN  wget https://github.com/Qihoo360/QConf/releases/download/1.2.1/QConf-1.2.1-1.el6.x86_64.rpm -O  /tmp/QConf-1.2.1-1.el6.x86_64.rpm \
    && rpm -ivh /tmp/QConf-1.2.1-1.el6.x86_64.rpm && ln -s /usr/local/qconf/lib/libqconf.so /usr/lib/libqconf.so \
    && ldconfig \
    && rm -f /tmp/QConf-1.2.1-1.el6.x86_64.rpm

# Lang and timezone ENV
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN echo Asia/Shanghai > /etc/timezone  && ln -sf /usr/share/zoneinfo/$(cat /etc/timezone) /etc/localtime

# GO ENV
ENV GOPROXY=https://goproxy.cn,direct

# 容器内项目地址
WORKDIR /data/project
COPY . .
RUN chmod +x run.sh
# 启动参数
ENTRYPOINT ["./run.sh"]