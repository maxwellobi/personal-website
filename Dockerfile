FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /personalwebsite

WORKDIR /personalwebsite

COPY Gemfile /personalwebsite/Gemfile
COPY Gemfile.lock /personalwebsite/Gemfile.lock

RUN bundle install

COPY . /personalwebsite

# Define environment variable

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE max12345

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]