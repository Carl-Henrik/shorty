FROM ruby:2.2.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /shorty
WORKDIR /shorty
ADD Gemfile /shorty/Gemfile
ADD Gemfile.lock /shorty/Gemfile.lock
RUN bundle install
ADD . /shorty
