FROM ubuntu:14.04

#tell debian based distros to forget about user input
ENV DEBIAN_FRONTEND noninteractive

#update the de distro and install some basic tools
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl git vim emacs

#Install java (curl command will certainly break if oracle changes his download policy)
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN curl -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.tar.gz >jdk-7u75-linux-x64.tar.gz
RUN mkdir -p /opt/java && \
    cd /opt/java && \
    tar xzvf /jdk-7u75-linux-x64.tar.gz && \
    rm /jdk-7u75-linux-x64.tar.gz
ENV PATH /opt/java/jdk1.7.0_75/bin:$PATH
ENV JAVA_HOME /opt/java/jdk1.7.0_75
