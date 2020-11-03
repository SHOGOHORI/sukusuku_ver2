source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'mysql2'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'turbolinks'
gem 'jbuilder'
# gem 'redis', '~> 4.0'
gem 'bcrypt'
gem 'therubyracer', platforms: :ruby
# gem 'image_processing', '~> 1.2'
gem 'bootsnap', require: false
gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap-sass'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'capybara'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
