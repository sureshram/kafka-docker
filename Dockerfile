FROM centos:6

MAINTAINER suresh.r@metricstream.com

RUN yum -y install epel-release
RUN yum -y update

RUN mkdir /opt/software

WORKDIR /opt/software

ENV KAFKA_VERSION="0.9.0.0" SCALA_VERSION="2.11"

ADD download-kafka.sh /tmp/download-kafka.sh

# Install download tools and json parser
RUN yum install -y wget

RUN yum install -y jq

RUN yum install -y java-1.8.0-openjdk-devel

RUN /tmp/download-kafka.sh

RUN tar -xvzf /tmp/kafka_2.11-0.9.0.0.tgz -C /opt/software

EXPOSE 2181

# Start zookeeper
CMD bin/zookeeper-server-start.sh config/zookeeper.properties

