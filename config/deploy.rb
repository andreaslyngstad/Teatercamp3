# require 'capistrano/bundler'

# require 'capistrano/rails/migrations'
# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'teatercamp'
set :repo_url, 'git@github.com:andreaslyngstad/Teatercamp3.git'


# Default branch is :master
set :branch, '2016'

# Default deploy_to directory is /var/www/my_app_name

set :deploy_to, "/var/www/vhosts/teatercamp.no/httpdocs/teatercamp.no"

# Default value for :scm is :git
set :scm, :git
set :bundle_path, '/var/www/vhosts/teatercamp.no/httpdocs/teatercamp.no/gems'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
	  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end 

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
