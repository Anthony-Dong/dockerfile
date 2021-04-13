FROM centos:7

# about me eamil
MAINTAINER fanhaodong516@gmail.com

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
    tcpdump

# install gcc
RUN yum install -y gcc \
    automake \
    autoconf \
    libtool \
    make

CMD [ "/bin/bash" ]