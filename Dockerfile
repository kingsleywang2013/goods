FROM ruby:2.5.1

# set the app directory var
ENV APP_HOME /home/app

WORKDIR $APP_HOME

RUN apt-get update -qq

# Install apt dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends apt-utils \
  build-essential \
  curl libssl-dev \
  git \
  unzip \
  zlib1g-dev \
  libxslt-dev \
  nodejs \
  mysql-client \
  vim


# install bundler
RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . .

EXPOSE 3000

CMD ["rails","server","-b","0.0.0.0"]
