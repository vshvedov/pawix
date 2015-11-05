FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-server-dev-9.4
RUN mkdir /pawix-bot
WORKDIR /pawix-bot
ADD . /pawix-bot
RUN bundle install
