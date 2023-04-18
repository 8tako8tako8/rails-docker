FROM node:16 as build-stage

FROM ruby:3.0.2

# Install Node.js and Yarn
RUN mkdir -p /opt
COPY --from=build-stage /opt/yarn-* /opt/yarn
COPY --from=build-stage /usr/local/bin/node /usr/local/bin/
COPY --from=build-stage /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

# Setup Rails App
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
