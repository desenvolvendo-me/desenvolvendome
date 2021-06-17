source 'https://rubygems.org'
git_source(:github) {|repo| 'https://github.com/#{repo}.git'}

ruby '2.6.5'

#Básicos
gem 'rails', '~> 6.0.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'font-awesome-sass', '~> 5.11.2'
gem 'devise'
gem 'omniauth-github'
gem 'redis-rails'
gem 'redis-rack'
gem 'validates_email_format_of'
gem "rubocop"
gem 'simple_form'
gem 'sidekiq', '< 6'
gem 'friendly_id', '~> 5.2.4'
gem 'faraday'
gem 'dotenv'
gem "sentry-raven"
gem 'kaminari'
gem 'ransack'
gem "ahoy_matey"
gem 'gravtastic'
gem 'paper_trail'

#Admin
gem 'activeadmin'
gem 'activeadmin_sidekiq_stats'
gem "chartkick", '~> 2.2.0'
gem 'groupdate'

gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

#Analisar Necessidade
# gem 'geocoder'
# gem 'httparty'
# gem 'via_cep'
# gem 'devise_invitable', '~> 1.7.5'
# gem 'paranoia', '~> 2.2'
# gem 'cocoon'
# gem 'aasm'
# gem 'merit', '~> 3.0.2'
# gem 'pagarme'
# gem "cpf_cnpj"
# gem 'airbrake', '~> 5.0'

#Básicos
group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test, :production do
  gem 'rspec-rails', '~> 4.0'
  gem 'database_cleaner'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'pry-byebug'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'faker'
  gem 'cpf_faker'
  gem 'rubycritic', require: false
  gem 'simplecov'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rack-mini-profiler', require: false
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'rails_layout'
  gem 'letter_opener_web'
  gem 'rails-erd'
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rake', require: false
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'chromedriver-helper'
  gem 'rspec-benchmark'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
