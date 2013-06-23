source 'http://rubygems.org'

gem 'rails', '4.0.0.rc2'

gem 'jquery-rails', '2.1.4' # jQuery v1.8.3, supports rails 4.0
gem 'clearance', '1.0.0.rc7'
gem 'airbrake'
gem 'unicorn'

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'turn', require: false
  gem 'capybara'
  gem 'launchy'
  gem 'cucumber', '1.2.5'
  gem 'cucumber-rails', '1.3.0', require: false
  gem 'shoulda-matchers', '~>1.0'
  gem 'factory_girl_rails'
  gem 'spork', '> 1.0.0.rc'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.13'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
