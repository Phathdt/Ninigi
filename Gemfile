source 'https://rubygems.org'

## Base libs
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'

## Healper gems
gem 'active_model_serializers', '~> 0.10.7'
gem 'devise-i18n'
gem 'fast_jsonapi', '~> 1.1.1'
gem 'figaro', '~> 1.1.1'
gem 'i18n'

## Authentication
gem 'devise', '~> 4.4.1'

## Authorization
gem 'pundit'
gem 'rolify'

## utilities
gem 'delayed_job_active_record'
gem 'geocoder', '~> 1.4.6'
gem 'html2slim'
gem 'rack-cors', '~> 1.0.2'
gem 'slim-rails'
gem 'state_machine'

group :development do
  gem 'byebug'
  gem 'foreman', '~> 0.82.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rails-erd', require: false
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

## Ruby version
ruby '2.4.1'
