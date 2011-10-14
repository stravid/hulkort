source 'http://rubygems.org'

gem 'rails'
gem 'jquery-rails'
gem 'pg'
gem 'clearance'
gem 'rack', '1.3.3' # limit version to 1.3.3 because of warning in v 1.3.4

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :test do
  gem 'turn', :require => false
  gem 'capybara'
  gem 'launchy'
  gem 'cucumber-rails', "~>1.1.0"
  gem 'factory_girl_rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i # Mac OSX 10
  gem 'spork', '> 0.9.0.rc'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'sqlite3'
end
