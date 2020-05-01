# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.5.1p57 
  
* Ruby on Rails version 
  Rails 6.0.2.2
  
* rbenv version
  rbenv 1.1.0-2-g4f8925a
  
* System dependencies
  Ubuntu 16-04
  sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev gcc-multilib g++-multilib 
  
* Instalation
 
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  
  source ~/.bashrc
  
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  
  rbenv install 2.5.1
  
  echo "gem: --no-document" > ~/.gemrc
  
  gem install bundler
  
  Clone the Project and cd into the project dir
  
  bundler
  
  bundle exec rake db:migrate
  
  rails s -b <localIP> -p <Port>
  
* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
