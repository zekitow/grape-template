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
  config.formatter =  :documentation
  config.include RSpecMixin
  config.after(:all) { DatabaseCleaner.clean_with(:truncation) }
  ActiveRecord::Base.logger = Logger.new(nil)
end
