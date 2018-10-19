FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /mywebsite
WORKDIR /mywebsite
COPY Gemfile /mywebsite/Gemfile
COPY Gemfile.lock /mywebsite/Gemfile.lock
RUN bundle install
COPY . /mywebsite

# Define environment variable

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
