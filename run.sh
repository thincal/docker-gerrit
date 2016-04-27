#!/bin/bash
docker rm -f thincal-gerrit

#docker run --name gerrit-ls -d -p 8080:80 -p 29418:29418 \
#    -e WEBURL=http://192.168.0.141:8080 \
#    -e AUTH_TYPE=HTTP \
#    -e HTTPD_LISTENURL=proxy-http://localhost:8080/ \
#    liusong/gerrit-docker:2.12

docker run --name thincal-gerrit \
    -v ~/gerrit_volume:/var/gerrit/review_site \
    -p 8081:80 -p 29419:29419 \
    -e SSH_PORT=29419 \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=http://192.168.0.141 \
    -e HTTP_PORT=8081 \
    -d thincal/gerrit-docker:2.12
