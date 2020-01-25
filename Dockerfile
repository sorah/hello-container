FROM debian:stable

RUN apt-get update && apt-get install -y --no-install-recommends ruby-dev build-essential
RUN gem i --no-doc bundler -v '~> 2'
RUN mkdir /app
COPY Gemfile* /app/
ENV BUNDLE_PATH /gems
ENV BUNDLE_DEPLOYMENT 1
WORKDIR /app
RUN bundle install
COPY config.ru /app/
COPY REVISION /app/

CMD ["bundle", "exec", "puma", "-p", "8080", "-t", "2:2"]
