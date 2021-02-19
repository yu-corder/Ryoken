FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /Ryoken
WORKDIR /Ryoken
COPY Gemfile /Ryoken/Gemfile
COPY Gemfile.lock /Ryoken/Gemfile.lock
RUN bundle install
COPY . /Ryoken
RUN yarn install --check-files
RUN bundle exec rails webpacker:compile
RUN yarn add jquery

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
RUN mkdir -p tmp/sockets
CMD ["rails", "server", "-b", "0.0.0.0"]
