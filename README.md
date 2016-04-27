# Gerrit Docker image

Basic content is from ["openfrontier gerrit"](https://github.com/openfrontier/docker-gerrit), where it is said that:
>  HTTP authentication is not possible

So this image is mainly adding the "HTTP AUTH" based on Openfrontier Gerrit.

## Setup HTTP auth option
    docker run --name thincal-gerrit \
    -p 8089:80 -p 29456:29456 \
    -e SSH_PORT=29456 \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=http://192.168.0.141 \
    -e HTTP_PORT=8089 \
    -d thincal/gerrit-docker:2.12

> `SSH_PORT` must be same as the `-p SSH_PORT:SSH_PORT`
> `HTTP_PORT` must be same as the `-p HTTP_PORT:80`
> `HTTP_URL` `HTTP_PORT` is needed ONLY if using HTTP auth
