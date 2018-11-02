FROM microsoft/dotnet

LABEL maintainer "Mikhail Merkulov <mikhail.merkulov@itomy.ch>"

ENV COMPOSE_VERSION 1.22.0

RUN curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose