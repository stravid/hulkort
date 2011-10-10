require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  # This file is copied to spec/ when you run 'rails generate rspec:install'

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    # Mock Framework options are: mocha, flexmock or RR
    config.mock_with :rspec

    config.use_transactional_fixtures = true

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true

    # For original DatabaseCleaner setting watch github repo at https://github.com/bmabey/database_cleaner
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.logger = Rails.logger
  end

end

Spork.each_run do

  FactoryGirl.reload
  DatabaseCleaner.clean

end
