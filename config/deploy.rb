# config valid for current version and patch releases of Capistrano
lock "3.10.1"

set :application, "f_rails"
set :repo_url, "git@github.com:nishide-h/f_rails.git"

# task :update do
#   run_locally do
#     application = fetch :application
#     if test "[ -d #{application} ]"
#       execute "cd #{application}; git pull"
#     else
#       execute "git clone #{fetch :repo_url} #{application}"
#     end
#   end
# end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/home/nishide/public_html/nishide.tk/public/f_rails"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true # sudoが実行できるように

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :ssh_options, :port => "4649"

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'

set :rbenv_prefix, "#{fetch(:rbenv_path)}/shims/bundle exec"

set :pid_file, "tmp/pids/puma.pid"
set :port, '3000'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system') 

set :bundle_jobs, 4


namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:web) do
      execute "cd /home/nishide/public_html/nishide.tk/public/f_rails && kill -SIGTERM 'cat #{fetch(:pid_file)}'" if File.exists?("/home/nishide/public_html/nishide.tk/public/f_rails/#{fetch(:pid_file)}")
      execute "cd /home/nishide/public_html/nishide.tk/public/f_rails && (nohup #{fetch(:rbenv_prefix)} bundle exec rails s -e #{fetch(:rails_env)} --port=#{fetch(:port)} -b 0.0.0.0 &) >& /dev/null"
    end
  end
  
  after :publishing, :restart
end
