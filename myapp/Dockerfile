FROM ruby:2.6

# Add yarn package source, yarn is required for rails 6 webpacker install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Combine apt-get update and install to avoid caching the apt-get package index
# See https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs yarn

COPY . /usr/src/app

WORKDIR /usr/src/app
RUN bundle install
RUN rails webpacker:install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]