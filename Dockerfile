#
# Elasticsearch-transport-couchbase plugin Dockerfile

# Pull base image.
FROM elasticsearch:2.3.5

ENV ES_VERSION 2.3.5
ENV CB_PASS $CB_PASS
ENV CB_NAME $CB_NAME

# Install Elasticsearch-transport-couchbase
RUN \
 bin/plugin install mobz/elasticsearch-head && \
 bin/plugin install -b https://github.com/couchbaselabs/elasticsearch-transport-couchbase/releases/download/2.$ES_VERSION/elasticsearch-transport-couchbase-2.$ES_VERSION.zip

# Mount elasticsearch.yml config
COPY config ./config

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
#   - 9091:transport couchbase
EXPOSE 9200 9300 9091

# Define default command.
CMD ["elasticsearch"]

