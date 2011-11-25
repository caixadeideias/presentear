require "bundler/capistrano"
load "deploy/assets"

# APP CONFIG
set :application, "presentear.me"
set :domain_name, "www.presentear.me"

# GIT CONFIG
set :scm, :git
set :repository,  "git@github.com:cxideias/presentear.git"
set :branch, "deploy"
set :deploy_via, :remote_cache

# SSH SETTINGS
set :user, "deploy"
set :deploy_to, "/home/#{user}/#{application}"
set :shared_directory, "#{deploy_to}/shared"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true

# ROLES
role :web, domain_name                           # Your HTTP server, Apache/etc
role :app, domain_name                           # This may be the same as your `Web` server
role :db,  domain_name, :primary => true         # This is where Rails migrations will run

# HOOKS

# after 'deploy:update_code' do
#   run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
# end

# before "deploy:assets:precompile", "bundle:install"

# TASKS

# namespace :db do
#   desc "seed database"
#   task :seed do
#     run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=production"
#   end
# end

# If you are using Passenger mod_rails uncomment this:  
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts