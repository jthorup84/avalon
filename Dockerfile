FROM ruby:2.5.0-alpine3.7

WORKDIR /usr/src/app

RUN apk add --update --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  bash \
  curl \
  nodejs \
  git \
  jq \
  && rm -rf /var/cache/apk/*

RUN gem install \
  bundle \
  rails \
  --no-doc --no-lock

# Optimize bundle install to only run when gemfile changes
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["/usr/local/bundle/bin/bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

