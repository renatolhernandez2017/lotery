source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'simplecov'
gem 'bootsnap', '>= 1.7.3', require: false
gem 'cocoon'
gem 'psych', '~> 2.0', '>= 2.0.17'
gem 'aws-sdk-sns'
gem 'bcrypt'
gem 'argon2'
gem 'twilio-ruby'
gem 'roo'
gem 'sinatra'
gem 'carrierwave', '~> 1.0'
gem 'pundit'

group :development, :test do
  gem 'better_errors'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rails-controller-testing', '~> 0.0.3'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop-rspec'
end

group :development do
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'rails-erd'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'rspec-json_expectations'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'active_model_serializers'
gem 'audited'
gem 'awesome_print'
gem 'bootstrap',         '~> 4.0.0.beta2.1'
gem 'cancancan',         '~> 2.0'
gem 'cookies_eu'
gem 'devise'
gem 'devise-i18n'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery_mask_rails', '~> 0.1.0'
gem 'kaminari'
gem 'omniauth-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'paranoia'
gem 'pg'
gem 'ransack'
gem 'rails-healthcheck'
gem 'rubocop', '~> 0.59.2', require: false
gem 'rollbar'
gem 'select2-rails'
gem 'simple_form'
gem 'typhoeus'
gem 'yui-compressor'
gem 'okcomputer'
gem 'mimemagic', '= 0.4.1'
gem 'mini_racer'
gem 'rake', '= 13.0.3'

# Essa gem ocasionou o seguinte erro local ao buildar o container:
# cannot open shared object file: No such file or directory - /usr/local/bundle/gems/ffi-1.15.5/lib/ffi_c.so
gem 'ffi'
