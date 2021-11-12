FROM ruby:3.0-alpine

WORKDIR /operator-build

COPY Gemfile .
COPY bundle_manifest.rb .

RUN bundle config set --local path 'vendor/bundle' && bundle install
RUN mkdir -p workspace && bundle exec ruby bundle_manifest.rb
