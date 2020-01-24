FROM ubuntu:bionic
MAINTAINER Nicolas Dechesne <nicolas.dechesne@linaro.org>

RUN apt-get update && \
    apt-get install -yq \
    apt-utils \
    bash \
    bc \
    bison \
    build-essential \
    chrpath \
    cpio \
    diffstat \
    dos2unix \
    doxygen \
    g++-multilib \
    gawk \
    git \
    libncurses5-dev \
    libssl-dev \
    locales \
    lzop \
    man \
    procps \
    python \
    python3 \
    screen \
    sudo \
    texinfo \
    wget \
    x11-utils \
    xvfb \
    && rm -rf /var/lib/apt-lists/* \
    && echo "dash dash/sh boolean false" | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN useradd -ms /bin/bash -p me me && \
	usermod -aG sudo me

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LANG en_US.utf8

USER me
WORKDIR /home/me
