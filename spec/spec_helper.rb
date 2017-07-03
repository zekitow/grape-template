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

RSpec.configure { |c| c.include RSpecMixin }