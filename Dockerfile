FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev unzip

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --without test

ADD https://github.com/hashicorp/envconsul/releases/download/v0.6.0/envconsul_0.6.0_linux_amd64.zip .
RUN unzip envconsul_0.6.0_linux_amd64.zip -d /usr/local/bin

RUN mkdir /src
ADD . /src
WORKDIR /src
EXPOSE 3000
ENV ORANGE stuff

RUN bundle exec rake assets:precompile --trace
