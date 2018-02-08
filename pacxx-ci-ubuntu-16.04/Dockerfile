FROM ubuntu:16.04

USER root
COPY rocm.gpg /etc/apt/trusted.gpg.d/
COPY rocm.list /etc/apt/sources.list.d/
RUN set -ex;                                            \
    export DEBIAN_FRONTEND=noninteractive;              \
    apt-get update;                                     \
    apt-get install --no-install-recommends --yes       \
      ca-certificates                                   \
      ccache                                            \
      cmake                                             \
      git                                               \
      libasio-dev                                       \
      libboost-dev                                      \
      libpapi-dev                                       \
      libtbb-dev                                        \
      make                                              \
      python                                            \
      rocm-dev                                          \
      ;                                                 \
    apt-get clean;                                      \
    rm -rf /var/lib/apt/lists/*

RUN set -ex;                                            \
    for name in cc c++; do                              \
        ln -s ../../bin/ccache /usr/lib/ccache/"$name"; \
    done

RUN adduser --disabled-password --home /ci --uid 50000 --gecos "" ci

COPY pacxx-sync-repo pacxx-standard-test /usr/local/bin/
USER ci

#

#RUN git clone --depth=1 https://zivgitlab.uni-muenster.de/HPC2SE-Project/pacxx-llvm.git /tmp/pacxx-llvm
#WORKDIR /tmp/pacxx-llvm

#RUN pacxx-standard-test
