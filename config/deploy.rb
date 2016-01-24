require "bundler/capistrano"
set :application, "teatercamp.no"
role :app, application
role :web, application
role :db,  application, :primary => true
set :default_environment, { 'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :use_sudo, false
set :user, 'teatercamp'


set :deploy_to, "/var/www/vhosts/teatercamp.no/httpdocs/teatercamp.no"
set :deploy_via, :remote_cache
default_run_options[:pty] = true
set :scm, :git
set :repository, "git://github.com/andreaslyngstad/Teatercamp3.git"
set :branch, "2016"
set :bundle_path, '/var/www/vhosts/teatercamp.no/httpdocs/teatercamp.no/gems'

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