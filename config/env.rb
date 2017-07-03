require 'bundler'

# Load environment settings
env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Bundler.require(:default, env)

OTR::ActiveRecord.configure_from_file! "./config/database.yml"

# Load application
Dir.glob('./app/{models,apis}/*.rb').each { |file| require file }
Dir.glob('./app/app.rb').each { |file| require file }
