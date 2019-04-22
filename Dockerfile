FROM ubuntu:18.04
MAINTAINER Aaron Madlon-Kay <aaron@madlon-kay.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    osslsigncode \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
USER nobody
ENTRYPOINT ["osslsigncode"]
