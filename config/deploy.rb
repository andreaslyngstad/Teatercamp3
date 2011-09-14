require "bundler/capistrano"
set :application, "teatercamp.no"
role :app, application
role :web, application
role :db,  application, :primary => true

set :user, "teatercamp"
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

set :scm, :git
set :repository, "git://github.com/andreaslyngstad/Teatercamp3.git"
set :branch, "master"


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
namespace :bundler do
  desc "make the bundle"
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end
 
after 'deploy:update_code', 'bundler:bundle_new_release'
after 'deploy:update_code', 'deploy:symlink_shared'
after "deploy", "deploy:cleanup"