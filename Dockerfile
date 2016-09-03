#
# Elasticsearch Dockerfile
#

# Pull base image.
FROM java:8

ENV ES_PKG_NAME elasticsearch-2.3.5

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.5/$ES_PKG_NAME.deb && \
  dpkg -i $ES_PKG_NAME.deb && \
  service elasticsearch start

 # rm -f $ES_PKG_NAME.tar.gz && \
 # mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
#CMD ["service elasticsearch status"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
