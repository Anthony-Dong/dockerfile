FROM fanhaodong/centos:7

## install golang 1.13.5
ARG GO_VERSOION=1.13.5
RUN wget https://golang.org/dl/go${GO_VERSOION}.linux-amd64.tar.gz -O /tmp/go{GO_VERSOION}.linux-amd64.tar.gz \
    && tar -zxvf /tmp/go{GO_VERSOION}.linux-amd64.tar.gz -C /usr/local \
    && rm -f /tmp/go{GO_VERSOION}.linux-amd64.tar.gz
ENV PATH=${PATH}:/usr/local/go/bin

# install qconf
RUN wget https://github.com/Qihoo360/QConf/releases/download/1.2.1/QConf-1.2.1-1.el6.x86_64.rpm -O  /tmp/QConf-1.2.1-1.el6.x86_64.rpm \
    && rpm -ivh /tmp/QConf-1.2.1-1.el6.x86_64.rpm && ln -s /usr/local/qconf/lib/libqconf.so /usr/lib/libqconf.so \
    && ldconfig \
    && rm -f /tmp/QConf-1.2.1-1.el6.x86_64.rpm

# Lang and timezone ENV
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN echo Asia/Shanghai > /etc/timezone  && ln -sf /usr/share/zoneinfo/$(cat /etc/timezone) /etc/localtime

# GO ENV
ENV GOPROXY=https://goproxy.cn,direct

# 启动参数
CMD ["/bin/bash"]