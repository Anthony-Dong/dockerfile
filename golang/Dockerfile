FROM centos:7

## install golang 1.13.5
RUN yum install -y wget \
    && wget https://golang.org/dl/go1.13.5.linux-amd64.tar.gz -O /tmp/go1.13.5.linux-amd64.tar.gz \
    && tar -zxvf /tmp/go1.13.5.linux-amd64.tar.gz -C /usr/local
ENV PATH=${PATH}:/usr/local/go/bin

## update yum 更换阿里源
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && yum makecache \
    && yum -y update

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

## install gcc
RUN yum install -y gcc \
    automake \
    autoconf \
    libtool \
    make

## install qconf
RUN  wget https://github.com/Qihoo360/QConf/releases/download/1.2.1/QConf-1.2.1-1.el6.x86_64.rpm -O  /tmp/QConf-1.2.1-1.el6.x86_64.rpm \
    && rpm -ivh /tmp/QConf-1.2.1-1.el6.x86_64.rpm && ln -s /usr/local/qconf/lib/libqconf.so /usr/lib/libqconf.so && ldconfig

# GO ENV
ENV GOPROXY=https://goproxy.cn,direct

# 容器内项目地址
WORKDIR /data/project
COPY . .
RUN chmod +x run.sh

# 启动参数
ENTRYPOINT [ "./run.sh"]