FROM ruby:2.7.2-alpine3.13

ARG WORKDIR

ENV  HOME=/${WORKDIR} \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo

WORKDIR ${HOME}

COPY Gemfile* ./

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs && \
  bundle install -j4

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
