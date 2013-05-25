source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'simple_form'
gem "grackle"
gem "dalli"

gem 'pg'

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  # User-friendly object printing
  gem 'awesome_print'

  # Use jshint for javascript format checking
  gem 'jshint_on_rails'
  gem 'guard-jshint-on-rails'

  # Use Guard + Addons for automated test runs
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'growl'
  gem 'rb-fsevent' # guard dependency

  gem 'quiet_assets' # supress log entries for assets in dev

  # better error pages in dev
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers', '2.0.0'

  # Generating faked data or objects
  gem 'factory_girl_rails'
  gem 'faker'

  # Pry for debug
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-remote' # connect to pry remotely when running foreman
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'faker'
end
