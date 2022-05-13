FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y locales
RUN sed -i 's/#.*ja_JP\.UTF/ja_JP\.UTF/' /etc/locale.gen
RUN locale-gen && update-locale LANG=ja_JP.UTF-8
RUN mkdir /gakkenid
WORKDIR /gakkenid
COPY . /gakkenid
RUN bundle install
