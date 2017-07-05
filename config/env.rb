require 'bundler'
require 'yaml'

# Load environment settings
env = ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development
Bundler.require(:default, env)

OTR::ActiveRecord.configure_from_file! "./config/database.yml"


config    = YAML.load_file('./config/config.yml')
$auth_username = config[env.to_s]['api']['username']
$auth_password = config[env.to_s]['api']['password']

# Load application
Dir.glob('./app/apis/{params}/*.rb').each { |file| require file }
Dir.glob('./app/{helpers,models,apis}/*.rb').each { |file| require file }
Dir.glob('./app/app.rb').each { |file| require file }
