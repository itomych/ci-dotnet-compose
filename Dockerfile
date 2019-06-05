FROM mcr.microsoft.com/dotnet/core/sdk:2.2

LABEL maintainer="Mikhail Merkulov <mikhail.merkulov@itomy.ch>"
ENV COMPOSE_VERSION 1.24.0
#install dependencies
RUN curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64 > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN apt-get update && apt-get install jq apt-transport-https ca-certificates curl gnupg-agent software-properties-common nginx -y --no-install-recommends && apt-get clean -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && apt-key fingerprint 0EBFCD88
RUN apt-get update && apt-get install python-pip docker-ce zip -y
RUN curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
RUN pip install awscli ansible --upgrade && apt-get clean -y
RUN dotnet tool install --global Amazon.Lambda.Tools --version 3.2.0
RUN wget https://releases.hashicorp.com/vault/1.1.1/vault_1.1.1_linux_amd64.zip -O vault.zip \
    &&  unzip vault.zip -d /usr/bin/ && rm vault.zip
ENV PATH=$PATH:~/.local/bin:~/.dotnet/tools
