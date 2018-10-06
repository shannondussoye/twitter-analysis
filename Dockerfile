FROM ubuntu:14.10

MAINTAINER Real Python <info@realpython.com>

# initial update
RUN apt-get update -q

# install wget, java, and mini-httpd web server
RUN apt-get install -yq wget
RUN apt-get install -yq default-jre-headless
RUN apt-get install -yq mini-httpd

# install elasticsearch
RUN cd /tmp && \
    wget -nv https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-6.4.2.tar.gz && \
    tar zxf elasticsearch-6.4.2.tar.gz && \
    rm -f elasticsearch-6.4.2.tar.gz && \
    mv /tmp/elasticsearch-6.4.2 /elasticsearch

# install kibana
RUN cd /tmp && \
    wget -nv https://download.elasticsearch.org/kibana/kibana/kibana-6.4.2.tar.gz && \
    tar zxf kibana-6.4.2.tar.gz && \
    rm -f kibana-6.4.2.tar.gz && \
    mv /tmp/kibana-6.4.2 /kibana

# start elasticsearch
CMD /elasticsearch/bin/elasticsearch -Des.logger.level=OFF & mini-httpd -d /kibana -h `hostname` -r -D -p 8000

# expose ports
EXPOSE 8000 9200