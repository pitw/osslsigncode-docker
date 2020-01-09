FROM ubuntu:18.04
MAINTAINER Simon Pedrett <admin@pitw.ch>

RUN sudo apt-get update \
    && apt-get install -y --no-install-recommends \
    osslsigncode \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
USER nobody
ENTRYPOINT ["osslsigncode"]
