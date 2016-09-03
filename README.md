## Elasticsearch Dockerfile


1. Install [Docker](https://www.docker.com/).

### Usage

    docker run -d -p 9200:9200 -p 9300:9300 -p 9091:9091 <build-name>


After few seconds, open `http://<host>:9200` to see the result.
