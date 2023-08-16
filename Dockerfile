# Use the official Ruby runtime as the parent image
FROM ruby:3.2.2

WORKDIR /gem
COPY . /gem
RUN bundle install

CMD bundle exec rake spec
