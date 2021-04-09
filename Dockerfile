FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && apt-get install -y imagemagick \
    && mkdir /yu-blogs
WORKDIR /yu-blogs
COPY Gemfile /yu-blogs/Gemfile
COPY Gemfile.lock /yu-blogs/Gemfile.lock
RUN bundle install
COPY . /yu-blogs
RUN yarn install --check-files
RUN bundle exec rails webpacker:compile
RUN yarn add jquery

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
RUN mkdir -p tmp/sockets
CMD ["rails", "server", "-b", "0.0.0.0"]
