require "bundler/capistrano"
#load 'lib/deploy/seed' #include if you need to load seed data with cap deploy:seed

set :stages, %w(development staging production)
set :default_stage, "develop"
require 'capistrano/ext/multistage'
server "shpe-uiuc.org", :app, :web, :db, :primary => true
set :user, "deployer" # The server's user for deploys
set :scm_passphrase, "0ok9ij8uh" # The deploy user's password

set :application, "shpe"

set :use_sudo, false

default_environment["GEM_PATH"] ="/home/deployer/.rbenv/versions/1.9.3-p385/lib/ruby/gems/1.9.1:/home/deployer/.rbenv/shims/ruby"
default_environment["PATH"] = "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.rbenv/versions/1.9.3-p385/lib/ruby/gems/1.9.1:$PATH"

set :deploy_via, :remote_cache

after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy:update_code", "deploy:migrate"
after "deploy:cleanup", "deploy:seed"

set :scm, "git"
set :scm_verbose, true
set :repository, "git@github.com:seanfreiburg/shpe.git"


default_run_options[:pty] = true # Must be set for the password prompt from git to work
ssh_options[:forward_agent] = true

namespace :deploy do
# If you need to load seed data. Syntax: cap deploy:seed
  desc "Reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}" #restarts nginx
  end
end

