# Gerrit Docker image

Basic content is from ["openfrontier gerrit"](https://github.com/openfrontier/docker-gerrit), where it is said that:
>  HTTP authentication is not possible

So this image is mainly adding the "HTTP AUTH" based on Openfrontier Gerrit.

## Setup HTTP auth option
    http_port=8089
    ssh_port=29418
    
    docker run --name thincal-gerrit \
    -p ${http_port}:80 -p ${ssh_port}:${ssh_port} \
    -e SSH_PORT=${ssh_port} \
    -e AUTH_TYPE=HTTP \
    -e HTTP_URL=http://192.168.0.141 \
    -e HTTP_PORT=${http_port} \
    -d thincal/gerrit-docker:2.12

> `SSH_PORT` must be same as the `-p SSH_PORT:SSH_PORT`

> `HTTP_PORT` must be same as the `-p HTTP_PORT:80`

> `HTTP_URL` `HTTP_PORT` is needed ONLY if using HTTP auth
