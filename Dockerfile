FROM ubuntu:xenial
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
    dblatex \
    debianutils \
    diffstat \
    docbook-utils \
    dos2unix \
    doxygen \
    fop \
    g++-multilib \
    gawk \
    gcc-multilib \
    git \
    iputils-ping \
    libegl1-mesa \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
    locales \
    lsb-release \
    lzop \
    man \
    make \
    procps \
    pylint3 \
    python \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    screen \
    socat \
    sudo \
    texinfo \
    unzip \
    vim \
    wget \
    x11-utils \
    xmlto \
    xsltproc \
    xvfb \
    xz-utils \
    && rm -rf /var/lib/apt-lists/* \
    && echo "dash dash/sh boolean false" | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

RUN useradd -ms /bin/bash -p me me && \
	usermod -aG sudo me

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

RUN echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-nopassword

ENV LANG en_US.utf8

USER me
WORKDIR /home/me
