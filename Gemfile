source 'https://rubygems.org'

## Base libs
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'

## Healper gems
gem 'active_model_serializers', '~> 0.10.7'
gem 'devise-i18n'
gem 'fast_jsonapi', git: 'https://github.com/fongfan999/fast_jsonapi', branch: 'feature/add-scope'
gem 'figaro', '~> 1.1.1'
gem 'i18n'

## Authentication
gem 'devise', '~> 4.4.1'

## Authorization
gem 'pundit'
gem 'rolify'

## utilities
gem 'aasm'
gem 'delayed_job_active_record'
gem 'geocoder', '~> 1.4.6'
gem 'kaminari', '~> 1.1.1'
gem 'paranoia', '~> 2.4.0'
gem 'rack-cors', '~> 1.0.2'
gem 'slim-rails'
gem 'counter_culture'

## images and assset
gem 'aws-sdk'
gem 'mini_magick'
gem 'paperclip'

group :development do
  gem 'bullet', '~> 5.5', '>= 5.5.1'
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

group :test do
  gem 'database_cleaner'
  gem 'faker', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock'
end

## Ruby version
ruby '2.4.1'
