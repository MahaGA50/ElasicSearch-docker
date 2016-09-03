## Elasticsearch Dockerfile


1. Install [Docker](https://www.docker.com/).
2-(optional) Install Ansible

### Usage 
#### Using Ansible command
    
    ansible-playbook PlayBook.yml --extra-vars "VAR_CB_NAME=<username> VAR_CB_PASS=<passwd>"

#### OR Using docker commands
    docker build -t <build-name> .

    docker run -d -e CB_NAME=<username> -e CB_PASS=<passwd> -p 9200:9200 -p 9300:9300 -p 9091:9091 <build-name>


After few seconds, open `http://<host>:9200` to see the result.
