FROM python:3.6.5

MAINTAINER Luis Mayta <@slovacus>

ARG stage
LABEL NAME zsh-flutter-check-$stage

COPY Pipfile Pipfile.lock /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN apt-get update \
  && apt-get -y install --no-install-recommends \
  # tools validation
  git-core \
  shellcheck \
  # install python dependencies
  # update pip
  && pip install --upgrade pip \
# install pipenv
  && pip install pipenv \
  && pipenv install --dev --ignore-pipfile --system \
  && apt-get purge \
  && apt-get autoremove  \
  && rm -rf /var/lib/apt/lists/*
