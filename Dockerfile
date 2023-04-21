FROM ruby:3.2.2-alpine3.17

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
