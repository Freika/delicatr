source 'https://rubygems.org'

gem 'rails', '4.1.5'
gem 'pg'

# authentication && authorization
gem "devise"

gem "simple_form"
gem 'feedjira'
gem "pry"
gem 'will_paginate'
gem 'russian', '~> 0.6.0'
gem 'whenever', :require => false
gem 'readmorejs-rails'
gem "codeclimate-test-reporter", group: :test, require: nil
gem 'activerecord-reputation-system'
gem 'newrelic_rpm'
gem 'daemons', github: 'thuehlinger/daemons'

#js and relative stuff
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem "rspec-rails"
  gem 'spring'
  gem "factory_girl_rails", "~> 4.0"
  gem 'database_cleaner', '~> 1.3.0'
  gem 'guard-rspec', require: false
  gem 'cucumber-rails', :require => false
  gem 'quiet_assets'
  gem 'guard-cucumber'
  gem "launchy"
end

group :production do
  gem 'capistrano', github: 'capistrano/capistrano', ref: '96a16'
  gem 'unicorn'
end