FROM ubuntu:latest

RUN apt update && apt install tar curl jq git g++ clang make binutils autoconf automake \
    autotools-dev libtool pkg-config \
    zlib1g-dev libssl-dev libxml2-dev libev-dev \
    libevent-dev libjansson-dev \
    libc-ares-dev libjemalloc-dev libsystemd-dev \
    ruby-dev bison libelf-dev -y && \
    apt autoremove -y && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN RELEASE_URL=$(curl -s https://api.github.com/repos/nghttp2/nghttp2/releases/latest \
    | jq -r '.assets[] | select(.browser_download_url | endswith(".tar.gz")).browser_download_url') && \
    curl -sLo nghttp2.tar.gz "$RELEASE_URL" && \
    tar xf nghttp2.tar.gz  && \
    cd nghttp2* && \
    ./configure --enable-app && \
    make && \
    ln -s /nghttp2-1.64.0/src/h2load /usr/bin/h2load
