FROM ubuntu:18.04
MAINTAINER Simon Pedrett <admin@pitw.ch>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    osslsigncode \
    git \
    wget \
    && apt-get clean

WORKDIR /work
ENTRYPOINT ["osslsigncode"]
