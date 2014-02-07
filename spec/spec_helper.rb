# spec/spec_helper.rb

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Alias "it should behave like" to 2.13-like syntax.
  config.alias_it_should_behave_like_to 'expect_behavior', 'has behavior'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end # before suite

  config.after(:each) do
    DatabaseCleaner.clean
  end # after each
end # configure
