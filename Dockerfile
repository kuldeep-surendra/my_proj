FROM ruby:2.2.3
RUN apt-get update && apt-get install vim -y apache2 -y libpq-dev -y build-essential -y nodejs
RUN mkdir event_scheduler 
WORKDIR /event_scheduler
ADD Gemfile /event_scheduler/Gemfile 
ADD Gemfile.lock /event_scheduler/Gemfile.lock 
RUN gem install rails
RUN gem install bundler
RUN bundle install 
ADD . /event_scheduler
EXPOSE 3000
CMD RAILS_ENV=production bundle exec rake db:create db:migrate && rails server -b 0.0.0.0