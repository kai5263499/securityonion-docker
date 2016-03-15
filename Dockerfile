FROM ubuntu:14.04

MAINTAINER Wes Widner (kai5263499@gmail.com)

RUN echo "debconf debconf/frontend select noninteractive" | sudo debconf-set-selections && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get -y install python-software-properties software-properties-common && \
    add-apt-repository -y ppa:securityonion/stable && \
    apt-get update && \
    apt-get -y install securityonion-all syslog-ng-core && \
    mkdir -p /conf

COPY run.sh /run.sh


RUN chmod +x /run.sh

CMD /run.sh