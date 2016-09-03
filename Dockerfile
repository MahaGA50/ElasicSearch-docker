#
# Elasticsearch Dockerfile
#

# Pull base image.
FROM java:8

ENV ES_PKG_NAME elasticsearch-2.2.0
# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch && \
 cd /elasticsearch && \
 bin/plugin install mobz/elasticsearch-head && \
 bin/plugin install -b https://github.com/couchbaselabs/elasticsearch-transport-couchbase/releases/download/2.2.2.0/elasticsearch-transport-couchbase-2.2.2.0.zip

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /elasticsearch

# Define default command.
#CMD ["/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
#   - 9091:transport couchbase
EXPOSE 9200
EXPOSE 9300
EXPOSE 9091
