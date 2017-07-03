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

  # logging and database configs
  config.after(:all) { DatabaseCleaner.clean_with(:truncation) }
  ActiveRecord::Base.logger = Logger.new(nil)

  # FactoryGirl configs
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  # Rspec output config
  config.formatter =  :documentation
end
