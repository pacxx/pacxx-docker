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
      repo                                              \
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

# Add missing ccache links for standard compiler names
RUN set -ex;                                                            \
    mkdir -p /usr/local/lib/ccache;                                     \
    for name in cc c++; do                                              \
        ln -s ../../../bin/ccache /usr/local/lib/ccache/"$name";        \
    done

RUN adduser --disabled-password --home /ci --uid 50000 --gecos "" ci

COPY with-ci-ccache pacxx-sync-repo pacxx-standard-test /usr/local/bin/
USER ci
