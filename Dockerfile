FROM ruby:3.0

RUN apt-get update && apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./
COPY . .

RUN gem install bundler && bundle install

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "9292", "config.ru"]