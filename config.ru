$:.unshift File.expand_path '..', __FILE__

require './config/env'
require './app/app'

run APIs::App