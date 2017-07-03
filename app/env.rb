require 'bundler'
require 'ostruct'
require 'pathname'

# Dir.glob('./app/{apis}/*.rb').each { |file| require file }
# Load environment settings
Config = OpenStruct.new
Config.env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Config.root = Pathname.new(File.expand_path('../', __FILE__))

Bundler.require(:default, Config.env)

# Load application
Dir.glob('./app/{apis}/*.rb').each { |file| require file }
Dir.glob('./app/app.rb').each { |file| require file }
