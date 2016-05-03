#!/bin/bash
docker rm -f ceyes-gerrit-cloud

web_port=8083
ssh_port=29420

docker run --name ceyes-gerrit-cloud \
    -v /home/dev/gerrit-volume-8083:/var/gerrit/review_site \
    -v /home/dev/gerrit-store/private/gerrit.passwords:/var/gerrit/private/gerrit.passwords \
    -p ${web_port}:80 -p ${ssh_port}:${ssh_port} \
    -e SSH_PORT=${ssh_port} \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=192.168.0.48 \
    -e HTTP_PORT=${web_port} \
    -d thincal/gerrit-docker:2.12
