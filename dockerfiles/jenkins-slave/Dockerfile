FROM jenkins/jnlp-slave:3.36-2
LABEL MAINTAINER="wwb<wwbgo@qq.com>" CREATEDATE="2020.1.8"

ENV chartrepo=http://192.168.50.39:8080 dockeruser=flexemci dockerpwd=Feshrd@2018 JENKINS_AGENT_WORKDIR=/data

USER root
WORKDIR /opt

COPY ./bin/helm-v2.16.1-linux-amd64.tar.gz helm-v2.16.1-linux-amd64.tar.gz
COPY ./bin/helm-push_0.8.1_linux_amd64.tar.gz helm-push_0.8.1_linux_amd64.tar.gz
COPY ./bin/kubectl kubectl
COPY ./bin/start.sh start.sh

RUN apt-get update && apt-get install -y zip unzip libxml2-utils vim && \
    chmod +x start.sh && \
	tar -xzvf helm-v2.16.1-linux-amd64.tar.gz && mv linux-amd64/helm /bin/helm && \
	chmod +x kubectl && mv kubectl /usr/local/bin/kubectl && \
	helm init --client-only && helm plugin install https://github.com/chartmuseum/helm-push && helm repo add flexemcharts $chartrepo && \
	mkdir ~/.kube && \
	rm -rf *.tar.gz /var/lib/apt/lists/*

COPY ./bin/config /root/.kube/config

USER ${user}

ENTRYPOINT ./start.sh