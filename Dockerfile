FROM ruby:2.6

ENV APPDIR=/usr/local/myapp

RUN apt-get update && \
    apt-get install -y vim less && \
    apt-get install -y build-essential libpq-dev && \
    apt-get install -y postgresql && \
    gem install bundler && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

RUN groupadd -r --gid 1000 rails && \
    useradd -m -r --uid 1000 --gid 1000 rails

USER rails
WORKDIR $APPDIR
