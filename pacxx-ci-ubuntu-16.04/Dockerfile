FROM ubuntu:16.04

USER root
COPY rocm.gpg /etc/apt/trusted.gpg.d/
COPY rocm.list /etc/apt/sources.list.d/
RUN set -ex;						\
    export DEBIAN_FRONTEND=noninteractive;		\
    apt-get update;					\
    apt-get install --no-install-recommends --yes	\
      libasio-dev					\
      libpapi-dev					\
      libtbb-dev					\
      rocm-dev						\
      ;							\
    apt-get clean;					\
    rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --home /ci --uid 50000 ci

COPY pacxx-standard-test /usr/local/bin/
USER ci
