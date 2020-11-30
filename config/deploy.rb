lock '3.14.1'

set :application, 'sukusuku_ver2'
set :deploy_to, '/var/www/rails/sukusuku_ver2'
set :branch, 'main'

set :repo_url,  'git@github.com:SHOGOHORI/sukusuku_ver2.git'

set :linked_files, fetch(:linked_files, []).push('config/settings.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

set :default_env, {
  RAILS_ENV: "production",
  RAILS_MASTER_KEY: "5274ce73e59ca29c0502e933fffcabf1",
  rbenv_root: "/home/shogo/.rbenv",
  path: "/home/shogo/.rbenv/bin:$PATH",
  aws_access_key_id: "AKIARCPUWMFE6BPS7FFE",
  aws_secret_access_key: "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"
}

append :linked_files, 'config/credentials/production.key'

set :linked_files, fetch(:linked_files, []).push("config/master.key")
