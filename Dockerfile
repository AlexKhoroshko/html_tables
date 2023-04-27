FROM ruby:3

RUN apt-get update && apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 9292

CMD ["rackup", "config.ru", "-p", "9292", "-s", "thin", "-o", "0.0.0.0"]