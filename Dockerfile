# Dockerfile
FROM ruby:2.7.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Install bundler
RUN gem install bundler:2.3.15

# Copy Gemfile first to leverage Docker cache
COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy the rest of the application
COPY . .

# Entrypoint script to fix Rails server PID issue
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["rerun", "bundle exec rails s -b 0.0.0.0 -p 3000"]
