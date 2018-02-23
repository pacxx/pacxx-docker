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
      dh-autoreconf 					\
      libcurl4-gnutls-dev 				\
      libexpat1-dev 					\
      gettext libz-dev 					\ 
      libssl-dev					\
      ;                                                 \
    apt-get clean;                                      \
    rm -rf /var/lib/apt/lists/*

# Add missing ccache links for standard compiler names
RUN set -ex;                                                            \
    mkdir -p /usr/local/lib/ccache;                                     \
    for name in cc c++; do                                              \
        ln -s ../../../bin/ccache /usr/local/lib/ccache/"$name";        \
    done

# Build git with OpenSSL support
RUN git clone https://github.com/git/git; 	\
    cd git; 					\
    make configure;				\
    ./configure --with-openssl;			\
    make;					\
    apt-get remove git;				\
    make install;				\
    cd .. ;					\
    rm -rf ./git				

# Sync PACXX repo
RUN mkdir -p /pacxx ; cd /pacxx;                            \
    repo init -u https://github.com/pacxx/pacxx;            \
    repo sync;                                              \
    repo start master `repo forall -c 'echo "$REPO_PATH"'`; \
    repo status;

COPY with-ci-ccache pacxx-standard-test /usr/local/bin/ 
