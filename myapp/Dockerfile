FROM ruby:2.6

# Add yarn package source, yarn is required for rails 6 webpacker install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs yarn

COPY . /usr/src/app

WORKDIR /usr/src/app
RUN bundle install
RUN rails webpacker:install
