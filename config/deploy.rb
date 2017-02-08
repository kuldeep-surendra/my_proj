# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "event-scheduler"
set :repo_url, "https://github.com/kuldeep-surendra/my_proj"
set :rbenv_ruby, '2.3.1'
# set :default_env, {
#   "PASSENGER_INSTANCE_REGISTRY_DIR" => "/var/run/passenger-instreg"
# }

# set :bundle_gemfile, -> { release_path.join('Gemfile') }
# set :bundle_dir, -> { shared_path.join('bundle') }
# set :bundle_flags, '--deployment --quiet'
# set :bundle_without, %w{production test}.join(' ')
# set :bundle_binstubs, -> { shared_path.join('bin') }
# set :bundle_roles, :all 
# set :bundle_bins, %w(gem rake rails)
# set :whenever_roles, :all 
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :log_level, :debug
# set :rbenv_path, '/home/deploy/.rbenv'
# set :keep_releases, 5


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
