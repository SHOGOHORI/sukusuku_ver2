# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.14.1'

# Capistranoのログの表示に利用する
set :application, 'sukusuku_ver2'
set :deploy_to, '/var/www/rails/sukusuku_ver2'
set :branch, 'main'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:SHOGOHORI/sukusuku_ver2.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
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
  aws_access_key_id: ENV['AWS_ACCESS_KEY'],
  aws_secret_access_key: ENV['AWS_SECRET_KEY']
}

append :linked_files, 'config/credentials/production.key'

set :linked_files, fetch(:linked_files, []).push("config/master.key")
