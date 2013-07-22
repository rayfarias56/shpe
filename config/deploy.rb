require "bundler/capistrano"

set :application, "shpe"

set :user, "sean"
set :use_sudo, false

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :repository,  "git@github.com:seanfreiburg/shpe.git"
set :branch, "branch"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true


set :deploy_to, "/var/www/apps/#{application}"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "seanfreiburg.com", :app, :web, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end

after 'deploy:update_code', 'deploy:migrate'

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

