require 'bundler'

# Load environment settings
env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Bundler.require(:default, env)

# Load application
Dir.glob('./app/{apis}/*.rb').each { |file| require file }
Dir.glob('./app/app.rb').each { |file| require file }
