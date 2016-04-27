# Gerrit Docker image

Basic content is from ["openfrontier gerrit"](https://github.com/openfrontier/docker-gerrit), where it is said that:
>  HTTP authentication is not possible

So this image is mainly adding the "HTTP AUTH" based on Openfrontier Gerrit.

## Setup HTTP auth option
    docker run --name thincal-gerrit \
    -p 8080:80 -p 29418:29418 \
    -e SSH_PORT=29418 \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=http://192.168.0.141 \
    -e HTTP_PORT=8080 \
    -d thincal/gerrit-docker:2.12
  
  `HTTP_URL`,`HTTP_PORT` is needed if using HTTP auth.
