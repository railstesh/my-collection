FROM ruby:3.0.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# nvm environment variables
ENV NODE_VERSION 16.15.1
ENV NVM_DIR=/root/.nvm

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# install node and npm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

# add node and npm to path so the commands are available
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# confirm installation
RUN node --version
RUN npm --version

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]