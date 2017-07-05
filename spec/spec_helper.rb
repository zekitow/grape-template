require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'
require './config/env'
require './app/app'

def app
  APIs::App.new
end

module RSpecMixin
  include Rack::Test::Methods
end

RSpec.configure do | config | 
  config.include RSpecMixin

  # logging
  ActiveRecord::Base.logger = Logger.new(nil)

  # FactoryGirl configs and database cleaner
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    FactoryGirl.find_definitions
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


  # Rspec output config
  config.formatter =  :documentation
end
