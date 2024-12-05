FROM ruby:3.3.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl

# Tailwind CSS CLI をインストール
# RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64 \
#     && chmod +x tailwindcss-linux-x64 \
#     && mv tailwindcss-linux-x64 /usr/local/bin/tailwindcss

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
COPY . /myapp