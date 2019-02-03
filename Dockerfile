FROM ruby:2.6

ENV APPDIR /usr/local/myapp

RUN apt-get update && \
    apt-get install -y vim less && \
    apt-get install -y build-essential libpq-dev && \
    apt-get install -y postgresql && \
    apt-get install -y nodejs && \
    gem install bundler && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

WORKDIR $APPDIR

ENV BUNDLE_GEMFILE=$APPDIR/Gemfile
