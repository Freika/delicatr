require 'rvm/capistrano'
require 'bundler/capistrano'

ssh_options[:forward_agent] = true
set :rvm_ruby_string, '2.1.0p0@delicatr'

set :application, "Delicatr"
set :repository,  "https://github.com/Freika/delicatr.git"
set :default_stage, "production"
# set :stages, %w(production)
set :use_sudo, false
set :user, 'frey' # нужно предварительно создать юзера на сервере, юзать root'a не стоит



set :scm, :git
set :normalize_asset_timestamps, false

set :rails_env, 'production'
set :branch, 'master'
set :deploy_to, "/root/delicatr"
server '82.196.7.222', :web, :app, :db, :primary => true
