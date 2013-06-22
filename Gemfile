source 'http://rubygems.org'

gem 'rails', '3.2.13'

gem 'jquery-rails', '2.1.4' # jQuery v1.8.3, supports rails 4.0
gem 'clearance', '0.13.0'
gem 'airbrake'
gem 'unicorn'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

group :test do
  gem 'turn', require: false
  gem 'capybara'
  gem 'launchy'
  gem 'cucumber', '1.2.5'
  gem 'cucumber-rails', '1.3.0', require: false
  gem 'factory_girl_rails'
  gem 'spork', '> 0.9.0.rc'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.13'
  gem 'shoulda-matchers', '~>1.0'
  gem 'sqlite3', '1.3.5'
end

group :production do
  gem 'pg'
end
