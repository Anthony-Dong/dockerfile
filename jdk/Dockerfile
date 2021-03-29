FROM centos:7

# about me eamil
MAINTAINER fanhaodong516@gmail.com

# install java
RUN yum install -y java-1.8.0-openjdk-devel

# install maven
RUN yum install -y wget \
    && wget https://apache.mirror.digitalpacific.com.au/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -O /tmp/apache-maven-3.6.3-bin.tar.gz \
    && tar -zxvf /tmp/apache-maven-3.6.3-bin.tar.gz -C /usr/local
ENV MAVEN_HOME=/usr/local/apache-maven-3.6.3
ENV PATH=${PATH}:${MAVEN_HOME}/bin

## update yum repo
RUN rm -rf /etc/yum.repos.d/*.repo \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo \
    && curl -o /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo

## install 工具(添加工具较为灵活，所以在第三层，防止重复构建Go)
RUN yum install -y \
    sudo \
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

# Lang and timezone ENV
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN echo Asia/Shanghai > /etc/timezone  && ln -sf /usr/share/zoneinfo/$(cat /etc/timezone) /etc/localtime

COPY lib/settings.xml ${MAVEN_HOME}/conf/settings.xml
ENV JAVA_HOME=${OLDPWD}
WORKDIR /data/project

ENTRYPOINT ["sh","-c"]