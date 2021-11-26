# Use the official Ruby runtime as the parent image
FROM ruby:2.7.5

WORKDIR /gem
COPY . /gem
RUN bundle install

CMD bundle exec rake spec
