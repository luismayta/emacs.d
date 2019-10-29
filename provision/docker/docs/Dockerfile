FROM sphinxdoc/docker-ci

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME emacs.d-doc

ENV PACKAGES bash \
  git \
  gcc \
  libc-dev \
  make \
  musl-dev \
  openssl \
  gcc \
  libgdal20 \
  libev-dev

COPY Pipfile* /usr/src/

# set working directory to /usr/src
WORKDIR /usr/src

RUN  groupadd -g 500 -r python \
  && groupadd developer \
  && useradd -m -g developer -G python developer \
  && chown -R developer:python /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \
  && apt-get update -y \
  && apt-get install -y ${PACKAGES} \
  && pip3 install pipenv \
  && pipenv install --dev --skip-lock \
  && pipenv shell --fancy \
  && apt-get purge \
  && rm -rf /var/lib/apt/lists/*
