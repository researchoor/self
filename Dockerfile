FROM ruby:2.7

COPY . /app
WORKDIR /app
RUN gem install bundler
RUN bundle install
RUN bundle exec jekyll build
CMD bundle exec jekyll serve --host 0.0.0.0