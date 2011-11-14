source 'http://rubygems.org'

gem 'rails'
gem 'jquery-rails'
gem 'pg'
gem 'clearance'
gem 'airbrake'
gem 'unicorn'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'turn', '< 0.8.3', :require => false # Turn v0.8.3 has a wrong dependency on minitest
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
  gem 'libnotify'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'sqlite3'
  gem 'heroku'
end
