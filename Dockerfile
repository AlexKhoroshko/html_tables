FROM ruby:3.0

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 9292

CMD ["rackup", "-o", "0.0.0.0", "-p", "9292", "config.ru"]