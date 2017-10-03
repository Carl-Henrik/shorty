FROM ruby:2.2.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /shorty
WORKDIR /shorty
ADD Gemfile /shorty/Gemfile
ADD Gemfile.lock /shorty/Gemfile.lock
RUN bundle install
ADD . /shorty
RUN cp -f shorty/config/database.docker.yml shorty/config/database.yml
RUN shorty/rails db:create
RUN shorty/rails db:migrate
RUN shorty/rails db:migrate RAILS_ENV=test
