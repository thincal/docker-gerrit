#!/bin/bash
docker rm -f ceyes-gerrit

web_port=8081
ssh_port=29418

docker run --name ceyes-gerrit \
    -v /home/ceyes/work/ci/gerrit/gerrit-repos:/var/gerrit/review_site \
    -p ${web_port}:80 -p ${ssh_port}:${ssh_port} \
    -e SSH_PORT=${ssh_port} \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=192.168.0.141 \
    -e HTTP_PORT=${web_port} \
    -d thincal/gerrit-docker:2.12
