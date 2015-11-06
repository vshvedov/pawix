FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-server-dev-9.4
RUN mkdir /api
WORKDIR /api
ADD . /api
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN bundle install
