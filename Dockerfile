FROM ruby:3.3

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000

# Build into /tmp inside the container so no root-owned files land in the
# mounted repository; --force_polling makes file watching work on bind mounts.
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--force_polling", "--disable-disk-cache", "--destination", "/tmp/_site"]
