FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN npm install yarn -g
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY package.json /app/package.json
RUN yarn
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]