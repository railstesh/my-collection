FROM ruby:3.0.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app


EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
