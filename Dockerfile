FROM debian:jessie
MAINTAINER Pat Bribin <pat@codeclimate.com>

ENV COMPLEXITY_VERSION=1.2
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y \
    autogen \
    build-essential \
    curl \
    jq \
    xz-utils && \
  cd /tmp && \
  curl \
    --location --remote-name --silent \
    http://ftpmirror.gnu.org/complexity/complexity-${COMPLEXITY_VERSION}.tar.xz && \
  tar Jxf complexity-${COMPLEXITY_VERSION}.tar.xz && \
  cd complexity-${COMPLEXITY_VERSION} && \
  ./configure \
    --disable-dependency-tracking \
    --disable-silent-rules \
    --prefix=/usr/local && \
  make install && \
  apt-get remove -y --purge \
    build-essential \
    curl \
    xz-utils && \
  apt-get autoremove -y && \
  rm -rf /tmp/complexity-* && \
  rm -rf /var/lib/apt/lists/*

RUN adduser \
  --uid 9000 \
  --home /home/app \
  --disabled-password \
  --gecos "" app

USER app
WORKDIR /home/app

VOLUME /code
WORKDIR /code

COPY files /
CMD ["/home/app/engine"]
