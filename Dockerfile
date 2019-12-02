# Use the official Ruby runtime as the parent image
FROM ruby

WORKDIR /gem
COPY . /gem
RUN bundle install

CMD bundle exec rake spec
