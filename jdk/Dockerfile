FROM fanhaodong/centos:7

# install java
ARG OPEN_JDK_VERSOION=1.8.0
RUN yum install -y java-${OPEN_JDK_VERSOION}-openjdk-devel
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.282.b08-1.el7_9.x86_64
ENV CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
ENV PATH=${PATH}:${JAVA_HOME}/bin

# install  mvn
ARG MVN_VERSOION=3.6.3
RUN wget https://apache.mirror.digitalpacific.com.au/maven/maven-3/${MVN_VERSOION}/binaries/apache-maven-${MVN_VERSOION}-bin.tar.gz -O /tmp/apache-maven-${MVN_VERSOION}-bin.tar.gz \
    && tar -zxvf /tmp/apache-maven-${MVN_VERSOION}-bin.tar.gz -C /usr/local
ENV MAVEN_HOME=/usr/local/apache-maven-${MVN_VERSOION}
ENV PATH=${PATH}:${MAVEN_HOME}/bin

# Lang and timezone ENV
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN echo Asia/Shanghai > /etc/timezone  && ln -sf /usr/share/zoneinfo/$(cat /etc/timezone) /etc/localtime

COPY lib/settings.xml ${MAVEN_HOME}/conf/settings.xml

RUN ["/bin/bash"]