require 'rvm/capistrano'
require 'bundler/capistrano'

ssh_options[:forward_agent] = true
set :rvm_ruby_string, '2.1.0p0@delicatr'

set :application, "Delicatr"
set :repository,  "https://github.com/Freika/delicatr.git"
set :default_stage, "production"
# set :stages, %w(production)
set :use_sudo, false
set :user, 'frey' 
set :password, "P0stfr3ik0"

ssh_options[:paranoid] = false
set :domain, "82.196.7.222"
role :app, domain
role :web, domain
role :db, domain, :primary => true


set :scm, :git
set :normalize_asset_timestamps, false

set :rails_env, 'production'
set :branch, 'master'
set :deploy_to, "/var/www/apps/delicatr"
server '82.196.7.222', :web, :app, :db, :primary => true
