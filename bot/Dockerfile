FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /bot
WORKDIR /bot
ADD . /bot
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN bundle install
