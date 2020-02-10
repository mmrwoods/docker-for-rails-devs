FROM ruby:2.6

LABEL maintainer="Mark Woods"

# Combine apt-get update and install to avoid caching the apt-get package index
# See https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs

# Copy Gemfile, Gemfile.lock and run bundle install before copying other
# application code so we can cache the gem bundle in a separate layer
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
