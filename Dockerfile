FROM python:3.6.2-stretch
MAINTAINER david amick <docker@davidamick.com>

RUN cat /etc/ssl/certs/*.pem > /etc/ssl/certs/ca-certificates.crt

ADD http://stedolan.github.io/jq/download/linux64/jq /usr/local/bin/jq
RUN chmod +x /usr/local/bin/jq

ADD https://storage.googleapis.com/kubernetes-release/release/v1.7.3/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN pip install yq

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
