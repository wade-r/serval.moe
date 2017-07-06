FROM ruby:2.4-alpine

RUN apk update && apk add build-base postgresql-dev nodejs tzdata

ENV RAILS_ENV production

WORKDIR /app

ADD Gemfile /app
ADD Gemfile.lock /app

RUN bundle install --with production --without test development --deployment

ADD . /app

RUN bundle exec rake assets:precompile
