FROM ruby:2.3.1
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && apt-get install vim -y apache2 -y libpq-dev -y build-essential -y nodejs libxslt-dev -y libxml2-dev -y zlib1g-dev -y libgmp-dev -y libgmp3-dev -y
RUN mkdir event_scheduler 
WORKDIR /event_scheduler
ADD Gemfile /event_scheduler/Gemfile 
ADD Gemfile.lock /event_scheduler/Gemfile.lock 
RUN gem install rails
RUN gem install bundler
RUN gem install rmagick -v '2.16.0'
RUN bundle install 
ADD . /event_scheduler
EXPOSE 3000
CMD RAILS_ENV=production bundle exec rake db:create db:migrate && rails server -b 0.0.0.0