require "bundler/capistrano"
set :application, "teatercamp.no"
role :app, application
role :web, application
role :db,  application, :primary => true
set :default_environment, { 'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :use_sudo, false
set :user, "andreas"
server '217.170.197.84',:web, :app,:db

set :deploy_to, "/home/andreas/www/#{application}"
set :deploy_via, :remote_cache

set :scm, :git
set :repository, "git://github.com/andreaslyngstad/Teatercamp3.git"
set :branch, "Nytt_design_2016"


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end 
end

after 'deploy:update_code', 'deploy:symlink_shared'
after "deploy", "deploy:cleanup"