source 'https://rubygems.org'
git_source(:github) {|repo| 'https://github.com/#{repo}.git'}

ruby '2.6.5'

#Básicos
gem 'rails', '~> 6.0.0'
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
gem 'activerecord-session_store'
gem 'validates_email_format_of'

#React
gem 'react-rails'

#Analisar Necessidade
gem 'simple_form'
gem 'sidekiq'
gem 'friendly_id', '~> 5.2.4'
gem 'faraday'
gem 'dotenv'
gem "sentry-raven"
gem 'rails_admin', '~> 2.0'

# gem 'geocoder'
# gem 'httparty'
# gem 'via_cep'
# gem 'kaminari'
# gem 'devise_invitable', '~> 1.7.5'
# gem 'paranoia', '~> 2.2'
# gem 'cocoon'
# gem 'aasm'
# gem 'merit', '~> 3.0.2'
# gem 'ransack'
# gem 'kaminari'
# gem 'activeadmin'
# gem 'pagarme'
# gem "cpf_cnpj"
# gem 'airbrake', '~> 5.0'
# gem "chartkick", '~> 2.2.0'
# gem 'groupdate'

#Básicos
group :production do
  gem 'aws-sdk-s3', require: false
end

group :development, :test, :production do
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'pry-byebug'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'faker'
  gem 'cpf_faker'
  gem 'rubycritic'
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
